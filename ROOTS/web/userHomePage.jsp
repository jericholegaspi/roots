<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/homepage.css">

 <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>
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
        <li class="nav-item">
          <a class="nav-link" href="userCartPage.jsp"><span class="fa fa-shopping-cart"><span class="badge badge-pill badge-warning total-count">2</span></span></a>
        </li>
      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <span class="fas fa-user-alt"></span>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="userProfile.jsp"><i class="fas fa-user-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Profile</span></a>
        <a class="dropdown-item" href="userInvoiceListPage.jsp"><i class="fas fa-file-invoice fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Invoice</span></a>
        <a class="dropdown-item" href="userAppointmentPage.jsp"><i class="far fa-calendar-check fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Appointment</a>
        <a class="dropdown-item" href="logout.action"><i class="fas fa-sign-out-alt fa-fw" style="color: #999966;"></i> <span style="padding-left:15px;">Logout</span></a>
      </div>
        
      </li>
    </ul>
           
    </form>    
  </div>
</nav> 
</div>

<!-- START of hero text -->
  <div class="hero-image">
    <div class="hero-text"><strong>Welcome</strong></div>
  </div>

<!-- END of hero text -->

<!-- START of carousel -->

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="assets/css/images/hpage-1.6.png" alt="PITAHC" width="1100" height="300">
    </div>
    <div class="carousel-item">
      <img src="assets/css/images/hpage-2.3.png" alt="PITAHC" width="1100" height="300">
    </div>
    <div class="carousel-item">
      <img src="assets/css/images/hpage-3.2.png" alt="Catalogue" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="assets/css/images/hpage-4.2.png" alt="Products" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="assets/css/images/hpage-5.2.png" alt="Services" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div> 

<!-- END of carousel -->

<!-- START of Catalogue -->


<div class="container-fluid catalogue">
<center>
  <div class="container">
    <h1 class="left" style="color: #cccc99"><strong>Check Our Bilingual Plant Catalogue</strong></h1>

        <!-- Nav pills -->
  <ul class="nav nav-pills mx-auto float-center" role="tablist">
    <li class="nav-item">
      <a class="nav-link btn-warning active" data-toggle="pill" href="#home">Filipino</a>
    </li>
    <li class="nav-item">
      <a class="nav-link btn-warning" data-toggle="pill" href="#menu1">English</a>
    </li>
  </ul>
 </div>

  <!-- Tab panes -->
  <div class="tab-content nav">
    <div id="home" class="container tab-pane active"><br> 

      <div class="row" id="myDIV">
        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/amp.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Ampalaya</h4>
            <a href="catalogue_page.html" class="btn btn-warning float-left">Learn More  <i class="fas fa-arrow-circle-right"></i></a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/baw.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Bawang</h4>
            <a href="catalogue_page.html" class="btn btn-warning float-left">Learn More  <i class="fas fa-arrow-circle-right"></i></a>
          </div>
          </div>
        </div>

        <div class="col">
          <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Abokado</h4>
            <a href="catalogue_page.html" class="btn btn-warning float-left">Learn More  <i class="fas fa-arrow-circle-right"></i></a>
          </div>
          </div>
        </div>
      </div>
      <br>
    </div>

  <div id="menu1" class="container tab-pane fade"><br>
    <div class="row" id="myDIV">
      <div class="col">
        <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/pineapple-1.jpg" alt="Card image" style="width:100%; height:200px;"">
          <div class="card-body">
            <h4 class="card-title">Pineapple</h4>
            <a href="catalogue_page.html" class="btn btn-warning float-left">Learn More  <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/baw.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Garlic</h4>
            <a href="catalogue_page.html" class="btn btn-warning float-left">Learn More  <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card item">
          <img class="card-img-top responsive-img" src="assets/css/images/avocado.jpg" alt="Card image" style="width:100%; height:200px;">
          <div class="card-body">
            <h4 class="card-title">Avocado</h4>
            <a href="catalogue_page.html" class="btn btn-warning float-left">Learn More  <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <small class="text-white">Note: Basis for the catalogue is from the book provided by PITAHC entitled "Patnubay sa Paggamit ng Halamang Gamot", currently unpublicized or published/sold online.</small>
    </center>
  </div>

