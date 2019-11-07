<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Billing Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/billingPage.css">

  <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/";
String dbName = "isproj2_roots";
String userId = "isproj2_roots";
String password = "^qp&6Afnsd7S^jRf";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

</head>

<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="userLogin.jsp"></jsp:forward>
<%} %>

<body>

  <!-- PayPal API -->
  <script src="https://www.paypal.com/sdk/js?client-id=AQcMM3RdMEi_MxhI4tErRCEzKhIriOxlG1TIOrsdwAz-xBJ0QJhqsgu4jRSTRNlztO1kWroOqdNFfnww&currency=PHP">
  </script>

  <div class="container-fluid">
  <nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="userHomePage.jsp">
      <img src="assets/css/images/logo5.png" height="50px" width="90px">
  </a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="userCataloguePage.jsp">Catalogue</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userProductIndex.jsp">Products</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userServicePage.jsp">Services</a>
      </li>

      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        More
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="userAboutPage.jsp">About</a>
        <a class="dropdown-item" href="userContactUsPage.jsp">Contact Us</a>
        <a class="dropdown-item" href="userFAQPage.jsp">FAQs</a>
      </div>
    </li>
    </ul>
    <div class="form-inline my-2 my-lg-0">

      <ul class="navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="userCartPage.jsp"><span class="fa fa-shopping-cart"><span class="badge total-count"></span></span></a>
        </li>
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="fas fa-user-alt"></span>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="userProfile.jsp"><i class="fas fa-user-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Profile</span></a>
        <a class="dropdown-item" href=userInvoiceListPage.jsp><i class="fas fa-file-invoice fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Invoice</span></a>
        <a class="dropdown-item" href="userAppointmentListPage.jsp"><i class="far fa-calendar-check fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Appointment</a>
        <a class="dropdown-item" href="logout.action"><i class="fas fa-sign-out-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Logout</span></a>
      </div>
        
      </li>
    </ul>
           
    </div>    
  </div>
</nav> 
</div>

<div class="container-fluid bill">

<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM users where userID = " + session.getAttribute("uid");

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>  

<div id="regForm">
  <!-- One "tab" for each step in the form: -->
  

  <div class="tab"><h5>Contact Information</h5><br>
    <div class="form-row">
      <div class="col">
        <label for="fname">Full Name</label>
         <input name="firstName" type="text" disabled class="form-control" value="<%= resultSet.getString("firstName") %> <%= resultSet.getString("middleName") %> <%= resultSet.getString("lastName") %>"></p>
      </div>
    </div>
      <label for="email">Email Address</label>
         <input name="email" type="text" disabled class="form-control" value="<%= resultSet.getString("email") %>"></p>
    <div class="form-row">
      <div class="col">
        <label for="phone">Telephone Number</label>
         <input name="telephone" type="text" disabled class="form-control" value="<%= resultSet.getString("telephone") %>"></p>
      </div>
      <div class="col">
        <label for="mobile">Mobile Number</label>
         <input name="mobile" type="text" disabled class="form-control" value="<%= resultSet.getString("mobileNo") %>"></p>
      </div>
    </div>

        
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

  <br><br><h5>Delivery Address</h5><br>
      	
      	<div class="col-sm-6">
    	<label for="sname">Select your Delivery Address:</label>
    		<select id="selectAddress" class="form-control" onchange="switchAddress(this.value)">
    		  <option value="" disabled="disabled" selected="selected">Select Delivery Address</option>
			  <option value="Home Address">Home Address</option>
			  <option value="Work Address">Work Address</option>
			</select>
    	</div>
    	
    	<br>
    	
  <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
     
      <br>
	<button class="btn btn-outline-primary" id="HomeAddBtn" disabled type="button" data-toggle="collapse" data-target="#homeAddress" aria-expanded="false" aria-controls="collapseExample">
		<i class="fas fa-plus-circle"></i> Home Address
	</button>
	<!-- Start Collapsible Home Address -->
	<div class="collapse" id="homeAddress">
	<br>
	<div class="form-row">
		<div class="col">
        <label for="snumber">Current Home Address</label>
       
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT deliveryAddressID, houseNumber, street, barangay, city, province FROM deliveryaddress WHERE userID = " + session.getAttribute("uid") + " AND addressType = 'home'";

