<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Invoice</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/invoicePage.css">

  <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

</head>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="userLogin.jsp"></jsp:forward>
<%} %>
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

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	int orderIDChain = Integer.parseInt(request.getParameter("orderID"));
	%>

  <!-- Paypal API -->
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
    <form class="form-inline my-2 my-lg-0">
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
          <a class="nav-link" href="userCartPage.jsp"><span class="fa fa-shopping-cart"><span class="badge badge-pill badge-warning total-count"><%=resultSet.getInt("count(orderItemID)")%></span></span></a>
        </li>
        <%
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="fas fa-user-alt"></span>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="userProfile.jsp"><i class="fas fa-user-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Profile</span></a>
        <a class="dropdown-item" href="userInvoiceListPage.jsp"><i class="fas fa-file-invoice fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Invoice</span></a>
        <a class="dropdown-item" href="userAppointmentListPage.jsp"><i class="far fa-calendar-check fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Appointment</a>
        <a class="dropdown-item" href="logout.action"><i class="fas fa-sign-out-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Logout</span></a>
      </div>
        
      </li>
    </ul>
           
    </form>    
  </div>
</nav> 
</div>

<div class="container invoice">
    <div class="row">
        <div class="col-md-9">
            <h2 style="color:white;">Invoice</h2>
        </div>


    </div>

    <div class="card">
        <div class="card-body p-0">
            <div class="row p-5">
                <div class="col-md-6">
                    <img src="assets/css/images/logo5.png" height="100px" width="170px">
                </div>

                <div class="col-md-6 text-right">
                 <%
				try {
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();
					String sqlproduct = "SELECT * FROM orders WHERE userID = " + session.getAttribute("uid") + " AND"
					+ " orderID = " + orderIDChain;
					resultSet = statement.executeQuery(sqlproduct);
				resultSet.first();
				%>
                    <p class="font-weight-bold mb-1">Invoice #<%=resultSet.getInt("orderID")%></p>
                <%
					} catch (Exception e) {
					e.printStackTrace();
				}
				%>
                </div>
                </p>
            </div>
        </div>
        <hr class="my-5">
		 
        <div class="row pb-5 p-5">
	        <%
					try {
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						Statement statement2 = null;
						ResultSet resultSet2 = null;
						
						statement2 = connection.createStatement();
						String sqlorders = "SELECT o.deliveryAddressID, o.userID, da.deliveryAddressID,"
						+ " da.houseNumber, da.street, da.barangay, da.city, da.province, da.postalCode"
						+ " FROM orders o INNER JOIN deliveryAddress da ON o.deliveryAddressID = da.deliveryAddressID"
						+ " WHERE o.orderID = " + orderIDChain + " AND"
						+ " o.userID = " + session.getAttribute("uid");
						resultSet2 = statement.executeQuery(sqlorders);
						resultSet2.first();
						
						statement = connection.createStatement();
						String sqlproduct = "SELECT * FROM users WHERE userID = " + session.getAttribute("uid");
						resultSet = statement.executeQuery(sqlproduct);
						resultSet.first();
			%>
            <div class="col-md-6">
                <p class="font-weight-bold mb-4">Customer Information</p>
                <p class="mb-1"><%=resultSet.getString("firstName")%> <%=resultSet.getString("lastName")%></p>
                <p class="mb-1"><%=resultSet.getString("email")%></p>
                <p><%=resultSet.getString("mobileNo")%></p>
                <p class="mb-1"><%=resultSet2.getString("houseNumber")%> <%=resultSet2.getString("street")%>, <%=resultSet2.getString("barangay")%>, <%=resultSet2.getString("city")%>, <span id="deliverProvince"><%=resultSet2.getString("province")%></span> <%=resultSet2.getString("postalCode")%></p>
            </div>
            
            <div class="col-md-6 text-right">
                <p class="font-weight-bold mb-4">Payment Details</p>
                <p class="mb-1"><span class="text-muted">Mode of Payment: </span> <span id="paymentmethod"></span></p>
                <p class="mb-1"><span class="text-muted">Name: </span> <%=resultSet.getString("firstName")%> <%=resultSet.getString("lastName")%></p>
            </div>
            <%
					} catch (Exception e) {
					e.printStackTrace();
				}
			%>
        </div>

		<%
				try {
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();
					String sqlproduct = "SELECT * FROM orders WHERE userID = " + session.getAttribute("uid") + " AND"
					+ " orderID = " + orderIDChain;
					resultSet = statement.executeQuery(sqlproduct);
					resultSet.first();
				%>
                    <input id="mop" type="hidden" value="<%=resultSet.getString("paymentStatus")%>">
                <%
					} catch (Exception e) {
					e.printStackTrace();
				}
		%>
		
        <div class="row">
            <div class="col-md-12 price-table p-5">
                <div class="cart-table">
                    <table id="cart" class="table table-condensed">
                        <thead>
                            <tr>
                                <th style="width:30%">Product</th>
                                <th style="width:10%">Quantity</th>
                                <th style="width:10%">Unit</th>
                                <th style="width:19%">Unit Price</th>
                                <th style="width:10%">Subtotal</th>
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
									+ " orderItems.cartState = 'CheckOut' AND orderItems.orderID = " + orderIDChain;
							resultSet = statement.executeQuery(sqlproduct);
						while (resultSet.next()) {
						%>
                            <tr>
                                <td data-th="Product">
                                    <div class="row">
                                        <h6 class="col-sm-8 nomargin"><%=resultSet.getString("prodName")%></h6>
                                    </div>
                                </td>
                                <td data-th="Quantity"><%=resultSet.getString("orderItemQty")%></td>
                                <td data-th="Unit"><%=resultSet.getString("unit")%></td>
                                <td data-th="Unit Price">&#8369;<%=resultSet.getString("initialPrice")%>.00</td>
                                <td data-th="Subtotal">&#8369;<span id="itemtotal"><%=resultSet.getString("orderItemSubTotal")%>.00</span></td>
                            </tr>
                            <%
									}	
								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
                        </tbody>
                        <tfoot>

                <%
				try {
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();
					String sqlproduct = "SELECT * FROM orders WHERE userID = " + session.getAttribute("uid") + " AND"
					+ " orderID = " + orderIDChain;
					resultSet = statement.executeQuery(sqlproduct);
					resultSet.first();
				%>
                            <tr>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td><i>VAT (12%)</i></td>
					            <td>&#8369;<span id="vat"><%=resultSet.getFloat("orderVAT")%></span></td>
					        </tr>
					        <tr id="paypalrow">
					            <td></td>
					            <td></td>
					            <td></td>
					            <td><i>PayPal Fee</i></td>
					            <td>&#8369;<span id="paypalfee"><%=resultSet.getFloat("orderPayPalFee")%></span></td>
					        </tr>
					      	<tr>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td><i>Delivery Fee</i></td>
					            <td>&#8369;<span id="deliverfee"><%=resultSet.getFloat("orderDeliveryFee")%></span></td>
					        </tr>
				<%
					} catch (Exception e) {
					e.printStackTrace();
				}
				%>
					        <tr>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td><strong><i>Inclusive Fees Sub-Total</i></strong></td>
					            <td id="inclusivefees"></td>
				            </tr>
                            <tr>
                                <td class="hidden-xs" colspan="3"></td>
                                <td style="background-color: #ffbf00;"><center><h3><strong><i>Grand Total</i></strong></h3></center></td>
                                <td style="background-color: #ffbf00;" id="paypaltotal" class="hidden-xs">
                                <%
								try {
									connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
									statement = connection.createStatement();
									String sqlproduct = "SELECT * FROM orders WHERE userID = " + session.getAttribute("uid") + " AND"
									+ " orderID = " + orderIDChain;
									resultSet = statement.executeQuery(sqlproduct);
								resultSet.first();
								%>
                                    <center><h4><strong>&#8369;<%=resultSet.getString("orderTotalPrice")%></strong></h4></center>
                                <%
									} catch (Exception e) {
									e.printStackTrace();
								}
								%>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
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

