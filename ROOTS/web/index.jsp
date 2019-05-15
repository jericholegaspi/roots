<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payroll Form</title>
</head>
<body>	
	<h2>Payroll Form Using Struts 2 TagLib/OGNL</h2>
	<s:form action="compute.action" method="post">
		<s:textfield key="name" label="Employee Name"/>
		<s:textfield key="hoursWorked" label="Hours Worked"/>
		<s:textfield key="payRate" label="Payrate"/>
		<s:submit value="Compute Salary"/>
		<s:reset/>
	</s:form>
</body>
</html>
