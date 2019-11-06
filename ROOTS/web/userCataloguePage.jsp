<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Plant Catalogue</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/cataloguepage.css">

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
        <a class="nav-link" href="userCataloguePage.jsp">Catalogue</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userProductsPage.jsp">Products</a>
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

<!-- START of hero -->
  <div class="hero-image">
  <div class="hero-text">
    Plant Catalogue
    <hr>
    <p class="description">Displays the different types of medicinal plants from a catalogue of recognized medicinal plants and herbs according to the book provided by PITAHC</p>
  </div>
</div>
</div>

<!-- END of hero -->


<div class="container">
  <br>
  <!-- Nav pills -->
  <ul class="nav nav-pills mx-auto" role="tablist">
    <li class="nav-item">
      <a class="nav-link btn-outline-warning active" data-toggle="pill" href="#home">Filipino</a>
    </li>
    <li class="nav-item">
      <a class="nav-link btn-outline-warning" data-toggle="pill" href="#menu1">English</a>
    </li>
    <li class="ml-auto">
      <input type="text" id="searchbar" onkeyup="myFunction()" class="search form-control" placeholder="Search for Plant" data-toggle="tooltip" data-placement="bottom" title="What are you looking for?">
    </li>
  </ul>
  <br>
  
<br>

  <!-- Tab panes -->
  <div class="tab-content nav">
    <div id="home" class="container tab-pane active"><br>
 
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
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Pinya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/baw.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Banana</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/baw.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Bawang</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ube</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>
      <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Pinya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Bayabas</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Bayabas</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Carrot</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>

      <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Malunggay</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Coconut</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Coconut</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Mais</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>

      <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>

       <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>
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

    <div id="menu1" class="container tab-pane fade"><br>

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
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Pinya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/baw.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Bawang</h4>
            <p class="card-text">Category</p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ube</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>
      <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Pinya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Carrot</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>

      <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Malunggay</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>


        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Mais</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>

      <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See Details</a>
          </div>
          </div>
        </div>
      </div>

      <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

       <br>

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <p class="card-text"><i>Scientific Name</i></p>
            <a href="#" class="btn btn-warning stretched-link" data-toggle="modal" data-target="#product-details">See More</a>
          </div>
          </div>
        </div>
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
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="https://mdbootstrap.com/education/bootstrap/"> Roots.com</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->

<!-- START of Modal -->
<div class="modal fade" id="product-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Catalogue Item Name
          <br>
        <small>Scientific Name</small>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-4 justify-content-center">
            <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
          </div>
             <div class="col-md-8" style="overflow:auto; height: 350px;">
              <p class="p-title">Recommended:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Traditional Use:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Popular Use:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Food Use:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Caution:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>          
              <p class="p-title">Other Information:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Location:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Added Information:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
              <p class="p-title">Source:</p>
              <p class="p-text">Description Description Description Description Description Description
                Description Description Description Description Description Description Description Description Description Description Description Description
              </p>
              <br>
            </div>

        </div>
        
      </div>
      <div class="modal-footer">
        <img class="responsive-img ml-auto" src="assets/css/images/pitahc-logo.jpg" alt="Card image" style="width:50px; height:50px;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!--<button type="button" class="btn btn-primary">Order now</button>-->
      </div>
    </div>
  </div>
</div> 

<!--END of Modal -->


<!-- START of script-->
<script>

//Tooltip
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

//Search
function myFunction() {
    var input, filter, cards, cardContainer, h4, title, i;
    input = document.getElementById("searchbar");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myDIV");
    cards = cardContainer.getElementsByClassName("card");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body h4.card-title");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

<!-- Search -->
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


<!-- END of scripts-->
</body>
</html>