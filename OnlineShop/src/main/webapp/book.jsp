<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
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
	
	
	<div class="container">
		<div class="row">
			<c:forEach items="${rs.rows}" var="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" >
					
					<a href="book.jsp?bookid=${row.bookid }"><img src="ImageServlet?bookid=${row.bookid}" class="col-lg-12" /></a>
					
				</div>
				
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				
					<h3 class="col-lg-12">${row.bookname}</h3>
					<h5 class="col-lg-12">Rs. ${row.author}</h5>
					<h5 class="col-lg-12">Rs. ${row.price}</h5>
					
					<form action="AddToCartServlet" method="post">
					
					<input type="text" name="bookid" value="${row.bookid }" hidden /> 
					Quantity<input type="text" name="qty" /> 
					<input type="submit" value="Add To Cart" class="btn btn-success btn-block" />
					</form>
					
					
					<c:if test="${row.price>0 }">
					<a href="OrderController" target="_blank" class="btn btn-primary btn-block">Buy</a>
					</c:if>
					
					<c:if test="${row.price<=0 }">
					<a href="${row.link}" target="_blank" class="btn btn-secondary btn-block">Read</a>
					</c:if>
					
					<c:if test="${u.role=='admin'}">
					
						<a href="edit.jsp?bookid=${row.bookid}" class="btn btn-danger btn-block">Edit</a>
					
						<a href="DeleteServlet?bookid=${row.bookid}" class="btn btn-warning btn-block">Delete</a>
					
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>