<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	    
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
	
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost:3306/demo"
						user="root"
						password="admin"
						var="con"
						/>
	
	<sql:query var="rs" dataSource="${con}">
	
			select * from books where bookid = ?
			<sql:param>${param.bookid}</sql:param>
			
	</sql:query>
	
	<c:forEach items="${rs.rows}" var="row">
	<form action="UpdateBookServlet" method="post" class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
		
		<div class="form-group">
		<label>Book Name</label>
		<input type="text" name="bookname" class="form-control" value="${row.bookname}" placeholder="Enter Book Name" />
		</div>
		
		<div class="form-group">
		<label>Book ID</label>
		<input type="number" name="bookid" class="form-control" value="${row.bookid}" placeholder="Enter Book ID" />
		</div>
		
		<div class="form-group">
		<label>Author Name</label>
		<input type="text" name="author" class="form-control" value="${row.author}" placeholder="Enter Author Name" />
		</div>
		
		<div class="form-group">
		<label>Book Price</label>
		<input type="text" name="price" class="form-control" value="${row.price}" placeholder="Enter Book Price" />
		</div>
		
		<div class="form-group">
		<label>Book Link</label>
		<input type="text" name="link" class="form-control" value="${row.link}" placeholder="Enter Book Link" />
		</div>
		
		
		
		<div class="form-group">
		<input type="submit" value="Update" class="btn btn-primary btn-block"/>
		<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</div>
		
	</form>
	</c:forEach>
	
	</div>
	
</body>
</html>