window.onload = function(){
	calculate();
}

function calculate(){

	//Compute Inclusive Fees
	var paymentmethod = document.getElementById("paymentmethod").innerText;

	var vat = parseFloat(document.getElementById("vat").innerText);
	var paypalfee = parseFloat(document.getElementById("paypalfee").innerText);
	var deliverfee = parseFloat(document.getElementById("deliverfee").innerText);
	
	vat = (Math.round(vat * 100) / 100).toFixed(2);
	paypalfee = (Math.round(paypalfee * 100) / 100).toFixed(2);
	deliverfee = (Math.round(deliverfee * 100) / 100).toFixed(2);
	
	document.getElementById("vat").innerHTML = vat;
	document.getElementById("paypalfee").innerHTML = paypalfee;
	document.getElementById("deliverfee").innerHTML = deliverfee;
		
	var inclusivefees = 0;
	
	if (paymentmethod == "PayPal"){
		inclusivefees =  parseFloat(vat) +  parseFloat(paypalfee) +  parseFloat(deliverfee);
	}
	else {
		inclusivefees =  parseFloat(vat) +  parseFloat(deliverfee);
	}
	
	inclusivefees = (Math.round(inclusivefees * 100) / 100).toFixed(2);
	console.log(inclusivefees);
	document.getElementById("inclusivefees").innerHTML = "<h5><strong>\&#8369;"+inclusivefees+"</strong></h5>";
}

//Switch Mode of Payments
var mop = document.getElementById("mop").value;
console.log(mop);
	if (mop == "Paid")
	{
		document.getElementById("paymentmethod").innerHTML = "PayPal"
		
	} else {
		document.getElementById("paymentmethod").innerHTML = "Cash on Delivery"
	}
	

</script>


</body>
</html>