<!-- END of Catalogue -->

<!-- Start of products -->

<div class="container-fluid intro">
  <div class="container">
  <h1 class="text-center" style="color:#444422;"><strong>Enjoy Purchasing Products with Roots</strong></h1><center>

  <div class="row">
    <div class="col">
      <div class="card icons">
        <i class="fas fa-shopping-cart fa-7x" style="color: #997300;"></i>
      </div>
      <div class="card-body">
        <h4 class="card-title text-center" style="color: white;">Order Product/s</h4>
        <p class="card-text text-center" style="color: #4d3900;">Purchase Products</p>
      </div>
    </div>
    <div class="col">
      <div class="card icons">
        <i class="fas fa-money-bill-wave fa-6x" style="color: #806000"></i>
      </div>
      <div class="card-body">
        <h4 class="card-title text-center" style="color: white;">Payment</h4>
        <p class="card-text text-center" style="color: #4d3900;">Cash on Deliver or PayPal</p>
        <p class="card-text"></p>
      </div>
    </div>
    <div class="col">
      <div class="card icons">
        <i class="fas fa-box-open fa-6x" style="color: #e6ac00"></i>
      </div>
      <div class="card-body">
        <h4 class="card-title text-center" style="color: white;">Receive Package</h4>
        <p class="card-text text-center" style="color: #4d3900;">Track order and delivery status</p>
        <p class="card-text"></p>
      </div>
    </div>
    
  </div>
  <a href="products_page.html" class="btn btn-warning">See Products  <i class="fas fa-arrow-circle-right"></i></a>
  </center>
  </div>
</div>

<!-- End of Products -->


<!-- START of Services -->  

<div class="container-fluid services"><center>
  <div class="container">
  <h1 class="left" style="color: #cccc99"><strong>Our Modalities</strong></h1>
  <div class="row">
    
  <div class="col">
      <div class="card serv">
        <div class="card-body">
          <p class="card-text text-center"><i class="fas fa-search fa-5x" style="color: #e67300"></i></p>
          <h4 class="card-title text-center">Browse Services</h4>
          
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card serv">
        <div class="card-body">
          <p class="card-text text-center"><i class="fas fa-map-marker-alt fa-5x" style="color: #cc3300"></i></p>
          <h4 class="card-title text-center">View Locations</h4>
          
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card serv">
        <div class="card-body">
          <p class="card-text text-center"><i class="fas fa-calendar-check fa-5x" style="color: #cc9900"></i></p>
          <h4 class="card-title text-center">Schedule Appointment</h4>
          
        </div>
      </div>
    </div>

    <div class="col">
      <div class="card serv">
        <div class="card-body">
          <p class="card-text text-center"><i class="fas fa-edit fa-5x" style="color: #79a6d2"></i></p>
          <h4 class="card-title text-center">Give Feedback</h4>
          
        </div>
      </div>
    </div>

  </div>
  <a href="servicePage.html" class="btn btn-warning">Explore Services <i class="fas fa-arrow-circle-right"></i></a>
    <div class="col">
      <div class="card icons">
        <i class="fas fa-user-check fa-10x" style="color: #e69900; padding-right: 20px; padding-bottom: 20px;"></i>
      </div>
      <div class="card-body">
        <h4 class="card-title text-center" style="color: white; padding-top: 50px; padding-left: 20px;">Licensed Practitoner</h4>
        <p class="card-text text-center" style="color: white;">Provided by PITAHC</p>
      </div>
    </div>
    
  </center>
</div>

  <button onclick="topFunction()" id="myBtn" title="Go to top"><span class="fa fa-angle-double-up"></span></button>
</div>

</div>

<!-- END of Services -->

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
            <a href="userProductIndex.jsp" class="text-secondary">Products</a>
          </li>
          <li>
            <a href="userServicePage.jsp" class="text-secondary">Services</a>
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
            <a href="userPrivacyPolicyPage.jsp" target="_blank" class="text-secondary">Privacy Policy</a>
          </li>
          <li>
            <a href="userTermsConditionsPage.jsp" target="_blank" class="text-secondary">Terms and Conditions</a>
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

</body>
</html>