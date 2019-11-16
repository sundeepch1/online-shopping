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
					<sf:form id="categoryForm" class="form-horizontal" modelAttribute="category" action="${contextRoot}/manage/category" method="POST">
						<div class="form-group">
							<label class="control-label col-md-4">Category Name</label>
							<div class="col-md-8 validate">
								<sf:input type="text" path="name" class="form-control"
								placeholder="Category Name" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Category Description</label>
							<div class="col-md-8 validate">
								<sf:textarea path="description" class="form-control"
								placeholder="Enter category description here!" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-4">
								<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
	
	
</div>