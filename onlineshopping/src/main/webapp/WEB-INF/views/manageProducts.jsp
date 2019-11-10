<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row">
	
	<c:if test="${not empty message}">
		<div class="col-xs-12">
			<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message}
			</div>
		</div>	
	</c:if>
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>
				<div class="panel-body">
					<!-- FORM ELEMENT -->
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/products" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter Product Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="name" id="name" class="form-control" placeholder="Product Name" /> 
								<sf:errors path="name" cssClass="help-block" element="em"/> 
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter Brand Name: </label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand" class="form-control" placeholder="Brand Name" /> 
								<sf:errors path="brand" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="description">Product Description: </label>
							<div class="col-md-8">
								<sf:textarea type="text" path="description" id="description" class="form-control" placeholder="Write A Description" />					
								<sf:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter Unit Price: </label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice" class="form-control" placeholder="Unit Price" /> 
								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity Available: </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity" class="form-control" placeholder="Enter Quantity" /> 
								<sf:errors path="quantity" cssClass="help-block" element="em"/> 
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="file">Select an Image: </label>
							<div class="col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" /> 
								<sf:errors path="file" cssClass="help-block" element="em"/> 
							</div>
						</div>						
						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">Select Category: </label>
							<div class="col-md-8">
								<sf:select path="categoryId" id="categoryId" class="form-control" 
								 items="${categories}" itemLabel="name" itemValue="id" />
							</div>
						</div>												
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8" >
								<input type="submit" name="submit" id="submit" class="btn btn-primary" value="Submit" />
								<sf:hidden path="id"/>
								<sf:hidden path="code"/>
								<sf:hidden path="supplierId"/>
								<sf:hidden path="purchases"/>
								<sf:hidden path="active"/>
								<sf:hidden path="views"/>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

	<div class=row>
		<div class="col-xs-12">
			<h1>Available Products</h1>
			<hr/>
		</div>
	</div>
	<div class="row">
		<div class='col-xs-12'>
			<div style="overflow:auto">
				<table id="adminProductsTable" class="table table-condensed table-bordered">
					<thead>					
						<tr>					
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Activate</th>				
							<th>Edit</th>
						</tr>					
					</thead>
					<tfoot>
						<tr>					
							<th>Id</th>
							<th>&#160;</th>
							<th>Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Unit Price</th>
							<th>Activate</th>				
							<th>Edit</th>
						</tr>									
					</tfoot>
				</table>
			</div>
		</div>
	</div>

</div>