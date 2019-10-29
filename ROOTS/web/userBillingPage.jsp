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
        <a class="nav-link" href="products_page.html">Products</a>
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
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"><span class="fa fa-search"></span></button>

      <ul class="navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="cart_page.html"><span class="fa fa-shopping-cart"><span class="badge total-count"></span></span></a>
        </li>
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
           
    </form>    
  </div>
</nav> 
</div>

<div class="container-fluid bill">

<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM users where userId = " + session.getAttribute("uid");

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>  

<form id="regForm">
  <!-- One "tab" for each step in the form: -->
  

  <div class="tab"><h5>Contact Information</h5><br>
    <div class="form-row">
      <div class="col">
        <label for="fname">First Name</label>
         <input name="firstName" type="text" disabled class="form-control" value="<%= resultSet.getString("firstName") %>"></p>
      </div>
      <div class="col">
        <label for="lname">Last Name</label>
         <input name="lastName" type="text" disabled class="form-control" value="<%= resultSet.getString("lastName") %>"></p>
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

  <br><br><h5>Billing Address</h5><br>
  
<!--   	<div class="form-row">
      <div class="col">
        <label for="snumber">Street Number</label>
          <input id="houseNumber" placeholder="Enter your street number" oninput="this.className = ''" name="snumber"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input id="street" placeholder="Enter your street name" oninput="this.className = ''" name="sname"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input id="barangay" placeholder="Enter your barangay/subdivision" oninput="this.className = ''" name="sname"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
    		<select id="city" class="form-control">
			  <option>Manila</option>
			</select>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select id="province" class="form-control">
			  <option>Cavite</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input id="postalCode" placeholder="Enter your postal code" oninput="this.className = ''" name="sname"></p>
    	</div>
    </div>
    
    <div class="btn-group float-right">
    	<a href="cart_page.html" class="btn btn-outline-secondary float-right btn-sm"><i class="far fa-edit"></i></a>
    	<a href="cart_page.html" class="btn btn-outline-danger float-right btn-sm"><i class="fas fa-trash-alt"></i></a>
     </div>  -->
     
     
      <br>
	<button class="btn btn-outline-primary" onclick="homeAddressSwitch()" id="HomeAdddBtn" type="button" data-toggle="collapse" data-target="#homeAddress" aria-expanded="false" aria-controls="collapseExample">
		<i class="fas fa-plus-circle"></i> Home Address
	</button>
	<!-- Start Collapsible Home Address -->
	<div class="collapse" id="homeAddress">
	<br>
	<div class="form-row">
		<div class="col">
        <label for="snumber">Current Address</label>
        <input id="currentAddress" class="form-control" type="text" placeholder="Enter your current home address" readonly></p>
      </div>
	</div>

	
	<div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
		<!-- Call addHomeAddress -->
		<a class="btn btn-outline-success float-right btn-sm" role="tab" data-toggle="collapse" data-target="#addHomeAddress"><i class="fas fa-plus"></i></a>
		<!-- Call ediHomeAddress -->
    	<a class="btn btn-outline-warning float-right btn-sm" data-toggle="collapse" data-target="#editHomeAddress"><i class="fas fa-edit"></i></a>
    	<a href="cart_page.html" class="btn btn-outline-danger float-right btn-sm" data-toggle="modal" data-target="#delete-confirmation"><i class="fas fa-trash-alt"></i></a>
     </div>
      <br><br>
      
      <!-- start of addHomeAddress -->
      <div class="collapse" id="addHomeAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">Street Number</label>
          <input id="houseNumber" placeholder="Enter your street number" oninput="this.className = ''" name="snumber"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input id="street" placeholder="Enter your street name" oninput="this.className = ''" name="sname"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input id="barangay" placeholder="Enter your barangay/subdivision" oninput="this.className = ''" name="sname"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
    		<select id="city" class="form-control">
			  <option>Manila</option>
			</select>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select id="province" class="form-control">
			  <option>Cavite</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input id="postalCode" placeholder="Enter your postal code" oninput="this.className = ''" name="sname"></p>
    	</div>
    </div>
    <a href="cart_page.html" class="btn btn-success float-right btn-sm"><i class="fas fa-save"></i> Save</a>
    </div>
    
    <br><br>
    <!-- End of addHomeAddress -->	
      
      <!-- start of editHomeAddress -->
      <div class="collapse" id="editHomeAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">Street Number</label>
          <input id="houseNumber" placeholder="Enter your street number" oninput="this.className = ''" name="snumber"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input id="street" placeholder="Enter your street name" oninput="this.className = ''" name="sname"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input id="barangay" placeholder="Enter your barangay/subdivision" oninput="this.className = ''" name="sname"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
    		<select id="city" class="form-control">
			  <option>Manila</option>
			</select>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select id="province" class="form-control">
			  <option>Cavite</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input id="postalCode" placeholder="Enter your postal code" oninput="this.className = ''" name="sname"></p>
    	</div>
    </div>
     <a href="cart_page.html" class="btn btn-success float-right btn-sm"><i class="fas fa-save"></i> Update</a>
    </div>
    
    <!-- End of editHomeAddress -->	
    </div>
    <!-- End of Collapsible Home Address -->	  
		  
	<br><br>
	<button class="btn btn-primary" onclick="switchAddress()" id="WorkAddBtn" type="button" data-toggle="collapse" data-target="#workAddress" aria-expanded="false" aria-controls="collapseExample">
		<i class="fas fa-plus-circle"></i> Work Address
	</button>
	
    <div class="collapse" id="workAddress">
    <br>
      <div class="form-row">
		<div class="col">
        <label for="snumber">Current Address</label>
        <input id="currentAddress" class="form-control" type="text" placeholder="Enter your current work address" readonly></p>
      </div>
	</div>

	
	<div class="btn-group btn-group-toggle float-right" data-toggle="buttons" role="group">
		<!-- Call addWorkAddress -->
		<a class="btn btn-outline-success float-right btn-sm" role="tab" data-toggle="collapse" data-target="#addWorkAddress"><i class="fas fa-plus"></i></a>
		<!-- Call editWorkAddress -->
    	<a class="btn btn-outline-warning float-right btn-sm" data-toggle="collapse" data-target="#editWorkAddress"><i class="fas fa-edit"></i></a>
    	<a href="cart_page.html" class="btn btn-outline-danger float-right btn-sm" data-toggle="modal" data-target="#delete-confirmation"><i class="fas fa-trash-alt"></i></a>
     </div>
      <br><br>
      
      <!-- start of addWorkAddress -->
      <div class="collapse" id="addWorkAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">Street Number</label>
          <input id="houseNumber" placeholder="Enter your street number" oninput="this.className = ''" name="snumber"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input id="street" placeholder="Enter your street name" oninput="this.className = ''" name="sname"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input id="barangay" placeholder="Enter your barangay/subdivision" oninput="this.className = ''" name="sname"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
    		<select id="city" class="form-control">
			  <option>Manila</option>
			</select>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select id="province" class="form-control">
			  <option>Cavite</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input id="postalCode" placeholder="Enter your postal code" oninput="this.className = ''" name="sname"></p>
    	</div>
    </div>
    <a href="cart_page.html" class="btn btn-success float-right btn-sm"><i class="fas fa-save"></i> Save</a>
    </div>
    
    <br><br>
    <!-- End of addWorkAddress -->	
      
      <!-- start of editWorkAddress -->
      <div class="collapse" id="editWorkAddress">
     <div class="form-row">
      <div class="col">
        <label for="snumber">Street Number</label>
          <input id="houseNumber" placeholder="Enter your street number" oninput="this.className = ''" name="snumber"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input id="street" placeholder="Enter your street name" oninput="this.className = ''" name="sname"></p>
      </div>
      <div class="col">
        <label for="sname">Barangay/Subdivision</label>
          <input id="barangay" placeholder="Enter your barangay/subdivision" oninput="this.className = ''" name="sname"></p>
      </div>
    </div>
    <div class="form-row">
    	<div class="col">
    	<label for="sname">City</label>
    		<select id="city" class="form-control">
			  <option>Manila</option>
			</select>
    	</div>
    	<div class="col">
    	<label for="sname">Province</label>
    		<select id="province" class="form-control">
			  <option>Cavite</option>
			</select>
    	</div>
    	<div class="col">
    		 <label for="sname">Postal Code</label>
          <input id="postalCode" placeholder="Enter your postal code" oninput="this.className = ''" name="sname"></p>
    	</div>
    </div>
     <a href="cart_page.html" class="btn btn-success float-right btn-sm"><i class="fas fa-save"></i> Update</a>
    </div>
    
    <!-- End of editWorkAddress -->	
    </div>
    <br><br>
  </div>
 

  <div class="tab"><h5>Order Summary</h5><br>
    <div class="col-sm-12">
      <div class="row">
        <div class="col">
        <p>Name: Abigail Abada</p>
        <p>Phone Number: 4778425</p>
        <p>Email Address: abigailhana.abada@benilde.edu.ph</p>
        <p>Billing Address: <i>104 Northeast Ipil St. Marikina Heights Marikina City</i></p>
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
</div>



  <div style="overflow:auto;">
    <div style="float:right;">
    	<a class="btn btn-outline-warning btn-lg" id="prevBtn" onclick="nextPrev(-1)"> Previous</a>
    	<a class="btn btn-warning btn-lg" id="nextBtn" onclick="nextPrev(1)"> Next</a>
    
      
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>

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

<!-- START of Modal -->
<div class="modal fade" id="delete-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content text-center">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-exclamation-circle fa-2x justify-content-center" style="color:grey;"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <p class="question text-center">Are you sure you want to delete your address?</p>
            <br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        <a href="userBillingPage.jsp" class="btn btn-primary">Proceed</a>
      </div>
    </div>
  </div>
</div> 

<!--END of Modal -->


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

  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == 1) {
    document.getElementById("nextBtn").innerHTML = "Proceed";
    document.getElementById("nextBtn").setAttribute("onclick", "location.href='userInvoicePage.jsp'");

  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
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
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
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

function homeAddressSwitch() {	
	
}


</script>

</body>
</html>
