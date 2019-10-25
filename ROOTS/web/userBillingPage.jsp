<!DOCTYPE html>
<html lang="en">
<head>
<title>Cart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- For PayPal Sandbox -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/billingPage.css">

  <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

</head>
<body>

  <!-- PayPal Script -->
  <script src="https://www.paypal.com/sdk/js?client-id=AQcMM3RdMEi_MxhI4tErRCEzKhIriOxlG1TIOrsdwAz-xBJ0QJhqsgu4jRSTRNlztO1kWroOqdNFfnww&currency=PHP">
  </script>
	
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
        <a class="nav-link" href="products_page.html">Products</a>
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
  
  <div class="tab"><h5>Contact Information</h5><br>
    <div class="form-row">
      <div class="col">
        <label for="fname">First Name</label>
        <input placeholder="Enter your first name" oninput="this.className = ''" name="fname"></p>
      </div>
      <div class="col">
        <label for="lname">Last Name</label>
        <input placeholder="Enter your last name" oninput="this.className = ''" name="lname"></p>
      </div>
    </div>
      <label for="email">Email Address</label>
        <input placeholder="Enter your email address" oninput="this.className = ''" name="email"></p>
      <label for="phone">Phone Number</label>
        <input placeholder="Enter your phone number" oninput="this.className = ''" name="phone"></p>
      <br><br><h5>Billing Address</h5><br>
    <div class="form-row">
      <div class="col">
        <label for="snumber">Street Number</label>
          <input placeholder="Enter your street number" oninput="this.className = ''" name="snumber"></p>
            <label for="brgy">Barangay/Subdivision</label>
          <input placeholder="Enter your barangay/subdivision" oninput="this.className = ''" name="brgy"></p>
      </div>
      <div class="col">
        <label for="sname">Street Name</label>
          <input placeholder="Enter your street name" oninput="this.className = ''" name="sname"></p>
            <label for="City">City</label>  
          <input placeholder="Enter your city" oninput="this.className = ''" name="city"><br>
       </div>
    </div>  
  </div>

  <div class="tab"><h5>Order Summary</h5><br>
    <div class="col-sm-12">
      <div class="row">
        <div class="col">
        <p>Name: Abigail Abada</p>
        <p>Phone Number: 4778425</p>
        <p>Email Address: abigailhana.abada@benilde.edu.ph</p>
        <p>Billing Address: <i>104 Northeast Ipil St. Marikina Heights Marikina City</i></p>
        </div>
      </div>
    </div>
    <br><hr><br>
    <div class="col-sm-12">
      <div class="row">
        <table class="table">
          <thead>
            <tr>
              <th class="border-0 text-uppercase small font-weight-bold">ID</th>
              <th class="border-0 text-uppercase small font-weight-bold">Item</th>
              <th class="border-0 text-uppercase small font-weight-bold">Description</th>
              <th class="border-0 text-uppercase small font-weight-bold">Quantity</th>
              <th class="border-0 text-uppercase small font-weight-bold">Unit Cost</th>
               <th class="border-0 text-uppercase small font-weight-bold">Total</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Software</td>
              <td>LTS Versions</td>
              <td>21</td>
              <td>$321</td>
              <td>$3452</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Software</td>
              <td>Support</td>
              <td>234</td>
              <td>$6356</td>
              <td>$23423</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Software</td>
              <td>Sofware Collection</td>
              <td>4534</td>
              <td>$354</td>
              <td>$23434</td>
            </tr>
          </tbody>
        </table>      
      </div>
      <br><hr>
        <h5>Mode of Payment</h5><br>

        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
          <label class="form-check-label" for="gridRadios1">
            PayPal
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
          <label class="form-check-label" for="gridRadios2">
            Cash on Deliver
          </label>
        </div>

    </div>
</div>

<div class="tab"><h5>Invoice</h5><br>
  <div class="col-sm-12">
  <div class="row">
    <!-- PayPal Logo -->
          <table border="0" cellpadding="10" cellspacing="0" align="center">
            <tr>
              <td align="right">
                <button class="btn btn-info btn-sm">Not Paid</button>
                                <div id="paypal-button-container"></div>

<!--                 <a href="https://www.paypal.com/ph/webapps/mpp/paypal-popup" title="How PayPal Works" onclick="javascript:window.open('https://www.paypal.com/ph/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;">
                  <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-medium.png" alt="Check out with PayPal" />
                </a> -->
              </td>
            </tr>
          </table>
          <!-- PayPal Logo -->
  </div>
  </div>
  <br>
    <div class="container">
      <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="row p-5">
                        <div class="col-md-6">
                            <img src="assets/css/images/logo5.png" height="100px" width="170px">
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-1">Invoice #550</p>
                            <p class="text-muted">Due to: 4 Dec, 2019</p>
                        </div>
                    </div>

                    <hr class="my-5">

                    <div class="row pb-5 p-5">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-4">Customer Information</p>
                            <p class="mb-1">Abigail Abada</p>
                            <p class="mb-1">abigailhana.abada@benilde.edu.ph</p>
                            <p>4778425</p>
                            <p class="mb-1">104 Northeast Ipil Street Marikina Heights Marikina City</p>
                            <p class="mb-1">6781 45P</p>
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-4">Payment Details</p>
                            <p class="mb-1"><span class="text-muted">VAT: </span> 1425782</p>
                            <p class="mb-1"><span class="text-muted">VAT ID: </span> 10253642</p>
                            <p class="mb-1"><span class="text-muted">Mode of Payment: </span> PayPal</p>
                            <p class="mb-1"><span class="text-muted">Name: </span> Abigail Abada</p>
                        </div>
                    </div>

                    <div class="row p-5">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">ID</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Item</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Description</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Quantity</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Unit Cost</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>LTS Versions</td>
                                        <td>21</td>
                                        <td>$321</td>
                                        <td>$3452</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>Support</td>
                                        <td>234</td>
                                        <td>$6356</td>
                                        <td>$23423</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Software</td>
                                        <td>Sofware Collection</td>
                                        <td>4534</td>
                                        <td>$354</td>
                                        <td>$23434</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Grand Total</div>
                            <p id="paypaltotal" hidden="hidden">100</p>
                            <div class="h2 font-weight-light">Php 100</div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Discount</div>
                            <div class="h2 font-weight-light">10%</div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Sub - Total amount</div>
                            <div class="h2 font-weight-light">Php 50</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
         <a type="button" class="btn btn-primary" href="invoice_page.html">Yes</a></button>
      </div>
    </div>
  </div>
</div> 

<!--END of Modal -->

<script>

<!--PayPal Script -->
paypal.Buttons({
    createOrder: function(data, actions) {
    	var total = document.getElementById('paypaltotal').innerHTML;
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: total
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      return actions.order.capture().then(function(details) {
        alert('Transaction completed by ' + details.payer.name.given_name);
        // Call your server to save the transaction
        return fetch('/paypal-transaction-complete', {
          method: 'post',
          headers: {
            'content-type': 'application/json'
          },
          body: JSON.stringify({
            orderID: data.orderID
          })
        });
      });
    }
  }).render('#paypal-button-container');


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
    document.getElementById("prevBtn").innerHTML = "Previous";
  }
  if (n == 2 ) {
    document.getElementById("nextBtn").style.display = "none";
  } else {
	document.getElementById("nextBtn").style.display = "inline";
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
