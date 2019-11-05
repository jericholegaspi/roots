<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Products</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/cartpage.css">

 <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

 <script src="assets/js/cartTotal.js" async="true"></script>
 <script src="assets/js/cartItemDelete.js" async="true"></script>

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
	%>

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
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"><span class="fa fa-search"></span></button>

      <ul class="navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="userCartPage.jsp"><span class="fa fa-shopping-cart"><span class="badge total-count"></span></span></a>
        </li>
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="fa fa-user"></span>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Profile</a>
        <a class="dropdown-item" href="invoice_page.html"><span class="fa fa-sign-in"></span>Invoice</a>
        <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Logout</a>
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
              <th style="width:1%"></th>
              <th style="width:49%">Product</th>
              <th style="width:10%">Unit Price</th>
              <th style="width:10%">Quantity</th>
              <th style="width:10%">Unit</th>
              <th style="width:10%" class="text-center">Subtotal</th>
              <th style="width:10%"></th>
            </tr>
          </thead>
          <tbody class="cart-items">
            <%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sqlproduct = "SELECT orderItems.orderItemID, orderItems.userID, orderItems.prodID,"
						+ " orderItems.cartState, products.prodID, products.prodName, products.description,"
						+ " products.initialPrice, products.unitID, units.unitID, units.unit FROM orderItems"
						+ " INNER JOIN products ON orderItems.prodID = products.prodID"
						+ " INNER JOIN units ON products.unitID = units.unitID"
						+ " WHERE orderItems.userID = " + session.getAttribute("uid") + " AND"
						+ " orderItems.cartState = 'Idle'";
				resultSet = statement.executeQuery(sqlproduct);
			while (resultSet.next()) {
			%>
			<tr class="cart-row">
				<td data-th="ID" ><span style="display:  none;" class="cart-product-id"><%=resultSet.getString("prodID")%></span></td>
			    <td data-th="Product">
			        <div class="row">
			            <div class="col-sm-3 hidden-xs">
			            	<img src="http://placehold.it/100x100" alt="..." class="img-responsive" />
			            </div>
			            <div class="col-sm-8">
			                <h4 class="cart-product-name nomargin p-title"><%=resultSet.getString("prodName")%></h4>
			                <p class="p-text"><%=resultSet.getString("description")%></p>
			            </div>
			        </div>
			    </td>
			    <td data-th="Unit Price" class="cart-price">&#8369;<%=resultSet.getString("initialPrice")%></td>
			    <td data-th="Quantity"><input type="number" class="cart-quantity-input form-control text-center" min='1' value="1"></td>
			    <td data-th="Unit"><%=resultSet.getString("unit")%></td>
			    <td data-th="Subtotal" class="cart-item-subtotal text-center">&#8369;<%=resultSet.getString("initialPrice")%></td>
			    <td class="actions" data-th="">
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
              <td></td>
              <td><a href="#" class="btn btn-outline-primary"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
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
  <div class="footer-copyright text-center py-3">Â© 2019 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> Roots.com</a>
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
      		<input type="text" name="prodID" id="productIdGetTest" readonly/>
      		<input type="text" name="prodName" id="productName	GetTest" readonly/>
            <p class="text-center">Are you sure you want to delete this item?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <input type="submit" form="removeCartItem" class="btn btn-danger" value="Delete">
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
            <p class="text-center">You have ( ) items in your cart</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <a href="userBillingPage.jsp" class="btn btn-warning">Proceed</a>
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

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

//For multiple modals modals:

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

/* 	var table = document.getElementById('cart');
	
	for(var i = 1; i < table.rows.length; i++){
	    table.rows[i].onclick = function(){
		document.getElementById("productIdGetTest").value = this.cells[0].innerHTML;
	}
} */
	
/* function hideProdID(){
	for(var i = 1; i < table.rows.length; i++){
	    table.rows[i].onload = function(){
		document.getElementById("putangina").style.visibility = "hidden";
	    }
	}
	/* document.getElementById("putangina").style.visibility = "hidden"; */
/* }

window.onload = hideProdID();  */

</script>
</body>
</html>