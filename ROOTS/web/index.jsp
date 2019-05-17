<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Form</title>
</head>
<body>	
	<h2>Login Test</h2>

	<s:form action="compute.action" method="post">
	
		<s:textfield key="firstName" label="First Name"/>
		<s:textfield key="lastName" label="Last Name"/>
		<s:password key="password" label="Password"/>
		<s:textfield key="mobileNo" label="Mobile No"/>
		<s:textfield key="email" label="E-mail Address"/>
		<s:textfield key="address" label="Address"/>
		<s:textfield key="dob" label="Date of Birth"/>
	
		<s:submit value="Login"/>
		<s:reset/>
	</s:form>
</body>
</html>
