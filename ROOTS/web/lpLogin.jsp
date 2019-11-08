<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script type="text/javascript">
window.history.pushState(null, "", window.location.href);
window.onpopstate = function () {
    window.history.pushState(null, "", window.location.href);
};
</script>

<!DOCTYPE html>
<html>
<head>
	<title>Licensed Practitioner Login</title>
   
	<!--Bootstrap-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Font-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Customized-->
	<link rel="stylesheet" type="text/css" href="assets/css/userLogin.css">
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
	
		<div class="card">
			<div class="card-header"><center>
			
<img src="assets/css/images/user-icon1.png" alt="User Icon" />
				<h4>LICENSED PRACTITIONER SIGN IN</center></h4>
			</div>
			<div class="card-body">
			
			<!-- LOGIN FORM ACTION -->
				<form name="form" action="lplogin.action" method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="email" class="form-control" placeholder="Email" required> 
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="password" class="form-control" placeholder="Password" required>
					</div>
					<span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<a href="userForgotPasswordPage.jsp">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>
<a href="documentation/userListPage.html">User List</a>
<br>
<a href="documentation/ROOTS Admin Manual.pdf">Admin Manual</a>
<br>
<a href="documentation/ROOTS Practitioner Manual.pdf">Practitioner Manual</a>
<br>
<a href="documentation/ROOTS User Manual.pdf">User Manual</a>

</body>

</html>
