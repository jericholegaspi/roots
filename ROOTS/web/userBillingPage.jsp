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
  <div class="container-fluid">
  <nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="Home_Page_v2.html">
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
        <a class="nav-link" href="catalogue_page.html">Catalogue</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userProductIndex.jsp">Products</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Services</a>
      </li>

      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        More
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">About</a>
        <a class="dropdown-item" href="#">Contact Us</a>
        <a class="dropdown-item" href="#">FAQs</a>
      </div>
    </li>
    </ul>
    <div class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"><span class="fa fa-search"></span></button>

      <ul class="navbar-nav navbar-right">
        <%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sqlproduct = "SELECT COUNT(orderItemID) FROM orderItems"
					+ " WHERE userID = " + session.getAttribute("uid") + " AND"
					+ " orderItems.cartState = 'Idle'";
			resultSet = statement.executeQuery(sqlproduct);
			resultSet.next();
		%>
        <li class="nav-item">
          <a class="nav-link" href="userCartPage.jsp"><span class="fa fa-shopping-cart"><span class="badge total-count"><%=resultSet.getInt("count(orderItemID)")%></span></span></a>
        </li>
        <%
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="fa fa-user"></span>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Profile</a>
        <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Invoice</a>
        <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Logout</a>
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
    	<label for="sname">Delivery Address</label>
    		<select id="selectAddress" class="form-control" onchange="switchAddress(this.value)">
    		  <option value="" disabled="disabled" selected="selected">Select Delivery Address</option>
			  <option value="Home Address">Home Address</option>
			  <option value="Work Address">Work Address</option>
			</select>
    	</div>
    	
    	<br>
    	
  <input type="hidden" name="userId" value="<%= session.getAttribute("uid") %>">
     
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
        <input id="currentAddress" class="form-control" type="text" value="No Home Address Record" readonly></p>
        <div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
        
        <!-- Add Button -->
        <a class="btn btn-outline-success float-right btn-sm" role="tab" data-toggle="collapse" data-target="#addHomeAddress"><i class="fas fa-plus"></i></a>
  		</div>     
