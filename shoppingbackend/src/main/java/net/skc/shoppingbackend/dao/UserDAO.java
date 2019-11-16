package net.skc.shoppingbackend.dao;

import java.util.List;

import net.skc.shoppingbackend.dto.Address;
import net.skc.shoppingbackend.dto.Cart;
import net.skc.shoppingbackend.dto.User;

public interface UserDAO {
	// user related operation
	User getByEmail(String email);
	User get(int id);
	boolean addUser(User user);
	
	Address getAddress(int addressId);
	boolean addAddress(Address address);
	boolean updateAddress(Address address);
	Address getBillingAddress(User user);
	Address getBillingAddress(int userId);
	List<Address> listShippingAddresses(User user);
	List<Address> listShippingAddresses(int userId);
}
