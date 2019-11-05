<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>

	<title>User Registration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<!--Bootstrap-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

	<link href="maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
	<!--Font-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Customized-->	
	<link rel="stylesheet" type="text/css" href="assets/css/userRegistration.css">

</head>
<body>
			
<!-- REGISTRATION FORM ACTION -->
<form action="register.action" name="myForm" method="post" onsubmit="return validate()">

	<div class="container-fluid">
		<div class="row">
			<div class="card center-block">
				<div class="card-header">
					<h3 class="text-center text-success">Create an Account</h3>
					<hr>
				</div>
<!-- NAME -->
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
										<input type="text" placeholder="First Name" name="firstName" class="form-control" required>
										<input type="text" placeholder="Middle Name" name="middleName" class="form-control" required>
										<input type="text" placeholder="Last Name" name="lastName" class="form-control" required>		
							</div>
						</div>
					</div>
				</div>

<!-- GENDER -->
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-venus-mars"></i></span>						
									</div>
										<select name="gender" class="form-control" required>
											<option value="" disabled="disabled" selected="selected">Sex</option>
											<option value="M">Male</option>
											<option value="F">Female</option>
											<option value="Prefer Not To Say">Prefer Not To Say</option>	
										</select>								
							</div>
						</div>
					</div>
				</div>

<!-- PASSWORD -->
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
									<input type="password" minlength="8" maxlength="20" placeholder="Password" name="password" class="form-control" required>
							</div>
						</div>
					</div>
				</div>
				
				
<!-- CONFIRM PASSWORD -->				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
									<input type="password" minlength="8" maxlength="20" placeholder="Confirm Password" name="confirmpassword" class="form-control" required>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
								</div>
									<input type="number" minlength="10" maxlength="12" class="form-control" name="mobileNo" placeholder="Mobile No." required>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
								</div>
									<input type="number" minlength="10" maxlength="12" class="form-control" name="telephone" placeholder="Telephone #" required>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-envelope"></i></span>
								</div>
									<input type="email" class="form-control" name="email" placeholder="E-Mail" required>
							</div>
						</div>
					</div>
				</div>
							
				<div class="row">
					<font size="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Date of Birth</font>
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
								</div>					
									<input type="text" name="dateOfBirth">
							</div>
							<hr>
								<div class="card-footer">
									<div class="row align-items-center read">
										<input type="checkbox" name="pp"> I have read the&emsp;<a href="privacyPolicy.html" target="_blank">Privacy Policy</a>																			
									</div>
								</div>
									<p class="sub"><button class="btn btn-warning btn-block" value="Register"> Submit </button></p>
						</div>
					</div>
				</div>			
			</div>
		</div>
	</div>


<!-- JAVASCRIPT Validation -->
<script type="text/javascript">

function validate()
{
	if (document.myForm.firstName.value == "") 
	{
		alert("Please Enter First Name");
		document.myForm.firstName.focus();
		return false;
	}

	if (document.myForm.lastName.value == "") 
	{
		alert("Please Enter Last Name");
		document.myForm.lastName.focus();
		return false;
	}

	if (document.myForm.password.value == "")
	{
		alert("Please Create your Password");
		document.myForm.password.focus();
		return false;
	}
	
	if (document.myForm.password.value != document.myForm.confirmpassword.value)
	{
		alert("Passwords do not match.");
		document.myForm.password.focus();
		return false;
	}
	

	if (document.myForm.mobileNo.value == "") 
	{
		alert("Please enter Mobile Number");
		document.myForm.mobileNo.focus();
		return false;
	}

	if (document.myForm.email.value == "") 
	{
		alert("Please Enter E-Mail ID");
		document.myForm.email.focus();
		return false;
	}

	if (document.myForm.dateOfBirth.value == "")
	{
		alert("Please Enter Date of Birth");
		document.myForm.dateOfBirth.focus();
		return false;
	}
	
	if (myForm.pp.checked == false ) 
	{
		alert ('Please indicate that you have read the Privacy Policy.');
		return false;
	} 
	
	
}

</script>

</form>
</body>
</html>
