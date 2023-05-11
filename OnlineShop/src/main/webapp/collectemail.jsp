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
	
	
	<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	
	<form action="SendOtpServlet" method="post" class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
		
		<div class="form-group">
		<label>Email</label>
		<input type="email" name="email" class="form-control" placeholder="Enter Your Email" />
		</div>
		
		
		<div class="form-group">
		<input type="submit" value="Send OTP" class="btn btn-primary btn-block"/>
		<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</div>
		
	</form>
	
	
	</div>
</body>
</html>