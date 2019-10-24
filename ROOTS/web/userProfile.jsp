<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

  <!--Font-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <!--Customized--> 
  <link rel="stylesheet" type="text/css" href="assets/css/userProfile.css">

</head>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="userLogin.jsp"></jsp:forward>
<%} %>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "roots";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
	
	
	
	
	



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-inverse navbar-expand-sm bg-dark navbar-dark navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" class="active" href="userHomePage.jsp"><img src="assets/css/images/logo-roots.png" height="110px" width="200px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="catalog-logged_in.html">Catalogue</a></li>
        <li><a href="allproducts-logged_in-test.html">Products</a></li>
        <li><a href="services-logged_in.html">Services</a></li>
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Contact Us <span class="caret"></span></a>
                <ul class="dropdown-menu">
              <li><a href="contact-logged_in.html">About Us</a></li>
              <li><a href="faq-logged_in.html">FAQs</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="userProfile.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
        <li><a href="logout.action"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>


<hr>
<div class="container bootstrap snippet title">

    <div class="row">
      <div class="col-sm-12"><h1><%= session.getAttribute("email") %></h1></div>
    </div>
    <div class="row">
      <div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>
 
          
          
        </div><!--/col-3-->
      <div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#profile"><span class="glyphicon glyphicon-user"></span> profile</a></li>
                <li><a data-toggle="tab" href="#cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                <li><a data-toggle="tab" href="#appointment"><span class="glyphicon glyphicon-calendar"></span> Appointment</a></li>
                <li><a data-toggle="tab" href="#history"><span class="glyphicon glyphicon-bookmark"></span> Transaction History</a></li>
              </ul>

         
         <!-- UPDATE PROFILE FORM -->
