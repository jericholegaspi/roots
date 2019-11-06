<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/profilePage.css">

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
        <a class="nav-link" href="products_page.html">Products</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="servicePage.html">Services</a>
      </li>

      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        More
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="aboutPage.html">About</a>
        <a class="dropdown-item" href="contactUsPage.html">Contact Us</a>
        <a class="dropdown-item" href="FAQPage.html">FAQs</a>
      </div>
    </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">

      <ul class="navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="cart_page.html"><span class="fa fa-shopping-cart"><span class="badge total-count"></span></span></a>
        </li>
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="fas fa-user-alt"></span>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="profilePage.html"><i class="fas fa-user-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Profile</span></a>
        <a class="dropdown-item" href="invoicelist_page.html"><i class="fas fa-file-invoice fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Invoice</span></a>
        <a class="dropdown-item" href="appointmentListPage.html"><i class="far fa-calendar-check fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Appointment</a>
        <a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Logout</span></a>
      </div>
        
      </li>
    </ul>
           
    </form>    
  </div>
</nav> 
</div>


<div class="container profile">
  <div class="card col-sm-12">
  <div class="row">
    <div class="col-sm-3">
      <div class="form-group">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail rounded-circle" alt="avatar" for="uploadImage">
          <small>Upload a different photo</small>
          <input id="uploadImage" type="file" class="text-center center-block file-upload">
      </div>
      <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        <a class="nav-link active" id="profileTab" data-toggle="pill" href="#profileContent" role="tab" aria-controls="profileContent" aria-selected="true">Profile</a>
        <a class="nav-link" id="trasactionTab" data-toggle="pill" href="#transactionContent" role="tab" aria-controls="transactionContent" aria-selected="false">Transaction History</a>
      </div>
      
    </div>

  <!-- Start of Profile -->
  <div class="col-sm-9">
    <div> <!-- CHANGE TO DIV -->
      <div class="tab-content" id="v-pills-tabContent">
        <div class="tab-pane fade show active" id="profileContent" role="tabpanel" aria-labelledby="profileTab"><br>
          <h5>Profile</h5><br>
          <div class="form-row">

            <div class="col">
              <label for="fname">First Name</label>
              <input class="form-control" placeholder="Enter your first name" oninput="this.className = ''" name="fname"></p>
            </div>
            <div class="col">
              <label for="fname">Middle Name</label>
              <input class="form-control" placeholder="Enter your first name" oninput="this.className = ''" name="fname"></p>
            </div>
            <div class="col">
              <label for="lname">Last Name</label>
              <input class="form-control" placeholder="Enter your last name" oninput="this.className = ''" name="lname"></p>
            </div>
          </div>
          <div class="form-row">
            <div class="col">
              <label for="email">Email Address</label>
                <input class="form-control" placeholder="Enter your email address" oninput="this.className = ''" name="email"></p>
            </div>
            <div class="col-sm-2">
              <div class="form-group">
                <label for="genderOption">Gender</label>
                <select class="form-control" id="genderOption">
                  <option> </option>
                  <option>M</option>
                  <option>F</option>
                  <option>Prefer not to say </option>
                </select>
              </div>
            </div>
          </div>

          <div class="form-row">
            <div class="col">
              <label for="phone">Phone Number</label>
                <input class="form-control" placeholder="Enter your phone number" oninput="this.className = ''" name="phone"></p>
            </div>
            <div class="col">
              <label for="phone">Mobile Number</label>
                <input class="form-control" placeholder="Enter your phone number" oninput="this.className = ''" name="phone"></p>
            </div>
          </div>
          <a href="cart_page.html" class="btn btn-warning float-right btn-sm">Update</a>
          <br><br>
          <a href="cart_page.html" class="btn btn-link float-right" id="changePwd" data-toggle="collapse" data-target="#changePassword" aria-expanded="false" aria-controls="collapseExample">Change Password</a>
          <br><br>
          <div class="collapse" id="changePassword">
            <div class="form-row">
              <div class="col">
                <label for="oldPwd">Old Password</label>
                  <input type="password" id="oldPwd" class="form-control" placeholder="Enter old password" oninput="this.className = ''" name="snumber"></p>
              </div>
            </div>
            <div class="form-row">
              <div class="col">
                <label for="newPwd">New Password</label>
                  <input type="password" id="newPwd" class="form-control" placeholder="Enter new password" oninput="this.className = ''" name="snumber"></p>
              </div>
            </div>
            <div class="form-row">
              <div class="col">
                <label for="confirmPwd">Confirm Password</label>
                  <input type="password" id="confirmPwd" class="form-control" placeholder="Enter confirm password" oninput="this.className = ''" name="snumber"></p>
              </div>
            </div>
            <a href="cart_page.html" class="btn btn-warning float-right btn-sm">Update</a>
          </div>

          <br><br><hr>
  <h5>Delivery Address</h5><br>
    	
  <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>">
     
	<button class="btn btn-outline-primary" id="HomeAddBtn" type="button" data-toggle="collapse" data-target="#homeAddress" aria-expanded="false" aria-controls="collapseExample">
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
	<button class="btn btn-primary" id="WorkAddBtn" type="button" data-toggle="collapse" data-target="#workAddress" aria-expanded="false" aria-controls="collapseExample">
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


        </div> 
          <!-- End of Form -->
        </div>
        <!-- End of Profile -->

        <!-- Start of Transaction History -->
        <div class="tab-pane fade" id="transactionContent" role="tabpanel" aria-labelledby="trasactionTab">
          <h5>Transaction History</h5><br>
          <table class="table mobile-optimised">
            <thead>
              <th scope="col">Date</th>
              <th scope="col">Transaction</th>
              <th scope="col">Product</th>
              <th scope="col">Total Amount</th>
              <th scope="col">Status</th>
              <th scope="col">Rate</th>

            </thead>
            <tbody>
              <tr>
                <td data-th="Date">10/12/19</td>
                <td data-th="Transaction">Appointment</td>
                <td data-th="Product">Hilot</td>
                <td data-th="Total Amount">Licensed Practitioner</td>
                <td data-th="Status">Paid</td>
                <td data-th="Rate"><a href="cart_page.html" class="btn btn-success float-right btn-sm" data-toggle="modal" data-target="#commentModal"> Comment</a></td>
              </tr>
              <tr>
                <td data-th="Date">10/13/19</td>
                <td data-th="Transaction">Order</td>
                <td data-th="Product">1 Papaya<br>
                                      2 Ampalaya</td>
                <td data-th="Total Amount">P 500</td>
                <td data-th="Status">Paid</td>
                <td data-th="Rate"><a href="cart_page.html" class="btn btn-success float-right btn-sm" data-toggle="modal" data-target="#commentModal"> Comment</a></td>
              </tr>
            </tbody>
            
          </table>
          
        </div>
        <!-- End of Transaction History -->
      </div>
    </div>
  </div>
    
  </div>
 
