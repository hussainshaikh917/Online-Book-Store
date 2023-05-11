<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<style type="text/css">

	.myclass{
		margin: 0 auto;
	}
	

</style>

</head>
<body>
	
	<script>
		
		function myfunction(element){
			
			var url = "ValidateServlet?value="+element.value +"&id="+element.id;
			var xhttp = new XMLHttpRequest();
			
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			     document.getElementById("msg"+element.id).innerHTML = this.responseText;
			    }
			  };
			  xhttp.open("GET",url);
			  xhttp.send();
		}
		
	</script>
	
	<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	
	<form action="RegistrationServlet" method="post" class="col-lg-6 col-md-9 col-sm-12 col-xs-12 myclass">
		
		<div class="form-group">
		<label>Name</label>
		<input type="text" name="name" id ="username" class="form-control" onkeyup="myfunction(this)" placeholder="Enter Name" />
		<span id="msgusername" style="color:red"></span>
		</div>
		
		<div class="form-group">
		<label>Email</label>
		<input type="email" name="email" id ="email" class="form-control" onkeyup="myfunction(this)" placeholder="Enter Email" />
		<span id="msgemail" style="color:red"></span>
		</div>
		
		<div class="form-group">
		<label>Password</label>
		<input type="password" name="password" class="form-control" placeholder="Enter Password" />
		</div>
		
		<div class="form-group">
		<input type="submit" value="Submit" class="btn btn-primary btn-block"/>
		<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
		</div>
		
	</form>
	
	
	</div>
	
</body>
</html>