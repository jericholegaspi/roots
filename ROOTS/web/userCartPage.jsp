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

 <link rel="stylesheet" type="text/css" href="assets/css/cartpage.css">

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
        <a class="dropdown-item" href="userInvoicePage.jsp"><span class="fa fa-sign-in"></span>Invoice</a>
        <a class="dropdown-item" href="#"><span class="fa fa-sign-in"></span>Logout</a>
      </div>
        
      </li>
    </ul>
           
    </form>    
  </div>
</nav> 
</div>



<div class="container cart-table">
  <table id="cart" class="table table-hover table-condensed">
            <thead>
            <tr>
              <th style="width:50%">Product</th>
              <th style="width:10%">Price</th>
              <th style="width:6%">Quantity</th>
              <th style="width:6%">Unit</th>
              <th style="width:16%" class="text-center">Subtotal</th>
              <th style="width:12%"></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td data-th="Product">
                <div class="row">
                  <div class="col-sm-3 hidden-xs"><img src="assets/css/images/abokado.jpg" alt="..." class="img-responsive" height="100px;" width="100px;" /></div>
                  <div class="col-sm-8">
                    <h4 class="nomargin p-name">Product Name</h4>
                    <p class="p-description">Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                  </div>
                </div>
              </td>
              <td data-th="Price">$1.99</td>
              <td data-th="Quantity">
                <input type="number" class="form-control text-center" value="1">
              </td>
              <td data-th="Unit">
                <div class="btn-group">
                  <button type="button" class="btn btn-secondary dropdown-toggle-split dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="sr-only">Toggle</span>...
                  </button>
                    <div class="dropdown-menu">
                      <button class="dropdown-item" type="button">Kg</button>
                      <button class="dropdown-item" type="button">Bundle</button>
                      <button class="dropdown-item" type="button">Box</button>
                      <button class="dropdown-item" type="button">Fruits</button>
                      <button class="dropdown-item" type="button">Skin Care</button>
                      <button class="dropdown-item" type="button">Supplement</button>
                      <button class="dropdown-item" type="button">Vegetables</button>
                    </div>
                </div>
              </td>
              <td data-th="Subtotal" class="text-center">1.99</td>
              <td class="actions" data-th="">
                <button class="btn btn-info btn-sm"><i class="fas fa-edit"></i></button>
                <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></button>                
              </td>
            </tr>

            <tr>
              <td data-th="Product">
                <div class="row">
                  <div class="col-sm-3 hidden-xs"><img src="assets/css/images/abokado.jpg" alt="..." class="img-responsive" height="100px;" width="100px;" /></div>
                  <div class="col-sm-7">
                    <h4 class="nomargin p-name">Product Name</h4>
                    <p class="p-description">Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                  </div>
                </div>
              </td>
              <td data-th="Price">$1.99</td>
              <td data-th="Quantity">
                <input type="number" class="form-control text-center" value="1">
              </td>
              <td data-th="Unit">
                <div class="btn-group">
                  <button type="button" class="btn btn-secondary dropdown-toggle-split dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="sr-only">Toggle</span>...
                  </button>
                    <div class="dropdown-menu">
                      <button class="dropdown-item" type="button">Kg</button>
                      <button class="dropdown-item" type="button">Bundle</button>
                      <button class="dropdown-item" type="button">Box</button>
                      <button class="dropdown-item" type="button">Fruits</button>
                      <button class="dropdown-item" type="button">Skin Care</button>
                      <button class="dropdown-item" type="button">Supplement</button>
                      <button class="dropdown-item" type="button">Vegetables</button>
                    </div>
                </div>
              </td>
              <td data-th="Subtotal" class="text-center">1.99</td>
              <td class="actions" data-th="">
                <button class="btn btn-info btn-sm"><i class="fas fa-edit"></i></button>
                <button class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></button>                
              </td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td><a href="userProductsPage.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
              <td colspan="3" class="hidden-xs"></td>          
              <td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
              <td><a href="#" class="btn btn-success btn-block" data-toggle="modal" data-target="#checkout-confirmation">Checkout <i class="fa fa-angle-right"></i></a></td>
            </tr>
          </tfoot>
        </table>
</div>


<button onclick="topFunction()" id="myBtn" title="Go to top"><span class="fa fa-angle-double-up"></span></button>

</div>
<br>

<!-- START of Modal -->
<div class="modal fade" id="checkout-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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