resultSet = statement.executeQuery(sql);
if (resultSet.next() == false) {
%>  
        <input name="homeA" id="currentHomeAddress" class="form-control" type="text" value="No Home Address Record" readonly></p>
        <div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
        
        <!-- Add Button -->
        <a class="btn btn-outline-success float-right btn-sm" role="tab" data-toggle="collapse" data-target="#addHomeAddress"><i class="fas fa-plus"></i></a>
  		</div>     
<%
}
else{
		do{
%>
		<input id="currentHomeAddress" class="form-control" type="text" value="<%= resultSet.getString("houseNumber") %> <%= resultSet.getString("street") %> <%= resultSet.getString("barangay") %> <%= resultSet.getString("city") %> <%= resultSet.getString("province") %> " readonly></p>
		<input id="dat" type="hidden" value="home">
		<div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
		
		<!-- Edit Button -->
		<a class="btn btn-outline-warning float-right btn-sm" data-toggle="collapse" data-target="#editHomeAddress"><i class="fas fa-edit"></i></a>
    	<!-- Delete Button -->
    	<button class="btn btn-outline-danger float-right btn-sm" data-toggle="modal" data-target="#delete-confirmationHome"><i class="fas fa-trash-alt"></i></button>
		</div>
<%		
		} while (resultSet.next());
	}
} catch (Exception e) {
e.printStackTrace();
}
%>

      </div>
	</div>

     </div>
      <br><br>
      
      <!-- start of addHomeAddress -->
      <form action="addHome.action" name="myForm" method="post">
      <div class="collapse" id="addHomeAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">House Number</label>
          <input name="houseNumber" class="form-control" placeholder="Enter your house number" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" placeholder="Enter your street name" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" placeholder="Enter your barangay/subdivision" oninput="this.className = ''"required></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" placeholder="Enter your city"oninput="this.className = ''" required></p>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select name="province" class="form-control">
			  <option value="Metro Manila">Metro Manila</option>
			  <option value="Batangas">Batangas</option>
			  <option value="Bulacan">Bulacan</option>
			  <option value="Cavite">Cavite</option>
			  <option value="Laguna">Laguna</option>
			  <option value="Pampanga">Pampanga</option>
			  <option value="Rizal">Rizal</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input name="postalCode" class="form-control" placeholder="Enter your postal code" oninput="this.className = ''" required></p>
    	</div>
    </div>
    	<button class="btn btn-success float-right btn-sm" value="Add Home Address"><i class="fas fa-save"></i> Save</button>
    </div>

    <br>
    <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
    </form>
    <!-- End of addHomeAddress -->	

<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT deliveryAddressID, houseNumber, street, barangay, city, province, postalCode FROM deliveryaddress WHERE userID = " + session.getAttribute("uid") + " AND addressType = 'home'";

