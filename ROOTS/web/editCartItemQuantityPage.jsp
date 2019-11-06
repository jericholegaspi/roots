<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>Product Details</title>
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
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="userLogin.jsp"></jsp:forward>
<% 
} 
%>
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
        				<span class="fas fa-user-alt"></span></a>
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
<div class="container product-detail justify-content-center">
	<%
		int prodIDChain = Integer.parseInt(request.getParameter("prodID"));
		try {
		connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		
		ResultSet resultSet2 = null;
		Statement statement2 = null;
		
		statement2 = connection.createStatement();
		String sqlorderitems = "SELECT * FROM orderItems"
				+ " WHERE userID = " + session.getAttribute("uid") + " AND"
				+ " cartState = 'Idle' AND prodID = " + prodIDChain;
		resultSet2 = statement2.executeQuery(sqlorderitems);
		resultSet2.first();
		
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
	<form action="editOrderQuantity.action" method="post" id="addToCart">
    <div class="card">
        <div class="col-sm-12">
        <a href="userCartPage.jsp" class="btn btn-outline-primary float-left btn-lg"><i class="fas fa-arrow-left"></i></a>
            <div class="row">
                <div class="col-sm-4">
                    <div class="card-title">
                        <h3><%=resultSet.getString("prodName")%></h3>
                    </div>
                    <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>"/>
                    <input type="hidden" name="prodID" value="<%=resultSet.getString("prodID")%>"/>
                    <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
                    <br><br><br><br>
                    
                    <br>
                </div>
                <div class="card-body col-sm-8">
                    <h6><strong>Description</strong></h6>
                    <p class="p-desc"><%=resultSet.getString("description")%></p>
                    <br>
                    <br>
                    <h6><strong>Price</strong></h6>
                    <h5><strong>&#8369;<%=resultSet.getString("initialPrice")%>/<%=resultSet.getString("unit")%></strong></h5>
                    <br>
                    <br>
                    <h6><strong>Quantity</strong></h6>
                    <a href="userCartPage.jsp" class="btn btn-warning float-right btn-lg" data-toggle="modal" data-target="#cart-confirmation">Update Quantity</a>
                    <p><input type="number" name="orderItemQty" min='1' max='<%=resultSet.getString("prodQty")%>' value='<%=resultSet2.getString("orderitemQty")%>'/><br>
					<small>Stock:<%=resultSet.getString("prodQty")%></small></p>
					<input type="hidden" name="initialPrice" value="<%=resultSet.getString("initialPrice")%>"/>
				</form>
				<%
					} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				
				
                    <br>

                    <h6>Comments:</h6>
                    <div class="container mt-4 overflow-auto" style="height:200px;">
                        <div class="media border p-3 align-self-start">
                            <img src="assets/css/images/abi-1.jpg" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                            <div class="media-body">
                                <h6>Abigail Abada <small><i>Posted on February 19, 2016</i></small></h6>
                                <p class="feedback">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div class="media border p-3 align-self-start">
                            <img src="assets/css/images/abi-1.jpg" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                            <div class="media-body">
                                <h6>John Doe <small><i>Posted on February 19, 2016</i></small></h6>
                                <p class="feedback">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div class="media border p-3 align-self-start">
                            <img src="assets/css/images/abi-1.jpg" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                            <div class="media-body">
                                <h6>John Doe <small><i>Posted on February 19, 2016</i></small></h6>
                                <p class="feedback">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                        <div class="media border p-3 align-self-start">
                            <img src="assets/css/images/abi-1.jpg" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                            <div class="media-body">
                                <h6>John Doe <small><i>Posted on February 19, 2016</i></small></h6>
                                <p class="feedback">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div>
                    </div>

                    <br><br>
                </div>
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
                <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-exclamation-circle fa-2x" style="color: #bbbb77;"></i>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
            </div>
            <div class="modal-body">
                <div class="row text-center">
                    <div class="col-md-12">
                        <p>Are you sure you want to add this to cart?</p>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">No</button>
                <button type="submit" form="addToCart" class="btn btn-warning">Yes</button>
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