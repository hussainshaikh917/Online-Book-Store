<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check OTP</title>

<style type="text/css">

	.myclass{
		margin: 0 auto;
	}
	
	
</style>

</head>
<body>
	
	
	<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	
	<form action="CheckOtpServlet" method="post" class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
		
		<div class="form-group">
		<label>Enter OTP</label>
		<input type="text" name="otp" class="form-control" placeholder="Enter OTP" />
		</div>
		
		
		<div class="form-group">
		<input type="submit" value="Confirm OTP" class="btn btn-primary btn-block"/>
		<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</div>
		
	</form>
	
	
	</div>
</body>
</html>