resultSet = statement.executeQuery(sql);
while (resultSet.next())
{
%>
      
    <!-- start of editHomeAddress -->
     <form action="updateHome.action" name="myForm" method="post">
      <div class="collapse" id="editHomeAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">House Number</label>
          <input name="houseNumber" class="form-control" value="<%= resultSet.getString("houseNumber") %>" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" value="<%= resultSet.getString("street") %>" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" value="<%= resultSet.getString("barangay") %>" oninput="this.className = ''" required></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" value="<%= resultSet.getString("city") %>" oninput="this.className = ''" required></p>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select name="province" class="form-control">
			  <option value="<%= resultSet.getString("province") %>" selected="selected">Current: <%= resultSet.getString("province") %></option>
			  <option value="Metro Manila">Metro Manila</option>
			  <option value="Batangas">Batangas</option>
			  <option value="Bulacan">Bulacan</option>
			  <option value="Cavite">Cavite</option>
			  <option value="Laguna">Laguna</option>
			  <option value="Pampanga">Pampanga</option>
			  <option value="Rizal">Rizal</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input name="postalCode" class="form-control" value="<%= resultSet.getString("postalCode") %>" oninput="this.className = ''" required></p>
    	</div>
    </div>
    <button class="btn btn-success float-right btn-sm" value="Add Home Address"><i class="fas fa-save"></i> Update</button>
    <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
    <input type="hidden" name="deliveryAddressID" value="<%= resultSet.getString("deliveryAddressID") %>">
    </div>
        </form>
    
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
    <!-- End of editHomeAddress -->	
  
    <!-- End of Collapsible Home Address -->	  
	
	<br><br>
	<button class="btn btn-primary" id="WorkAddBtn" disabled type="button" data-toggle="collapse" data-target="#workAddress" aria-expanded="false" aria-controls="collapseExample">
		<i class="fas fa-plus-circle"></i> Work Address
	</button>
	
    <div class="collapse" id="workAddress">
    <br>
      <div class="form-row">
		<div class="col">
        <label for="snumber">Current Work Address</label>
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT deliveryAddressID, houseNumber, street, barangay, city, province FROM deliveryaddress WHERE userID = " + session.getAttribute("uid") + " AND addressType = 'work'";

resultSet = statement.executeQuery(sql);
if (resultSet.next() == false) {
%>  
        <input name="workA" id="currentWorkAddress" class="form-control" type="text" value="No Work Address Record" readonly></p>
        <div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
      	<!-- Call addWorkAddress -->
      	<a class="btn btn-outline-success float-right btn-sm" role="tab" data-toggle="collapse" data-target="#addWorkAddress"><i class="fas fa-plus"></i></a>
	</div>
	
<%
}
else{
		do{
%>

	<input id="currentWorkAddress" class="form-control" type="text" value="<%= resultSet.getString("houseNumber") %> <%= resultSet.getString("street") %> <%= resultSet.getString("barangay") %> <%= resultSet.getString("city") %> <%= resultSet.getString("province") %> " readonly></p>
	<input id="dat" type="hidden" value="work">
	<div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
		<!-- Call editWorkAddress -->
    	<a class="btn btn-outline-warning float-right btn-sm" data-toggle="collapse" data-target="#editWorkAddress"><i class="fas fa-edit"></i></a>
    	<!-- Call deleteWorkAddress -->
    	<button class="btn btn-outline-danger float-right btn-sm" data-toggle="modal" data-target="#delete-confirmationWork"><i class="fas fa-trash-alt"></i></button>
     </div>
<%		
		} while (resultSet.next());
	}
} catch (Exception e) {
e.printStackTrace();
}
%>
      <br><br>
      
      <!-- start of addWorkAddress -->
      <form action="addWork.action" name="myForm" method="post">
      <div class="collapse" id="addWorkAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">House Number</label>
          <input name="houseNumber" class="form-control" placeholder="Enter your house number" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" placeholder="Enter your street name" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" placeholder="Enter your barangay/subdivision" oninput="this.className = ''" required></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" placeholder="Enter your city"oninput="this.className = ''" required></p>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select name="province" class="form-control">
			  <option value="Metro Manila">Metro Manila</option>
			  <option value="Batangas">Batangas</option>
			  <option value="Bulacan">Bulacan</option>
			  <option value="Cavite">Cavite</option>
			  <option value="Laguna">Laguna</option>
			  <option value="Pampanga">Pampanga</option>
			  <option value="Rizal">Rizal</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input name="postalCode" class="form-control" placeholder="Enter your postal code" oninput="this.className = ''" required></p>
    	</div>
    </div>
    	<button class="btn btn-success float-right btn-sm" value="Add Home Address"><i class="fas fa-save"></i> Save</button>
    </div>

    <br>
    <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
    </form>
    <!-- End of addWorkAddress -->	
  
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT deliveryAddressID, houseNumber, street, barangay, city, province, postalCode FROM deliveryaddress WHERE userID = " + session.getAttribute("uid") + " AND addressType = 'work'";

