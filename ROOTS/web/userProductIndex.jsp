<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 	<link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

    <link rel="stylesheet" type="text/css" href="assets/css/productspage.css">


    <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="images/logo5.png" />
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
</div>

<!-- START of hero -->
<div class="hero-image">
    <div class="hero-text">
        <strong>Products</strong>
        <hr>
        <p class="description">Items are provided by Philippine Institute of Traditional and Alternative Health Care (PITAHC) and a third party.</p>
    </div>
</div>

<!-- END of hero -->

    <div class="container">
        <br>
        <!-- Nav pills -->
        <ul class="nav nav-pills mx-auto" role="tablist">
            <li class="nav-item">
                <img class="float-left" src="assets/css/images/pitahc-logo.jpg" alt="Card image" style="width:90px; height:90px;">
            </li>
            <li class="ml-auto">
                <div class="btn-group">
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Search a Category
          </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <button class="dropdown-item" type="button">Bath</button>
                        <button class="dropdown-item" type="button">Beans and Legumes</button>
                        <button class="dropdown-item" type="button">Face</button>
                        <button class="dropdown-item" type="button">Fruits</button>
                        <button class="dropdown-item" type="button">Skin Care</button>
                        <button class="dropdown-item" type="button">Supplement</button>
                        <button class="dropdown-item" type="button">Vegetables</button>
                    </div>
                </div>

            </li>
        </ul>
        <br>

        <br>

        <!-- Tab panes -->
        <div class="tab-content nav">
            <div id="home" class="container-fluid tab-pane active"><br>

                <nav aria-label="...">
                    <ul class="pagination justify-content-end pagination-sm">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
              <span class="sr-only">Previous</span>
            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
                        </li>
                    </ul>
                </nav>
                
                <div class="row" id="myDIV">
                <%
				try {
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();
					String sqlproduct = "SELECT products.prodID, products.prodName,"
						+ " products.description, products.initialPrice, products.prodQty,"
						+ " units.unit, category.catID, category.category, products.Availability,"
						+ " products.prodLastUpdate, products.critLevel FROM products"
						+ " INNER JOIN category ON products.catID = category.catID"
						+ " INNER JOIN units ON products.unitID = units.unitID";
					resultSet = statement.executeQuery(sqlproduct);
				while (resultSet.next()) {
				%>
				<form action="selectItemID.action" method="post">
                    <div class="col">
                        <div class="card item">
                            <img class="card-img-top" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
                            <div class="card-body">
                                <h4 class="card-title"><%=resultSet.getString("prodName")%></h4>
                                <h6 class="card-subtitle mb-2 text-muted"><%=resultSet.getString("category")%></h6>
                                <br>
                                <p class="card-text">&#8369;<%=resultSet.getString("initialPrice")%>/<%=resultSet.getString("unit")%></p>
                                <input type="hidden" name='prodID' value="<%=resultSet.getString("prodID")%>" readonly/>
                                <input type="submit" class="btn btn-warning stretched-link float-right" value="See Details"/>
                            </div>
                        </div>
                    </div>
               </form>
                    <%
						}
					} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				
                </div>
                <br>

                <nav aria-label="...">
                    <ul class="pagination justify-content-center pagination-sm">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
                        </li>
                    </ul>
            </div>

        </div>

        <br>
        </nav>
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
    </script>
    
<!-- <script>
	$('.see-details').click(function(){
		var prodID = $(this).attr("id");
	 $.ajax({
		url:"userProductDetails.jsp",
		method:"POST",
		data:{prodID:prodID},
		success:function(data){
			$('#prodDetails').html(data);
			$('#product-details').modal("show");
			}
		});
	});  
</script> -->
</body>
</html>