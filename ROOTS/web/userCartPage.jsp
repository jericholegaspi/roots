<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Cart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/cartpage.css">

 <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

 <script src="assets/js/cartTotal.js" async></script>
 <script src="assets/js/cartItemDelete.js" async></script>

</head>

<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email") == null))
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
	%>

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
    </form>    
  </div>
</nav> 
</div>

<br> <br><br> <br>

<div class="container cartTable">
  <table id="cart" class="table table-hover table-condensed">
            <thead>
            <tr>
              <th style="width:48%">Product</th>
              <th style="width:10%">Unit Price</th>
              <th style="width:10%">Quantity</th>
              <th style="width:5%">Unit</th>
              <th style="width:12%" class="text-center">Subtotal</th>
              <th style="width:15%"></th>
            </tr>
          </thead>
          <tbody class="cart-items">
            <%
			try {
				/* ResultSet resultSet2 = null;
				Statement statement2 = null;
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement2 = connection.createStatement();
				String sqlorders = "SELECT * FROM orders WHERE userID = " + session.getAttribute("uid") + " AND"
						+ " cartStatus = 'Idle'";
				resultSet2 = statement2.executeQuery(sqlorders);
				resultSet2.first(); */
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
			<tr class="cart-row">
			    <td data-th="Product">
			        <div class="row">
			            <div class="col-sm-3 hidden-xs">
			            	<img src="http://placehold.it/100x100" alt="..." class="img-responsive" />
			            </div>
			            <div class="col-sm-8">
			           		<h4 style="display: none;" class="cart-product-id"><%=resultSet.getInt("prodID")%></h4>
			                <h4 class="cart-product-name nomargin p-title"><%=resultSet.getString("prodName")%></h4>
			                <p class="p-text"><%=resultSet.getString("description")%></p>
			            </div>
			        </div>
			    </td>
			    <td data-th="Unit Price" class="cart-price">&#8369;<%=resultSet.getInt("initialPrice")%></td>
			    <td data-th="Quantity"><span class="cart-product-quantity"><%=resultSet.getInt("orderItemQty")%></span></td>
			    <td data-th="Unit"><%=resultSet.getString("unit")%></td>
			    <td data-th="Subtotal" class="cart-item-subtotal text-center">&#8369;<%=resultSet.getInt("orderItemSubTotal")%></td>
			    <td class="actions" data-th="">
			    	<button type="submit" form="submitIDToDetails" class="cart-item-edit btn btn-info btn-sm">
			        	Edit Qty <i class="fa fa-magic"></i> 
			        </button>
			        <button class="cart-item-delete btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-confirmation">
			        	<i class="fas fa-trash-alt"></i>
			        </button>
			        
			    </td>
			</tr>
			<%
					}
				} catch (Exception e) {
				e.printStackTrace();
			}
			%>
          </tbody>
          <tfoot>
            <tr>
              <td><a href="userProductIndex.jsp" class="btn btn-outline-primary"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
              <td colspan="3" class="hidden-xs"></td>
              <td data-th="Subtotal" class="cart-total-price hidden-xs text-center">Total: </td>
              <td><a href="userBillingPage.jsp" class="btn btn-warning" data-toggle="modal" data-target="#checkout-confirmation">Checkout <i class="fa fa-angle-right"></i></a></td>
            </tr>
          </tfoot>
        </table>
</div>

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

<!-- START of Delete Confirmation Modal -->
<div class="modal fade" id="delete-confirmation" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel"><i class="fas fa-exclamation-circle fa-2x justify-content-center" style="color:#bbbb77"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form action="removeCartItem.action" method="post" id="removeCartItem">
      		<input type="hidden" name="prodID" id="modal-prodID"/>
      		<input type="hidden" name="prodName" id="modal-prodName"/>
            <p class="text-center">Are you sure you want to delete this item?</p>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button type="submit" form="removeCartItem" class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div> 

<!--END of Delete Confirmation Modal -->

<!-- START of Checkout Confirmation Modal -->
<div class="modal fade" id="checkout-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-exclamation-circle fa-2x justify-content-center" style="color:#bbbb77"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <p class="question text-center">Are you want to proceed with the check out?</p>
            <br>
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
            <p class="text-center">You have (<%=resultSet.getInt("count(orderItemID)")%>) items in your cart</p>
            <%
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button type="submit" form="goToBilling" class="btn btn-warning">Proceed</button>
      </div>
    </div>
  </div>
</div> 

<!--END of Checkout Confirmation Modal -->

<script>
  <!-- go to top -->
$(document).ready(function(){
  $('body').scrollspy({target: ".navbar", offset: 50});   
});

/* window.onscroll = function() {scrollFunction()}; */

/* function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
} */

//For multiple modals modals:

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}


</script>
</body>
</html>