resultSet = statement.executeQuery(sql);
while (resultSet.next())
{
%>  
  
      <!-- start of editWorkAddress -->
     <form action="updateWork.action" name="myForm" method="post">
      <div class="collapse" id="editWorkAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">House Number</label>
          <input name="houseNumber" class="form-control" value="<%= resultSet.getString("houseNumber") %>" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" value="<%= resultSet.getString("street") %>" oninput="this.className = ''" required></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" value="<%= resultSet.getString("barangay") %>" oninput="this.className = ''" required></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" value="<%= resultSet.getString("city") %>" oninput="this.className = ''" required></p>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select name="province" class="form-control">
			  <option value="<%= resultSet.getString("province") %>" selected="selected">Current: <%= resultSet.getString("province") %></option>
			  <option value="Metro Manila">Metro Manila</option>
			  <option value="Batangas">Batangas</option>
			  <option value="Bulacan">Bulacan</option>
			  <option value="Cavite">Cavite</option>
			  <option value="Laguna">Laguna</option>
			  <option value="Pampanga">Pampanga</option>
			  <option value="Rizal">Rizal</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input name="postalCode" class="form-control" value="<%= resultSet.getString("postalCode") %>" oninput="this.className = ''" required></p>
    	</div>
    </div>
    <button class="btn btn-success float-right btn-sm" value="Add Home Address"><i class="fas fa-save"></i> Update</button>
    <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
    <input type="hidden" name="deliveryAddressID" value="<%= resultSet.getString("deliveryAddressID") %>">
    </div>
        </form>  
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

</div>
    <!-- End of editWorkAddress -->	
    </div>
    <br><br>
  </div>
  </div> <!-- End of First Tab -->
 	
 	<br>

<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM users where userID = " + session.getAttribute("uid");

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>  
  <div class="tab"><h5>Order Summary</h5><br>
    <div class="col-sm-12">
      <div class="row">
        <div class="col">	
        <p><strong>Name</strong>: <span id="myname"><%= resultSet.getString("firstName") %> <%= resultSet.getString("middleName") %> <%= resultSet.getString("lastName") %></span></p>
        <p><strong>Phone Number</strong>: <%= resultSet.getString("telephone") %></p>
        <p><strong>Mobile Number</strong>:  <%= resultSet.getString("mobileNo") %> </p>
        <p><strong>Email Address</strong>: <%= resultSet.getString("email") %> </p>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>

<input type="hidden" id="dat2" value="">
<!-- If Home is selected -->
<div id="da1">
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT deliveryAddressID, houseNumber, street, barangay, city, province, postalCode FROM deliveryaddress WHERE userID = " + session.getAttribute("uid") + " AND addressType = 'home'";
resultSet = statement.executeQuery(sql);
while (resultSet.next())
{
%>  
        <p><strong>Address</strong>: <i><%= resultSet.getString("houseNumber") %> <%= resultSet.getString("street") %> <%= resultSet.getString("barangay") %> <%= resultSet.getString("city") %> <%= resultSet.getString("province") %></i></p>
        <input type="hidden" id="daIDhome" value="<%= resultSet.getString("deliveryAddressID") %>">
        <input type="hidden" id="daDeliverHome" value="<%= resultSet.getString("province") %>">
        <input type="hidden" id="deliveryHomeAddressID" value="<%= resultSet.getString("deliveryAddressID") %>">

        
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>

<!-- If Work is selected -->
<div id="da2">
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT deliveryAddressID,houseNumber, street, barangay, city, province, postalCode FROM deliveryaddress WHERE userID = " + session.getAttribute("uid") + " AND addressType = 'work'";
resultSet = statement.executeQuery(sql);
while (resultSet.next())
{
%>  
        <p><strong>Address</strong>: <i><%= resultSet.getString("houseNumber") %> <%= resultSet.getString("street") %> <%= resultSet.getString("barangay") %> <%= resultSet.getString("city") %> <%= resultSet.getString("province") %></i></p>
		<input type="hidden" id="daIDwork" value="<%= resultSet.getString("deliveryAddressID") %>">
		<input type="hidden" id="daDeliverWork" value="<%= resultSet.getString("province") %>">
		<input type="hidden" id="deliveryWorkAddressID" value="<%= resultSet.getString("deliveryAddressID") %>">
		
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
 		</div>
      </div>
    </div>
    <br><br>
    <input type="hidden" id="deliverProvince" value="">
    <input type="hidden" id="paymentmethod" value=""> 
    <div class="col-sm-12">
      <div class="row">
        <table class="table mobile-optimised">
          <thead>
            <tr>
              <th scope="col">Product Name</th>
              <th scope="col">Quantity</th>
              <th scope="col">Unit Cost</th>
              <th scope="col"></th>
              <th scope="col">Amount</th>
              
            </tr>
          </thead>
          <tbody>
            <%
			try {
				statement = connection.createStatement();
				String sqlproduct = "SELECT orderItems.orderItemID, orderItems.userID, orderItems.prodID,"
						+ " orderItems.cartState, orderItems.orderItemQty, orderItems.orderItemSubTotal,"
						+ " products.prodID, products.prodName, products.description,"
						+ " products.initialPrice, products.unitID, units.unitID, units.unit FROM orderItems"
						+ " INNER JOIN products ON orderItems.prodID = products.prodID"
						+ " INNER JOIN units ON products.unitID = units.unitID"
						+ " WHERE orderItems.userID = " + session.getAttribute("uid") + " AND"
						+ " orderItems.cartState = 'Idle'";
				
				resultSet = statement.executeQuery(sqlproduct);
			while (resultSet.next()) {
			%>
            <tr>
              <td data-th="Item"><%=resultSet.getString("prodName")%></td>
              <td id="quantity" data-th="Quantity"><%=resultSet.getInt("orderItemQty")%></td>
              <td id="initialprice" data-th="Unit Cost"><%=resultSet.getString("initialPrice")%></td>
              <td></td>
              <td id="subtotal" data-th="Subtotal"><%=resultSet.getInt("orderItemSubTotal")%></td>
            </tr>
			<%
					}
				} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			
			<%
			try {
				statement = connection.createStatement();
				String sqlproduct = "SELECT orderTotalPrice "
						+ "FROM orders WHERE userID = "+ session.getAttribute("uid") +" AND cartStatus = 'Idle'";
				
				resultSet = statement.executeQuery(sqlproduct);
			while (resultSet.next()) {
			%>
            <tr>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td><strong><i>Items Sub-Total</i></strong></td>
	            <td id="itemtotal"><h5><strong><%=resultSet.getInt("orderTotalPrice")%></strong></h5></td>
            </tr>
            
            <%
					}
				} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			<tr>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td><i>VAT (12%)</i></td>
	            <td id="vat"></td>
	        </tr>
	        <tr id="paypalrow">
	            <td></td>
	            <td></td>
	            <td></td>
	            <td><i>PayPal Fee</i></td>
	            <td id="paypalfee"></td>
	        </tr>
	      	<tr>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td><i>Delivery Fee</i></td>
	            <td id="deliverfee"></td>
	        </tr>	        
          </tbody>
          <tfoot>
             <tr>
	            <td></td>
	            <td></td>
	            <td></td>
	            <td><strong><i>Inclusive Fees Sub-Total</i></strong></td>
	            <td id="inclusivefees"></td>
            </tr>
	        <tr>
	          <td class="hidden-xs" colspan="3"></td>
	          <td class="hidden-xs"><h3><strong>Grand Total</strong></h3></td>
	          <!-- PayPal Total -->
	          <td id="grandtotal" class="hidden-xs"></td>
	        </tr>
          </tfoot>
        </table>
      </div>
      <br>
        <h5>Mode of Payment</h5><br>
			<div class="col-sm-6">
	    	<label for="sname">Select your Payment Method:</label>
	    		<select id="selectPayment" class="form-control" onchange="switchPayment(this.value)">
	    		  <option value="" disabled="disabled" selected="selected">Select Payment Method</option>
				  <option value="PayPal">PayPal</option>
				  <option value="Cash on Delivery">Cash on Delivery</option>
				</select>
	    	</div>        
        
		<br> <br> <br>
        <form action="paypal.action" id="paypalaction" method="post">
        <!-- PayPal Button -->
		<div class="col-sm-6" id="paypal-button-container"></div>
		    	<input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
		    	<!-- Get from query from deliveryaddress -->
		    	<input type="hidden" id="daID" name="deliveryAddressID">
		    	<!-- Get from id grandtotal -->
		    	<input type="hidden" id="otp" name="orderTotalPrice">
		    	<!-- Get from query from orderreference -->
			<%
			try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM orderreference WHERE userID = " + session.getAttribute("uid") + " AND cartCondition = 'Idle'";
			
			resultSet = statement.executeQuery(sql);
			while (resultSet.next())
			{
			%> 
		     	<input type="hidden" id="orID" name="orderReferenceID" value="<%=resultSet.getInt("orderReferenceID")%>">
        	<%
					}
				} catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</form>


    </div>
</div> <!-- End of Second Tab -->

  <div style="overflow:auto;">
    <div style="float:right;">
    	<a class="btn btn-outline-primary btn-lg" id="prevBtn" onclick="nextPrev(-1)"> Previous</a>
    	<button class="btn btn-warning btn-lg" id="nextBtn" onclick="nextPrev(1)"> Next</button>
    	
    	<button class="btn btn-outline-primary btn-lg" id="prevBtn2" onclick="nextPrev(-1)"> Previous</button>
    	<br> <br>
    	<form action="#" id="cashondeliveryaction" method="post">
    	<button class="btn btn-warning btn-lg" id="nextBtn2" data-toggle="modal" data-target="#proceed-confirmation"> Proceed </button>	
    	</form>
    
    </div>
  </div>
 
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
  </div>
</div>

</div>

<button onclick="topFunction()" id="myBtn" title="Go to top"><span class="fa fa-angle-double-up"></span></button>



<br>
<!-- Footer -->
<footer class="page-footer font-small blue pt-4">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Grid row -->
    <div class="row foot">

      <!-- Grid column -->
      <div class="col-md-6 mt-md-0 mt-3">

        <!-- Content -->
        <h5 class="text-uppercase text-warning">ROOTS</h5>
        <p class="text-white"><small>A web-enabled application that provides traditional and alternative medicine services from licensed practitioners with the ability to  purchase medicinal plants, herbs and other products online.</small></p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase text-warning">Links</h5>

        <ul class="list-unstyled">
          <li>
            <a href="userHomePage.jsp" class="text-secondary">Home</a>
          </li>
          <li>
            <a href="userCataloguePage.jsp" class="text-secondary">Catalogue</a>
          </li>
          <li>
            <a href="userPrivacyPolicyPage.jsp" target="_blank" class="text-secondary">Privacy Policy</a>
          </li>
          <li>
            <a href="userTermsConditionsPage.jsp" target="_blank" class="text-secondary">Terms and Conditions</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase text-warning">More</h5>

        <ul class="list-unstyled">
          <li>
            <a href="userAboutPage.jsp" class="text-secondary">About</a>
          </li>
          <li>
            <a href="userContactUsPage.jsp" class="text-secondary">Contact Us</a>
          </li>
          <li>
            <a href="userFAQPage.jsp" class="text-secondary">FAQs</a>
          </li>
          <li>
            <a href="userPrivacyPolicyPage.jsp" class="text-secondary">Privacy Policy</a>
          </li>
          <li>
            <a href="userTermsConditionsPage.jsp" class="text-secondary">Terms and Conditions</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center text-light py-3">© 2019 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/" class="text-warning"> Roots.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->

<!-- START of Delete Modal for Home Address-->
<div class="modal fade" id="delete-confirmationHome" tabindex="-1" role="dialog" aria-labelledby="deleteHomeAddr" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content text-center">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteHomeAddr"><i class="fas fa-exclamation-circle fa-2x justify-content-center" style="color:#bbbb77;"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <p class="question text-center">Are you sure you want to delete your Home Address?</p>
            <br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        
        <form action="deleteHome.action" name="myForm" method="post">
        <button class="btn btn-primary">Proceed</button>
    	<input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
        </form>
 

      </div>
    </div>
  </div>
</div> 

<!--END of Delete Modal for for Home Address -->


<!-- START of Delete Modal for Work Address-->
<div class="modal fade" id="delete-confirmationWork" tabindex="-1" role="dialog" aria-labelledby="deleteWorkAddr" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content text-center">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteWorkAddr"><i class="fas fa-exclamation-circle fa-2x justify-content-center" style="color:#bbbb77;"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <p class="question text-center">Are you sure you want to delete your Work Address?</p>
            <br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        
        <form action="deleteWork.action" name="myForm" method="post">        
        <button class="btn btn-primary">Proceed</button>
    	<input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
        </form>
 

      </div>
    </div>
  </div>
</div> 

<!--END of Delete Confirmation Work Address Modal -->

<!-- START of Proceed Confirmation Modal-->
<div class="modal fade" id="proceed-confirmation" tabindex="-1" role="dialog" aria-labelledby="confirmProceed" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content text-center">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmProceed"><i class="fas fa-exclamation-circle fa-2x justify-content-center" style="color:#bbbb77;"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <p class="question text-center">Are you sure you want to proceed?
            <br><br>
            <small>Note: There are no Refund Policy and Return Policy</small>
            </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        
        <form action="" name="myForm" method="post">        
	        <button class="btn btn-primary">Proceed</button>
	    	<input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
	    </form>
 

      </div>
    </div>
  </div>
</div> 

<!--END of Proceed Confirmation Modal -->

<script>
  <!-- go to top -->
$(document).ready(function(){
  $('body').scrollspy({target: ".navbar", offset: 50});   
});

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

//previous and next button 
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
    document.getElementById("prevBtn2").style.display = "none";
    document.getElementById("nextBtn").style.display = "inline";
    document.getElementById("nextBtn2").style.display = "none";
    document.getElementById("nextBtn").setAttribute("onclick", "nextPrev(1);displayAddress();switchPayment();calculate();query();");
  } else {
    document.getElementById("prevBtn").style.display = "none";
    document.getElementById("prevBtn2").style.display = "inline";
    document.getElementById("nextBtn2").style.display = "inline";
    document.getElementById("nextBtn").style.display = "none";
    //document.getElementById("nextBtn").innerHTML = "Proceed";
  }

  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
	 // This function deals with validation of the form fields
	 var ha = document.getElementById("currentHomeAddress").value;
	 console.log(ha);
	 var wa = document.getElementById("currentWorkAddress").value;
	 console.log(wa);
	var add = document.getElementById("selectAddress");
	var selected = add.options[add.selectedIndex].value;

	if ((ha == "No Home Address Record")  && (wa == "No Work Address Record")) 
	{
		alert("No Address Record Found");
		return false;
	}
	else if ((selected == "")){
		alert("No Selected Address");
		return false;
	}
	else if((selected == "Home Address") && (ha == "No Home Address Record")) {
		alert("No Home Address Record Found");
		return false;
	}	
	else if ((selected == "Work Address") && (wa == "No Work Address Record")){
		alert("No Work Address Record Found");
		return false;
	}

	
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  /* y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  } */
  // If the valid status is true, mark the step as finished and valid:
  if (valid) { 
    document.getElementsByClassName("step")[currentTab].className += " finish";
  
  }
  return valid; // return the valid status
} 

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}

