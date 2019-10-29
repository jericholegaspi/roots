<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="assets/css/productDetailsPage.css">
	
	<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "isproj2_roots";
	String userId = "root";
	String password = "";

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
                        <a class="nav-link" href="cart_page.html"><span class="fa fa-shopping-cart"><span class="badge total-count"></span></span></a>
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
		
<div class="container product-detail">
    <div class="card">
        <div class="col-sm-12">
            <div class="row">
				<%
				int prodIDChain = Integer.parseInt(request.getParameter("prodID"));
				try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sqlproduct = "SELECT products.prodID, products.prodName,"
						+ " products.description, products.initialPrice, products.prodQty,"
						+ " units.unit, category.catID, category.category, products.Availability,"
						+ " products.prodLastUpdate, products.critLevel FROM products"
						+ " INNER JOIN category ON products.catID = category.catID"
						+ " INNER JOIN units ON products.unitID = units.unitID"
						+ " WHERE prodID = " + prodIDChain;
				resultSet = statement.executeQuery(sqlproduct); 
				resultSet.first();
				%>
                <div class="col-sm-4">
                    <div class="card-title">
                        <h3><%=resultSet.getString("prodName")%></h3>
                    </div>
                    <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
                </div>
                <div class="card-body col-sm-8">

                    <h6>Description</h6>
                    <p class="p-desc"><%=resultSet.getString("description")%></p>
                    <br>
                    <h6><strong>Price</strong></h6>
                    <h5><%=resultSet.getString("initialPrice")%>/<%=resultSet.getString("unit")%></h5>
                    <br><br>
                    <a href="userProductIndex.jsp" class="btn btn-outline-primary btn-lg"><i class="fas fa-arrow-left"></i></a>
                    <a href="cart_page.html" class="btn btn-warning float-right btn-lg" data-toggle="modal" data-target="#cart-confirmation">Add to Cart</a>
                </div>
            <%
				} catch (Exception e) {
				e.printStackTrace();
			}
			%>
            </div>
        </div>
    </div>
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
    <div class="footer-copyright text-center py-3">© 2019 Copyright:
        <a href="https://mdbootstrap.com/education/bootstrap/"> Roots.com</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->

<!-- START of Modal -->
<div class="modal fade" id="cart-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-cart-plus fa-4x" style="height: 70px; color: green;"></i>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
            </div>
            <div class="modal-body">
                <div class="row text-center">
                    <div class="col-md-10">
                        <p class="p-title">Are you sure you want to add this to cart?</p>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
                <a href="cart_page.html" class="btn btn-warning">Yes</a>
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
</script>


</body>
</html>