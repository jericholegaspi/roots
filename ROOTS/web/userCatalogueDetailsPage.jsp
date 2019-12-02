<!DOCTYPE html>
<html lang="en">

<head>
    <title>Catalogue Details</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="assets/css/productDetailsPage.css">

    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png" />

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
            <!-- Brand -->t
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
    
    <%
		int catalogueIDChain = Integer.parseInt(request.getParameter("catalogueID"));
		try {
		connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		statement = connection.createStatement();
		String sqlproduct = "SELECT * FROM catalogue"
				+ " WHERE catalogueID = " + catalogueIDChain;
		resultSet = statement.executeQuery(sqlproduct); 
		resultSet.first();
	%>

    <div class="container product-detail justify-content-center">
        <div class="card">
            <div class="col-sm-12">
                <a href="userCataloguePage.jsp" class="btn btn-outline-primary float-left btn-lg"><i class="fas fa-arrow-left"></i></a>

                <div class="row">

                    <div class="card-body col-sm-8">
                        <p class="p-title">Recommended:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("recommendedF")%>
                        </p>
                        <br>
                        <p class="p-title">Beneficial Use:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("benefitF")%>
                        </p>
                        <br>
                        <p class="p-title">Traditional Use:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("traditionalUseF")%>
                        </p>
                        <br>
                        <p class="p-title">Popular Use:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("popularUseF")%>
                        </p>
                        <br>
                        <p class="p-title">Food Use:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("foodUseF")%>
                        </p>
                        <br>
                        <p class="p-title">Caution:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                           <%=resultSet.getString("cautionF")%>
                        </p>
                        <br>
                        <p class="p-title">Other Information:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("otherInfoF")%>
                        </p>
                        <br>
                        <p class="p-title">Location:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("location")%> 
                        </p>
                        <br>
                        <p class="p-title">Added Information:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                            <%=resultSet.getString("addedInfoF")%>
                        </p>
                        <br>
                        <p class="p-title">Source:</p>
                        <p class="p-text" style="overflow:auto; height:120px;">
                           <%=resultSet.getString("source")%>
                        </p>
                        <br>

                        <br>

                    </div>
				
                    <div class="col-sm-4">
                        <div class="card-title">
                        <img class="responsive-img float-right" src="assets/css/images/pitahc-logo.jpg" alt="pitahc-logo" style="width:60px; height:60px;">

                            <h3><%=resultSet.getString("nameF")%></h3>
                            <p>
                                <h6><i><%=resultSet.getString("scientificName")%></i></h6>
                                
                            </p>
                        </div>

                        <img class="card-img-top responsive-img" src="images/catalogue/<%=resultSet.getString("catalogueImageName")%><%=resultSet.getString("catalogueImageType")%>" alt="Card image" style="width:250px; height:200px;">
                        <small><p class="note text-danger">*Note:<br> Roots does not cater self-diagnosis of ailments, diseases and illnesses of individuals.</i></p></small>

                        <br><br><br><br>


                        <br>

                    </div>

                </div>
            </div>
        </div>

    </div>
				<%
					} catch (Exception e) {
					e.printStackTrace();
				}
				%>


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
                            <a href="aboutPage.html" class="text-secondary">About</a>
                        </li>
                        <li>
                            <a href="contactUsPage.html" class="text-secondary">Contact Us</a>
                        </li>
                        <li>
                            <a href="FAQPage.html" class="text-secondary">FAQs</a>
                        </li>
                        <li>
                            <a href="privacyPolicyPage.html" target="_blank" class="text-secondary">Privacy Policy</a>
                        </li>
                        <li>
                            <a href="termsConditionsPage.html" target="_blank" class="text-secondary">Terms and Conditions</a>
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
    <!-- Footer -->

    <!-- START of Modal -->
    <div class="modal fade" id="cart-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
            <div class="modal-content text-center">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-exclamation-circle fa-2x" style="color: #bbbb77;"></i>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-center">
                        <div class="col-md-12">
                            <p>Are you sure you want to add this to cart?</p>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">No</button>
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