<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style type="text/css">

	.myclass{
		margin: 0 auto;
	}
	
	
</style>

</head>
<body>
	
	<%
		session.removeAttribute("u");
		session.invalidate();
	
		String username="",password="";
		
		try{
		
		Cookie ck[] = request.getCookies();
		
			for(Cookie c:ck){
			
				if(c.getName().equals("un")){
					username = c.getValue();
				}
			
				else if(c.getName().equals("pwd")){
					password = c.getValue();
				}
			}
		}
	
		catch (Exception e){
			System.out.print(e);
		}
	
	%>
	
	<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	
	<form action="LoginServlet" method="post" class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
		
		<div class="form-group">
		<label>UserName</label>
		<input type="text" name="name" class="form-control" value="<%= username %>" placeholder="Enter User Name" />
		</div>
		
		
		<div class="form-group">
		<label>Password</label>
		<input type="password" name="password" class="form-control" value="<%= password %>"placeholder="Enter Password" />
		</div>
		
		<div class="form-group">
		<a href="collectemail.jsp">Forgot Password ?</a>
		
		</div>
		
		<div class="form-group">
		<input type="submit" value="Login" class="btn btn-primary btn-block"/>
		<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</div>
		
	</form>
	
	
	</div>
</body>
</html>