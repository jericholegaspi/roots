<!DOCTYPE html>
<html lang="en">
<head>
<title>Service Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/serviceDetailsPage.css">

 <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

</head>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="userLogin.jsp"></jsp:forward>
<%} %>
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


<div class="container service-detail justify-content-center">
  
  
  <div class="card">
    <div class="col-sm-12">
      <div class="row">

        <div class="col-sm-4">
          <div class="card-title">
            <h3>Chiropractic</h3>
          </div>

          <br>

        </div>
        <div class="card-body col-sm-12">
          
          <h6><strong>Description</strong></h6>
          <br>
          <p class="p-desc">Chiropractic: A system of diagnosis and treatment based on the concept that the nervous system coordinates all of the body's functions, and that disease results from a lack of normal nerve function. Chiropractic employs manipulation and adjustment of body structures, such as the spinal column, so that pressure on nerves coming from the spinal cord due to displacement (subluxation) of a vertebral body may be relieved. Practitioners believe that misalignment and nerve pressure can cause problems not only in the local area, but also at some distance from it. Chiropractic treatment appears to be effective for muscle spasms of the back and neck, tension headaches, and some sorts of leg pain. It may or may not be useful for other ailments.</p>
          <br><br>

    <!-- start of location -->

          <h6><strong>Greater Manila Area (GMA) Locations:</strong></h6>
          <br>
          <center>
            <div class="row">
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>San Juan City</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>Marikina City</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>Manila City</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>Quezon City</small>
                </button>                          
              </div>
            </div>
            <br>

            <div class="row">
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>San Juan City</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>Marikina City</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>Manila City</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-light text-dark" type="button" data-toggle="collapse" data-target="#schedule" aria-expanded="false" aria-controls="collapseExample">
                  <i class="fas fa-map-marker-alt" style="color: #e63900;"></i> Name of Place<br>
                  <small>Quezon City</small>
                </button>                          
              </div>
            </div>
  </center>

  <!-- End of location -->       
          <br><br>

  <!-- Start of Schedule -->
        
        <div class="collapse" id="schedule">
          <h6><strong>Business Hour/s:</strong></h6>
          <br>
          <center>
            <div class="row">
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>MONDAY</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>TUESDAY</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>WEDNESDAY</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>THURSDAY</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>FRIDAY</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>SATURDAY</small>
                </button>                          
              </div>
              <div class="col-sm-3">
                <button class="btn btn-outline-light text-dark" type="button">
                  <i class="far fa-clock"></i> 7:30 AM to 4:30 PM<br>
                  <small>SUNDAY</small>
                </button>                          
              </div>
            </div>
              
            </div>
          </center>

<!-- End of Schedule -->
          <br><br><br>

         <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#reserveSchedule" aria-expanded="false" aria-controls="collapseExample">
            Reserve a Schedule
          </button>

          <div class="collapse" id="reserveSchedule">
            <div class="container">

            <div class="card card-body">
              <h5>Reservation Details</h5>
              <br>
              <div class="form-row">
                <div class="col-sm-3">
                  <label for="fname">First Name</label>
                  <input class="form-control" placeholder="Enter your first name" oninput="this.className = ''" name="fname"></p>
                </div>
                <div class="col-sm-5">
                  <label for="fname">Location</label>
                    <input class="form-control" placeholder="Enter the name of place" oninput="this.className = ''" name="fname" readonly></p>
                </div>
                <div class="col-sm-4">
                  <label for="fname">Preferred Date</label>
                    <input class="form-control" placeholder="MM/DD/YYYY" oninput="this.className = ''" name="fname"></p>
                </div>
              </div>
              <div class="form-row">
                <div class="col-sm-3">
                  <label for="fname">Last Name</label>
                  <input class="form-control" placeholder="Enter your first name" oninput="this.className = ''" name="fname"></p>
                </div>
                <div class="col-sm-5">
                  <label for="fname">Licensed Practitioner</label>
                  <select class="form-control">
                    <option>Jericho Legaspi</option>
                    <option>Abigail Abada</option>
                    <option>Phil Mendoza</option>
                  </select>
                </div>
                <div class="col-sm-4">
                  <label for="fname">Preferred Time</label>
                    <input class="form-control" placeholder="Ex. 12:00PM" oninput="this.className = ''" name="fname"></p>
                </div>
              </div>
              <br>
              <a href="userAppointmentListPage.jsp" class="btn btn-warning float-right" data-toggle="modal" data-target="#reservation-confirmation">Submit</a>
            </div>

          </div>
          </div>

          <br><br>


          <a href="userServicePage.jsp" class="btn btn-outline-primary float-left btn-lg"><i class="fas fa-arrow-left"></i></a>

          <br>
              
      </div>
    </div>
  </div>

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
            <a href="userProductIndex.jsp" target="_blank" class="text-secondary">Products</a>
          </li>
          <li>
            <a href="userServicepage.jsp" target="_blank" class="text-secondary">Services</a>
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

<!-- START of Modal -->
<div class="modal fade" id="reservation-confirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
              <p>Are you sure you want to submit?</p>
          </div>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">No</button>
         <a href="userAppointmentListPage.jsp" class="btn btn-warning">Yes</a>
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

//Date time picker
$(".form_datetime").datetimepicker({
        format: "dd MM yyyy - HH:ii P",
        showMeridian: true,
        autoclose: true,
        todayBtn: true
    });

</script>
</body>
</html>