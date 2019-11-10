<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Online Shopping Website Using Spring MVC and Hibernate">
<meta name="author" content="Sundeep Chaurasiya">

<title>Online Shopping - ${title}</title>

<script type="text/javascript">
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable theme CSS -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<!-- Bootstrap DataTables -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <a class="navbar-brand" href="${contextRoot}/home">Home</a>
	            </div>
			</div>
		</nav>

		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="jumbotron">
							<h1>${errorTitle}</h1>
							<hr/>
							<blockquote style="word-wrap:break-word">
								${errorDescription}
							</blockquote>						
						</div>
					</div>					
				</div>
			</div>
		</div>

		<!-- Footer comes here -->
		<%@include file="./shared/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>
		
		<!-- jQuery DataTable -->
		<script src="${js}/jquery.dataTables.js"></script>
		
		<!-- DataTable Bootstrap Script -->
		<script src="${js}/dataTables.bootstrap.js"></script>

		<!-- Self coded JS -->
		<script src="${js}/myapp.js" type="text/javascript"></script>

	</div>
</body>

</html>