<%
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM users where userId = " + session.getAttribute("uid");

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
          <div class="tab-content">
            <div class="tab-pane active" id="profile">
                <hr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                    <form action="profile.action" method="post" id="registrationForm">
                      <div class="form-group">
                          
                          <div class="col-xs-4 line">
                              <label for="first_name"><h4>First Name</h4></label>
                              <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any." value="<%=resultSet.getString("firstName")%>">
                          </div>
                      </div>
                      <div class="form-group">



                         
                          <div class="col-xs-4 line">
                              <label for="first_name"><h4>Middle name</h4></label>
                              <input type="text" class="form-control" name="first_name" id="middle_name" placeholder="middle name" title="enter your first name if any." value="<%=resultSet.getString("middleName")%>">
                          </div>
                      </div>

                      <div class="form-group">
                          
                          <div class="col-xs-4 line">
                            <label for="last_name"><h4>Last name</h4></label>
                              <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any." value="<%=resultSet.getString("lastName")%>">

                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-4 line">
                              <label for="phone"><h4>Phone</h4></label>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any." value="<%=resultSet.getString("telephone")%>">
                          </div>
                      </div>
          
                      <div class="form-group">
                          <div class="col-xs-4 line">
                             <label for="mobile"><h4>Mobile</h4></label>
                              <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any." value="<%=resultSet.getString("mobileNo")%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-4 line">
                              <label for="email"><h4>Email</h4></label>
                              <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email." value="<%=resultSet.getString("email")%>">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-4 line">
                              <label for="email"><h4>House Number</h4></label>
                              <input type="text" id="location" class="form-control" name="feedback" rows="3" cols="99" placeholder="Philippine Address" value="<%=resultSet.getString("houseNumber")%>">
                            
                          </div>
                      </div>
                      
                      <div class="form-group">
                          
                          <div class="col-xs-4 line">
                              <label for="email"><h4>Street</h4></label>
                              <input type="text" id="location" class="form-control" name="feedback" rows="3" cols="99" placeholder="Philippine Address" value="<%=resultSet.getString("street")%>">
                            
                          </div>
                      </div>
                      
                                            <div class="form-group">
                          
                          <div class="col-xs-4 line">
                              <label for="email"><h4>City</h4></label>
                              <input type="text" id="location" class="form-control" name="feedback" rows="3" cols="99" placeholder="Philippine Address" value="<%=resultSet.getString("city")%>">
                            
                          </div>
                      </div>
                      
                                                                  <div class="form-group">
                          
                          <div class="col-xs-6 line">
                              <label for="email"><h4>Province</h4></label>
                              <input type="text" id="location" class="form-control" name="feedback" rows="3" cols="99" placeholder="Philippine Address" value="<%=resultSet.getString("province")%>">
                            
                          </div>
                      </div>
                      
                                                                  <div class="form-group">
                          
                          <div class="col-xs-6 line">
                              <label for="email"><h4>Postal Code</h4></label>
                              <input type="text" id="location" class="form-control" name="feedback" rows="3" cols="99" placeholder="Philippine Address" value="<%=resultSet.getString("postalCode")%>">
                            
                          </div>
                      </div>
                      
                      <div class="form-group">
                          
                          <div class="col-xs-6 line">
                              <label for="password"><h4>Password</h4></label>
                              <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6 line">
                            <label for="password2"><h4>Verify Password</h4></label>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                          </div>
                      </div>
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                                <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                            </div>
                      </div>
                </form>
              
              <hr>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
             
             </div><!--/tab-pane-->
             <div class="tab-pane" id="cart">
               
               <h2></h2>
         
               <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="p-4">
    <h3>Order List</h3>
    <table class="table table-bordered track_tbl table-hover">
        <thead class="thead-dark">
            <tr>
                <th></th>
                <th>Quantity</th>
                <th>Name of Product</th>
                <th>Status</th>
                <th>Date/Time</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
        </tbody>
    </table>
    </div>

                      <hr>
                </form>
               
             </div><!--/tab-pane-->
             <div class="tab-pane" id="appointment">
                
                
                  <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="p-4">
    <h3>Appointment List</h3>
    <table class="table table-bordered track_tbl table-hover">
        <thead class="thead-dark">
            <tr>
                <th></th>
                <th>Date and Time</th>
                <th>Appointment Details</th>
                <th>Appointment Status</th>
                <th>Payment Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td class="track_dot">
                    <span class="track_line"></span>
                </td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
        </tbody>
    </table>
    </div>
                </form>
              </div>
               

                           <div class="tab-pane" id="history">
                
                
                  <hr>
                  <form class="form" action="##" method="post" id="registrationForm">
                      <div class="p-4">
    <h3>Transaction History</h3>
    <table class="table table-bordered track_tbl table-hover">
        <thead class="thead-dark">
            <tr>
                <th></th>
                <th>Date</th>
                <th>Name</th>
                <th>Price</th>
                <th>Feedback</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td><textarea id="feedback" class="form-control" name="feedback" rows="3" cols="35"></textarea>
                  <button type="button" class="btn btn-light add">Send</button></td>
            </tr>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td><textarea id="feedback" class="form-control" name="feedback" rows="3" cols="35"></textarea>
                  <button type="button" class="btn btn-light add">Send</button></td>
            </tr>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td><textarea id="feedback" class="form-control" name="feedback" rows="3" cols="35"></textarea>
                  <button type="button" class="btn btn-light add">Send</button></td>
            </tr>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td><textarea id="feedback" class="form-control" name="feedback" rows="3" cols="35"></textarea>
                  <button type="button" class="btn btn-light add">Send</button></td>
            </tr>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
            <tr>
                <td></td>
                <td>01</td>
                <td>Dispatched from distibutor address</td>
                <td>Flipkart</td>
                <td>31/07/2018 22:24:PM</td>
            </tr>
        </tbody>
    </table>
    </div>
                </form>
              </div>
               
              </div><!--/tab-pane-->
</div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->

    <script type="text/javascript">
      $(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $(".file-upload").on('change', function(){
        readURL(this);
    });
});
    </script>

<script>
$(document).ready(function(){
  $('body').scrollspy({target: ".navbar", offset: 50});   
});
</script>
</body>
</html>