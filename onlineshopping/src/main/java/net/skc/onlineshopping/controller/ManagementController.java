package net.skc.onlineshopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.skc.onlineshopping.util.FileUploadUtility;
import net.skc.onlineshopping.validator.ProductValidator;
import net.skc.shoppingbackend.dao.CategoryDAO;
import net.skc.shoppingbackend.dao.ProductDAO;
import net.skc.shoppingbackend.dto.Category;
import net.skc.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping(value="/products")
	public ModelAndView showManageProducts(@RequestParam(name="operation", required=false) String operation) {
		
		ModelAndView mv = new ModelAndView("page");	
		
		mv.addObject("title","Product Management");		
		mv.addObject("userClickManageProduct",true);
		
		Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		nProduct.setSupplierId(1);
		nProduct.setActive(true);

		mv.addObject("product", nProduct);
		
		if(operation != null) {
			if(operation.equals("product")) {
				mv.addObject("message", "Product Submitted Successfully");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value="/products", method=RequestMethod.POST)
	public String handleProductSumission(@Valid @ModelAttribute("product") Product mProduct,  BindingResult results, Model model, HttpServletRequest request) {
		
		logger.info(mProduct.toString());
		
		// mandatory file upload check
		if(mProduct.getId() == 0) {
			new ProductValidator().validate(mProduct, results);
		}
		else {
			// edit check only when the file has been selected
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results);
			}			
		}
		
		if(results.hasErrors()) {
			model.addAttribute("message", "Validation fails for adding the product!");
			model.addAttribute("title","Product Management");		
			model.addAttribute("userClickManageProduct",true);
			return "page";
		}			

		//create a new record
		productDAO.add(mProduct);
		
		 //upload the file
		 if(!mProduct.getFile().getOriginalFilename().equals("") ){
			 FileUploadUtility.uploadFile(request, mProduct.getFile(), mProduct.getCode()); 
		 }
		
		return "redirect:/manage/products?operation=product";
	}
	
	@RequestMapping(value = "/product/{id}/activation", method=RequestMethod.GET)
	@ResponseBody
	public String handleProductActivation(@PathVariable("id") int id) {		
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();
		product.setActive(!isActive);
		productDAO.update(product);		
		return (isActive)? "You have successfully deactivated the product with id " + product.getId() + ".": 
						   "You have successfully activated the product with id " + product.getId() + ".";
	}
	
	
	//returning the categories for all the request mapping
	@ModelAttribute("categories") 
	public List<Category> modelCategories() {
		return categoryDAO.list();
	}
}