<%
}
else{
		do{
%>
		<input id="currentAddress" class="form-control" type="text" value="<%= resultSet.getString("houseNumber") %> <%= resultSet.getString("street") %> <%= resultSet.getString("barangay") %> <%= resultSet.getString("city") %> <%= resultSet.getString("province") %> " readonly></p>
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
          <input name="houseNumber" class="form-control" placeholder="Enter your house number" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" placeholder="Enter your street name" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" placeholder="Enter your barangay/subdivision" oninput="this.className = ''"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" placeholder="Enter your city"oninput="this.className = ''"></p>
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
          <input name="postalCode" class="form-control" placeholder="Enter your postal code" oninput="this.className = ''"></p>
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
          <input name="houseNumber" class="form-control" value="<%= resultSet.getString("houseNumber") %>" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" value="<%= resultSet.getString("street") %>" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" value="<%= resultSet.getString("barangay") %>" oninput="this.className = ''"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" value="<%= resultSet.getString("city") %>" oninput="this.className = ''"></p>
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
          <input name="postalCode" class="form-control" value="<%= resultSet.getString("postalCode") %>" oninput="this.className = ''"></p>
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
        <input id="currentAddress" class="form-control" type="text" placeholder="No Home Address Record" readonly></p>
        <div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
      	<!-- Call addWorkAddress -->
      	<a class="btn btn-outline-success float-right btn-sm" role="tab" data-toggle="collapse" data-target="#addWorkAddress"><i class="fas fa-plus"></i></a>
	</div>
	
<%
}
else{
		do{
%>

	<input id="currentAddress" class="form-control" type="text" value="<%= resultSet.getString("houseNumber") %> <%= resultSet.getString("street") %> <%= resultSet.getString("barangay") %> <%= resultSet.getString("city") %> <%= resultSet.getString("province") %> " readonly></p>
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
          <input name="houseNumber" class="form-control" placeholder="Enter your house number" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" placeholder="Enter your street name" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" placeholder="Enter your barangay/subdivision" oninput="this.className = ''"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" placeholder="Enter your city"oninput="this.className = ''"></p>
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
          <input name="postalCode" class="form-control" placeholder="Enter your postal code" oninput="this.className = ''"></p>
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
          <input name="houseNumber" class="form-control" value="<%= resultSet.getString("houseNumber") %>" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input name="street" class="form-control" value="<%= resultSet.getString("street") %>" oninput="this.className = ''"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input name="barangay" class="form-control" value="<%= resultSet.getString("barangay") %>" oninput="this.className = ''"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
            <input name="city" class="form-control" value="<%= resultSet.getString("city") %>" oninput="this.className = ''"></p>
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
          <input name="postalCode" class="form-control" value="<%= resultSet.getString("postalCode") %>" oninput="this.className = ''"></p>
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
        <p><strong>Name</strong>: <%= resultSet.getString("firstName") %> <%= resultSet.getString("middleName") %> <%= resultSet.getString("lastName") %></p>
        <p><strong>Phone Number</strong>: <%= resultSet.getString("telephone") %></p>
        <p><strong>Mobile Number</strong>:  <%= resultSet.getString("mobileNo") %> </p>
        <p><strong>Email Address</strong>: <%= resultSet.getString("email") %> </p>
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
        <p><strong>Address</strong>: <i>104 Northeast Ipil St. Marikina Heights Marikina City</i></p>
        </div>
      </div>
    </div>
    <br><hr><br>
    <div class="col-sm-12">
      <div class="row">
        <table class="table">
          <thead>
            <tr>
              <th class="border-0 text-uppercase small font-weight-bold">ID</th>
              <th class="border-0 text-uppercase small font-weight-bold">Item</th>
              <th class="border-0 text-uppercase small font-weight-bold">Description</th>
              <th class="border-0 text-uppercase small font-weight-bold">Quantity</th>
              <th class="border-0 text-uppercase small font-weight-bold">Unit Cost</th>
              <th class="border-0 text-uppercase small font-weight-bold">Total</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Software</td>
              <td>LTS Versions</td>
              <td>21</td>
              <td>$321</td>
              <td>$3452</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Software</td>
              <td>Support</td>
              <td>234</td>
              <td>$6356</td>
              <td>$23423</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Software</td>
              <td>Sofware Collection</td>
              <td>4534</td>
              <td>$354</td>
              <td>$23434</td>
            </tr>
          </tbody>
        </table>      
      </div>
      <br><hr>
        <h5>Mode of Payment</h5><br>

        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
          <label class="form-check-label" for="gridRadios1">
            PayPal
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
          <label class="form-check-label" for="gridRadios2">
            Cash on Deliver
          </label>
        </div>

    </div>
</div> <!-- End of Second Tab -->

<form action="/action_page.php" method="get" id="form1">
 <input type="hidden" name="fname"><br>
  <input type="hidden" name="fname"><br>
  <input type="hidden" name="fname"><br>
 
</form>


  <div style="overflow:auto;">
    <div style="float:right;">
    	<a class="btn btn-outline-primary btn-lg" id="prevBtn" onclick="nextPrev(-1)"> Previous</a>
        <form>
    	<button class="btn btn-warning btn-lg" id="nextBtn" onclick="nextPrev(1)"> Next</button>
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
        <h5 class="text-uppercase">ROOTS</h5>
        <p>Here you can use rows and columns to organize your footer content.</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase">Links</h5>

        <ul class="list-unstyled">
          <li>
            <a href="#!">Home</a>
          </li>
          <li>
            <a href="#!">Catalogue</a>
          </li>
          <li>
            <a href="#!">Products</a>
          </li>
          <li>
            <a href="#!">Services</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase">More</h5>

        <ul class="list-unstyled">
          <li>
            <a href="#!">Contact Us</a>
          </li>
          <li>
            <a href="#!">FAQs</a>
          </li>
          <li>
            <a href="#!">Privacy Policy</a>
          </li>
          <li>
            <a href="#!">Terms and Conditions</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> Roots.com</a>
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
        
        <form action="deleteWork.action" name="myForm" method="post">        <button class="btn btn-primary">Proceed</button>
    	<input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
        </form>
 

      </div>
    </div>
  </div>
</div> 

<!--END of Delete Confirmation Home Address Modal -->

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
    document.getElementById("nextBtn").innerHTML = "Next";
    document.getElementById("nextBtn").setAttribute("onclick", "nextPrev(1)");
  } else {
    document.getElementById("prevBtn").style.display = "inline";
    document.getElementById("nextBtn").innerHTML = "Proceed";
    document.getElementById("nextBtn").setAttribute("onclick", "location.href='userInvoicePage.jsp'");
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

	} else if (select == "Work Address"){
	    document.getElementById("homeAddress").style.display = "none";
	    document.getElementById("workAddress").style.display = "block";
	} else {
	    document.getElementById('WorkAddBtn').disabled = true;
	    document.getElementById("HomeAddBtn").disabled = true;
	}
}

window.onload = switchAddress();
//window.onclick = switchAddress;

</script>

</body>
</html>