function switchAddress(select){	
	 if(select == "Home Address") {
	    document.getElementById("homeAddress").style.display = "block";
	    document.getElementById("workAddress").style.display = "none";
	    document.getElementById("dat2").setAttribute("value", "home");
	} else if (select == "Work Address"){
	    document.getElementById("homeAddress").style.display = "none";
	    document.getElementById("workAddress").style.display = "block";
	    document.getElementById("dat2").setAttribute("value", "work");   
	} else {
	    document.getElementById('WorkAddBtn').disabled = true;
	    document.getElementById("HomeAddBtn").disabled = true;
	}
	 console.log(dat2);
}

function switchPayment(payment){
    document.getElementById("paypalrow").style.display = "none";
	if(payment == "PayPal") {
	    document.getElementById("paypalaction").style.display = "block";
	    document.getElementById("nextBtn2").style.display = "none";
	    document.getElementById("paypalrow").style.display = "";
	    document.getElementById("paymentmethod").setAttribute("value", "paypal");
	    calculate();
	    query();
	} else if (payment == "Cash on Delivery"){
	    document.getElementById("nextBtn2").style.display = "inline";
	    document.getElementById("paypalaction").style.display = "none";
	    document.getElementById("paypalrow").style.display = "none";
	    document.getElementById("paymentmethod").setAttribute("value", "cod");   
	    calculate();
	} else {
	    document.getElementById("nextBtn2").style.display = "none";
	    document.getElementById("paypalaction").style.display = "none";
	}
}