</div>


<button onclick="topFunction()" id="myBtn" title="Go to top"><span class="fa fa-angle-double-up"></span></button>

</div>

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
        <p class="text-white">Here you can use rows and columns to organize your footer content.</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase text-warning">Links</h5>

        <ul class="list-unstyled">
          <li>
            <a href="Home_Page_v2.html" class="text-secondary">Home</a>
          </li>
          <li>
            <a href="catalogue_page.html" class="text-secondary">Catalogue</a>
          </li>
          <li>
            <a href="products_page.html" class="text-secondary">Products</a>
          </li>
          <li>
            <a href="servicePage.html" class="text-secondary">Services</a>
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
            <a href="contactUsPage.html" class="text-secondary">Contact Us</a>
          </li>
          <li>
            <a href="FAQPage.html" class="text-secondary">FAQs</a>
          </li>
          <li>
            <a href="#!" class="text-secondary">Privacy Policy</a>
          </li>
          <li>
            <a href="#!" class="text-secondary">Terms and Conditions</a>
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


<!-- START of Modal -->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-comment-dots fa-2x" style="color: #bbbb77;"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">            
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Comment:</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
          </div>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
         <a href="cart_page.html" class="btn btn-warning">Submit</a>
      </div>
    </div>
  </div>
</div> 

<!--END of Modal -->

<script type="text/javascript">
//go to top
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

//upload profile picture
$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }    
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(".file-upload").on('change', function(){
        readURL(this);
    });
});

</script>
</body>
</html>