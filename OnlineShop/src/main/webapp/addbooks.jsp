<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>

<style type="text/css">

	.myclass{
		margin: 0 auto;
	}
	
	
</style>

</head>
<body>
	
	
	
	<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	
	<form action="AddBookServlet" method="post" enctype = "multipart/form-data" class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
		
		<div class="form-group">
		<label>Book Name</label>
		<input type="text" name="bookname" class="form-control" placeholder="Enter Book Name" />
		</div>
		
		<div class="form-group">
		<label>Author Name</label>
		<input type="text" name="author" class="form-control" placeholder="Enter Author Name" />
		</div>
		
		<div class="form-group">
		<label>Book Price</label>
		<input type="text" name="price" class="form-control" placeholder="Enter Book Price" />
		</div>
		
		<div class="form-group">
		<label>Book Link</label>
		<input type="text" name="link" class="form-control" placeholder="Enter Book Link" />
		</div>
		
		<div class="form-group">
		<label>Select Image</label>
		<input type="file" name="image" class="form-control" placeholder="Select Image" />
		</div>
		
		<div class="form-group">
		<input type="submit" value="Submit" class="btn btn-primary btn-block"/>
		<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</div>
		
	</form>
	
	
	</div>
	
</body>
</html>