function displayAddress(){
	var dat2 =  document.getElementById("dat2").value;
	console.log(dat2);
	if(dat2 == "home") {
		document.getElementById("da1").style.display = "block";
		document.getElementById("da2").style.display = "none";
		var daDeliverHome = document.getElementById('daDeliverHome').value;
	    document.getElementById("deliverProvince").setAttribute("value", daDeliverHome);	
	} else {
		document.getElementById("da1").style.display = "none";
		document.getElementById("da2").style.display = "block";
		var daDeliverWork = document.getElementById('daDeliverWork').value;
	    document.getElementById("deliverProvince").setAttribute("value", daDeliverWork);   
	}

}

window.onload = switchAddress();


paypal.Buttons({
    createOrder: function(data, actions) {
      var total = document.getElementById('grandtotal').innerText;
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: total
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      return actions.order.capture().then(function(details) {
        alert('Transaction completed by ' + document.getElementById('myname').innerHTML);
        // Call Order Action
        document.getElementById("paypalaction").submit();
        // Call your server to save the transaction
        return fetch('/paypal-transaction-complete', {
          method: 'post',
          headers: {
            'content-type': 'application/json'
          },
          body: JSON.stringify({
            orderID: data.orderID
          })
        });
      });
    }
  }).render('#paypal-button-container');


