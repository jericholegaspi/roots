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
        <a class="navbar-brand" href="Home_Page_v2.html">
      <img src="assets/css/images/logo5.png" height="50px" width="90px">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-top">
            <!-- Brand -->
            <a class="navbar-brand" href="Home_Page_v2.html">
      <img src="images/logo5.png" height="50px" width="90px">
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">More</a>
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
                            <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Invoice</a>
                            <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Logout</a>
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
        Products
        <hr>
        <p class="description">Items are provided by PITAHC and a third party.</p>
    </div>
</div>

<!-- END of hero -->

    <div class="container">
        <br>
        <!-- Nav pills -->
        <ul class="nav nav-pills mx-auto" role="tablist">
            <li class="nav-item">
                <img class="responsive-img" src="images/pitahc-logo.jpg" alt="Card image" style="width:90px; height:90px;">
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
                            <img class="card-img-top responsive-img" src="images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
                            <div class="card-body">
                                <h4 class="card-title"><%=resultSet.getString("prodName")%></h4>
                                <h6 class="card-subtitle mb-2 text-muted"><%=resultSet.getString("category")%></h6>
                                <br>
                                <p class="card-text">P <%=resultSet.getString("initialPrice")%>/<%=resultSet.getString("unit")%></p>
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
        <div class="footer-copyright text-center py-3">� 2019 Copyright:
            <a href="https://mdbootstrap.com/education/bootstrap/"> Roots.com</a>
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