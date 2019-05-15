<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payroll View Display</title>
</head>
<body>
	<h2>Payroll Computation Display Using Freemarker/JSP EL</h2>
	<p>Employee Name: <b>${name}</b></p>
	
	<p>Hours Worked: <b>${hoursWorked}</b></p>
	<p>Pay Rate: <b>Php${payRate} </b></p>
	<p>Basic Pay: <b>Php${basicPay} </b></p>
	<p>Overtime Pay: <b>Php${overtimePay} </b></p>
	<p>Gross Pay: <b>Php${grossPay} </b></p>
	<p>Tax: <b>Php${tax} </b></p>
	<p>Net Pay: <b>Php${netPay}</b></p>
	
	<hr/>
	
	<h2>Payroll Computation Display Using OGNL/TagLib</h2>
	<p>Employee Name: <b><s:property value="name"/></b></p>
	<p>Hours Worked: <b><s:property value="hoursWorked"/></b></p>
	<p>Pay Rate: <b>Php<s:property value="payRate"/></b></p>
	<p>Basic Pay: <b>Php<s:property value="basicPay"/></b></p>
	<p>Overtime Pay: <b>Php<s:property value="overtimePay"/></b></p>
	<p>Gross Pay: <b>Php<s:property value="grossPay"/></b></p>
	<p>Tax: <b>Php<s:property value="tax"/></b></p>
	<p>Net Pay: <b>Php<s:property value="netPay"/></b></p>
	
	<hr/>
	
	<form action="index.jsp">
		<input type='submit' value ="<< GO BACK >>">
	</form>
</body>
</html>