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

 <link rel="stylesheet" type="text/css" href="assets/css/invoicelistpage.css">

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


<div class="container cart-table">

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

  <table id="cart" class="table table-hover table-condensed">
            <thead>
            <tr>
              <th style="width:30%">Invoice</th>
              <th style="width:13%">Order Status</th>
              <th style="width:13%">Delivery Status</th>
              <th style="width:15%"></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td data-th="Invoice">
                  <div class="col-sm-12"><span class="d-inline-block text-truncate" style="max-width: 150px;">
                    <h4 class="nomargin i-name">INV - 001 INV - 001 INV - 001 INV - 001 INV - 001 INV - 001 INV - 001 INV - 001</h4></span>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

            <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 002</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

            <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 003</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

            <tr>
              <td data-th="Invoice">                
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 004</h4>
                  </div>              
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

            <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 005</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

             <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 006</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

             <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 007</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

             <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 008</h4>
                  </div>
              </td>
              <td data-th="OrderStatus">O. Status</td>
              <td data-th="DeliveryStatus">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

             <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 009</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

             <tr>
              <td data-th="Invoice">
                  <div class="col-sm-8">
                    <h4 class="nomargin i-name">INV - 010</h4>
                  </div>
              </td>
              <td data-th="Order Status">O. Status</td>
              <td data-th="Delivery Status">D. Status</td>
              <td class="actions" data-th="">
                <a href="userProductsPage.jsp" class="btn btn-primary btn-sm"> View</a>
                <a href="userProductsPage.jsp" class="btn btn-warning btn-sm"> Cancel</a>             
              </td>
            </tr>

          </tbody>
          <tfoot>
            <tr>
            </tr>
          </tfoot>
        </table>
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