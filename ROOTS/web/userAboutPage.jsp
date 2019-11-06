<!DOCTYPE html>
<html lang="en">
<head>
<title>About Us</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/aboutPage.css">

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
          <a class="nav-link" href="userCartPage.jsp"><span class="fa fa-shopping-cart"><span class="badge total-count"></span></span></a>
        </li>
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

<!-- START of hero -->
  <div class="hero-image">
  <div class="hero-text">
    <strong>About Us</strong>
    <hr>
    
  </div>
</div>
</div>

<!-- END of hero -->

<div class="container about">
  <div class="row">
    <div class="col-sm-7">
      <div class="card">
        <div class="col-sm-12">
          <p class="roots-title"><strong>ROOTS</strong></p>      
          <br>
            <p class="col-sm-12 roots">A platform for traditional and lternative modalities and medicine, where its namesake came from the definition that it came from a source, an origin of something which in this case pertains to the origins of the Filipino healthcare system where today's modern medicine evolved from the possible use and research about tarditional medicine</p>
            <p class="col-sm-12 roots">It is a web-enabled application that provides traditional and alternative medicine services from licensed practitioners with the ability to  purchase medicinal plants, herbs and other products online. In addition, the catalogue also provides recipes on how to use and cultivate the medicinal plants and process them into alternative supplements/medicines.</p>
            <img src="assets/css/images/logo5.png" class="img-responsive float-right" style="height: 90px; width: 160px;">
            
        </div>  
      </div>
      <div class="card">
        <p class="col-sm-12 creators"><strong>Website Developers:</strong></p>
      <div class="row">
              
                <div class="col-sm-3">
                  <p><img src="assets/css/images/abi-1.jpg" class="img-responsive people"></p>
                  <p class="text-center">Abigail Abada</p>
                  <p class="text-center"><small><i>Frontend Developer</i></small></p>
                  <hr class="line">
                </div>

                <div class="col-sm-3">
                  <p><img src="assets/css/images/jeco-1.jpg" class="img-responsive people"></p>
                  <p class="text-center">Jericho Legaspi</p>
                  <p class="text-center"><small><i>Backend Developer</i></small></p>
                  <hr class="line"> 
                </div>

                <div class="col-sm-3">
                  <p><img src="assets/css/images/phil-1.jpg" class="img-responsive people"></p>
                  <p class="text-center">Phil Mendoza</p>
                  <p class="text-center"><small><i>Backend Developer</i></small></p>
                  <hr class="line">
                </div>

                <div class="col-sm-3">
                  <p><img src="assets/css/images/anton-1.jpg" class="img-responsive people"></p>
                  <p class="text-center">Antonio Soriano</p>
                  <p class="text-center"><small><i>Documentation</i></small></p>
                  <hr class="line">
                </div>
              
            </div>
          </div>
    </div>
    <div class="col-sm-5">
        <div class="card">
          <div class="col-sm-12">
            <p class="col-sm-12 pitahc"><strong>The Philipine Institue of Traditional and Alternative Health Care (PITAHC)</strong>, an attached agency under the <i>Department of Health (DOH)</i>. PITAHC helps develop traditional and alternative health care modalities that have been proven safe, effective, cost effective and consisitent with government standards on medical practices.</p>
              <p class="col-sm-12">As a research institute, PITAHC is responsible for the documentation, promotion and advocacy for the use of traditional and health care products, modalities, and technologies.</p>
            
            <p class="col-sm-12 pitahcDetails"><small><strong>Address: </strong> PITAHC Building, East Avenue Medical Center Compound, Matapang Street, Barangay Central, Quezon City, Metro Manila, Philippines 1100 <br>
            <strong>Telefax Number: </strong> (02) 376-3076 / 376-3068 <br>
            <strong>Established Date: </strong> December 9, 1997 
            </p>
            <img src="assets/css/images/pitahc-logo.jpg" class="img-responsive float-right" style="height: 70px; width: 70px;">

            </small>
            </p>
          </div>
        </div>
     
    </div>
  </div>
</div>


</div>
<button onclick="topFunction()" id="myBtn" title="Go to top"><span class="fa fa-angle-double-up"></span></button>

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

//Search
//go to top
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