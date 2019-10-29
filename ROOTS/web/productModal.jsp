<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MODAL</title>
</head>
<body>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost/";
	String dbName = "isproj2_roots";
	String userId = "isproj2_roots";
	String password = "^qp&6Afnsd7S^jRf";
	int prodIDChain = Integer.parseInt(request.getParameter("prodID"));

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

	<div class="modal-header">
	    <h5 class="modal-title" id="exampleModalLabel">Product Item Name
	        <br>
	        <small>Category</small>
	    </h5>
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
	</div>
	<div class="modal-body">
	    <div class="row">
	        <div class="col-md-5 justify-content-center">
	            <img class="card-img-top responsive-img" src="images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
	        </div>
	        <div class="col-md-7" style="overflow:auto; height: 350px;">
	            <p class="p-title">Description</p>
	            <p class="p-text">Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description
	            </p>
	            <br>
	            <p class="p-title">Price</p>
	            <p class="p-text"><b>Price/Unit</b></p>
	            <p class="p-text"><b>Price/Unit</b></p>
	        </div>
	    </div>
	</div>
	<div class="modal-footer">
	    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	    <button type="button" class="btn btn-primary">Add to Cart</button>
	</div>
</body>
</html>