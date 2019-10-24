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

 <link rel="stylesheet" type="text/css" href="assets/css/billingPage.css">

  <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

</head>
<body>
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

<div class="container-fluid bill">

<form id="regForm">
  <!-- One "tab" for each step in the form: -->
  
  <div class="tab"><h5>Contact Information</h5>
    <div class="form-row">
      <div class="col">
        <p><input placeholder="First name" oninput="this.className = ''" name="fname"></p>
      </div>
      <div class="col">
        <p><input placeholder="Last name" oninput="this.className = ''" name="lname"></p>
      </div>
    </div>
    <p><input placeholder="Email Address" oninput="this.className = ''" name="email"></p>
    <p><input placeholder="Phone Number" oninput="this.className = ''" name="phone">
    <p><br><h5>Billing Address</h5></p>
      <div class="form-row">
        <div class="col">
          <p><input placeholder="Street #" oninput="this.className = ''" name="email"></p>
          <p><input placeholder="Barangay/Subdivision" oninput="this.className = ''" name="email"></p>
        </div>
        <div class="col">
          <p><input placeholder="Street Name" oninput="this.className = ''" name="email"></p>
          <p><input placeholder="City" oninput="this.className = ''" name="email"></p><br>
        </div>
      </div>  
  </div>

  <div class="tab"><h5>Invoice Summary</h5><br>
    <div class="col-sm-8">
      <p>Abigail Abada</p>
      <p>4778425</p>
      <p><i>104 Northeast Ipil St. Marikina Heights Marikina City</i></p>
    </div>
    <br><hr><br>
    <div class="col-sm-12">
      <div class="row">
        <table>
          <thead>
            <tr>
              <th style="width:20%">Quantity</th>
              <th style="width:40%">Product Name</th>
              <th style="width:30%">Total</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td data-th="Quantity">
                  <div class="col-sm-3">
                    <p>1</p>
                  </div>
              </td>
              <td data-th="Product Name">
                <h6>Product Name 1</h6>
              </td>
              <td data-th="Total">
                <p>P 1000</p>
              </td>
            </tr>
          </tbody>
          <tfoot>
            <tr>        
              <td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
            </tr>
          </tfoot>       
        </table>
        
      </div>
      <br><hr>
        <h5>Payment Option</h5><br>
          <!-- PayPal Logo -->
          <table border="0" cellpadding="10" cellspacing="0" align="center">
            <tr>
              <td align="center"></td>
            </tr>
            <tr>
              <td align="center">
                <a href="https://www.paypal.com/ph/webapps/mpp/paypal-popup" title="How PayPal Works" onclick="javascript:window.open('https://www.paypal.com/ph/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;">
                  <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-medium.png" alt="Check out with PayPal" />
                </a>
              </td>
            </tr>
          </table>
          <!-- PayPal Logo -->
    </div>
    
  <div class="tab"><h5>Payment Option</h5><br>
    
  </div>  
  </div>

  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>

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
<div class="modal fade" id="payment-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-shopping-cart fa-4x" style="height: 70px; color: green;"></i>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
             <div class="col-md-10 justify-content-center">
              <p class="p-title">Are you sure you want to checkout?</p>
            </div>

        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
         <a type="button" class="btn btn-primary" href="userInvoicePage.jsp">Yes</a></button>
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

//previous and next button 
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Proceed to Payment";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>

</body>
</html>