function calculate(){
	//Compute VAT
	var itemtotal = parseInt(document.getElementById('itemtotal').innerText);
	var vat = itemtotal * .12;
	vat = Math.round(vat * 100) / 100;
    document.getElementById("vat").innerHTML = vat;
    
    //Compute PayPal Fee
    var paypalfee = ((itemtotal * 0.044) + 15);
    paypalfee = Math.round(paypalfee * 100) / 100;
    document.getElementById("paypalfee").innerHTML = paypalfee;
    
    //Compute Delivery Fee
    var deliverfee = 0;
    var deliverProvince = document.getElementById("deliverProvince").value;
    if (deliverProvince == "Metro Manila")
    	{
    		deliverfee = 89;
    	}
    else if (deliverProvince == "Rizal")
		{
			deliverfee = 119;
		}
    else if (deliverProvince == "Bulacan")
		{
			deliverfee = 119;
		}
    else if (deliverProvince == "Cavite")
		{
			deliverfee = 119;
		}
	else if (deliverProvince == "Laguna")
		{
			deliverfee = 139;
		}
	else if (deliverProvince == "Batangas")
		{
			deliverfee = 139;
		}
	else if (deliverProvince == "Pampanga")
		{
			deliverfee = 139;
		}
    
    deliverfee = Math.round(deliverfee * 100) / 100;
    
    document.getElementById("deliverfee").innerHTML = deliverfee;
    
    var paymentmethod = document.getElementById("paymentmethod").value;

    //Compute Inclusive Fees
    var inclusivefees = 0;

    if (paymentmethod=="paypal"){
    	inclusivefees = vat + paypalfee + deliverfee;
    }
    else {
    	inclusivefees = vat + deliverfee;
    }
    inclusivefees = Math.round (inclusivefees * 100) / 100;
    console.log(inclusivefees);
    document.getElementById("inclusivefees").innerHTML = "<h5><strong>"+inclusivefees+"</strong></h5>";
    
    
    //Compute Grand Total
    var grandtotal = 0;
    
    if (paymentmethod=="paypal"){
    	grandtotal = itemtotal + vat + paypalfee + deliverfee;
    }
    else {
    	grandtotal = itemtotal + vat + deliverfee;
    }
    grandtotal = Math.round (grandtotal * 100) / 100;
    console.log(grandtotal);
    document.getElementById("grandtotal").innerHTML = "<h3><strong>"+grandtotal+"</strong></h3>";
	
}

function query(){
	//All needed hidden inputs for SQL query
	
	//To Get deliveryaddressID
	var dat2 =  document.getElementById("dat2").value;
	if(dat2 == "home") {
		var deliveryHomeAddressID = document.getElementById('deliveryHomeAddressID').value;
	    document.getElementById("daID").setAttribute("value", deliveryHomeAddressID);   
	} else {
		var deliveryWorkAddressID = document.getElementById('deliveryWorkAddressID').value;
	    document.getElementById("daID").setAttribute("value", deliveryWorkAddressID);   
	}
	console.log(document.getElementById("daID").value);
	
	//To Get Grand Total
	var gt = parseFloat(document.getElementById("grandtotal").innerText);	
	document.getElementById("otp").setAttribute("value", gt);
    console.log("GT:" + gt);
	
	
}

</script>

</body>
</html>
