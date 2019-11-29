<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>List of Users</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    
<% //Database Connections
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
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

<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="adminLogin.jsp"></jsp:forward>
<%} %>

</head>


<body>

<div class="wrapper">
    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


        <div class="sidebar-wrapper">
            <div class="logo">
                <a class="simple-text">
                <img src="assets/img/logo-roots.png" height="110px" width="200px">
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM users where userID = " + session.getAttribute("uid");

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>                    
                <%= resultSet.getString("firstName") %> <%= resultSet.getString("lastName") %> </a>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>

            <ul class="nav">
                <li>
                    <a href="adminProfile.jsp">
                        <i class="pe-7s-user"></i>
                        <p>Profile</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="active">
                    <a href="adminUsers.jsp">
                        <i class="pe-7s-users"></i>
                        <p>Users</p>
                    </a>
                </li>
                <li>
                    <a href="adminCatalogue.jsp">
                        <i class="pe-7s-notebook"></i>
                        <p>Catalogue</p>
                    </a>
                </li>
                <li data-toggle="collapse" data-target="#productsPages">
                   <a href="#">
                   <i class="pe-7s-cart"></i>
                        <p>Products</p>
                    </a>
                    <ul style="list-style: none;" id="productsPages" class="collapse">
	                    <li>
		                    <a href="adminProductDetails.jsp">
		                    <i class="fa fa-list-alt" aria-hidden="true"></i>
		                        <p>Product Details</p>
		                    </a>
	                    </li>
	                    
	                    <li>
		                    <a href="adminProductInventory.jsp">
		                    <i class="fa fa-home" aria-hidden="true"></i>
		                        <p>Product Inventory</p>
		                    </a>
	                    </li>
                    </ul>
                </li>
                <li>
                   <a href="adminOrders.jsp">
                        <i class="pe-7s-cart"></i>
                        <p>Orders</p>
                    </a>
                </li>
                <li>
                   <a href="#">
                        <i class="pe-7s-note2"></i>
                        <p>Modalities</p>
                    </a>
                </li>
                <li data-toggle="collapse" data-target="#pricesPages">
                   <a href="#">
                        <i class="fa fa-money" aria-hidden="true"></i>
                        <p>Price Management</p>
                    </a>
                    <ul style="list-style: none;" id="pricesPages" class="collapse">
	                    <li>
		                    <a href="adminProductPrices.jsp">
		                    <i class="fa fa-list-alt" aria-hidden="true"></i>
		                        <p>Product Prices</p>
		                    </a>
	                    </li>
	                    
	                    <li>
		                    <a href="#">
		                    <i class="fa fa-home" aria-hidden="true"></i>
		                        <p>Modality Prices</p>
		                    </a>
	                    </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="pe-7s-id"></i>
                        <p>Licensed Practitioners</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="pe-7s-comment"></i>
                        <p>Feedback</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Users</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
                                <p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-sm hidden-xs"></b>
                                    <span class="notification hidden-sm hidden-xs">5</span>
                                    <p class="hidden-lg hidden-md">
                                        5 Notifications
                                        <b class="caret"></b>
                                    </p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
                        <li>
                           <a href="">
                                <i class="fa fa-search"></i>
                                <p class="hidden-lg hidden-md">Search</p>
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="">
                               <p>Account</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <p>
                                        Dropdown
                                        <b class="caret"></b>
                                    </p>

                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                              </ul>
                        </li>
                        <li>
                            <a href="adminlogout.action">
                                <p>Log out</p>
                            </a>
                        </li>
                        <li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addnewuser" style="float: right;"><span class="glyphicon glyphicon-plus"></span></button>
                                <h4 class="title">List of Users</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>User ID</th>
                                        <th>Prefix</th>
                                        <th>Full Name</th>
                                        <th>Suffix</th>
                                        <th>User Type</th>
                                        <th>Password</th>
                                        <th>Gender</th>
                                        <th>Mobile Number</th>
                                        <th>Telephone</th>
                                        <th>Email</th>
                                        <th>Date Added</th>
                                        <th>Date Modified</th>                                      
                                    </thead>
                                    <tbody>
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT u.userID, u.prefix, u.firstName, u.middleName, u.lastName, u.suffix, ut.userType, u.password, u.gender, u.mobileNo, u.telephone, u.email, u.dateAdded, u.dateModified FROM users u INNER JOIN usertype ut ON u.userTypeId = ut.userTypeId";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
                                        <tr>
                                            <td><%= resultSet.getString("userID") %></td>
                                            <td><%= resultSet.getString("prefix") %></td>
                                            <td><%= resultSet.getString("firstName") %> <%= resultSet.getString("middleName") %> <%= resultSet.getString("lastName") %></td>
                                            <td><%= resultSet.getString("suffix") %></td>
                                            <td><%= resultSet.getString("userType") %></td>
                                            <td><%= resultSet.getString("password") %></td>
                                            <td><%= resultSet.getString("gender") %></td>
                                            <td><%= resultSet.getString("mobileNo") %></td>
                                            <td><%= resultSet.getString("telephone") %></td>
                                            <td><%= resultSet.getString("email") %></td>
                                            <td><%= resultSet.getString("dateAdded") %></td>
                                            <td><%= resultSet.getString("dateModified") %></td>
                                        </tr>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>                                                                              
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> Roots
                </p>
            </div>
        </footer>


    </div>    
    
</div>

<!-- Modal: Add new User -->
<form action="insertuser.action" name="myForm" method="post">
<div class="modal fade eft" id="addnewuser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
        <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Add User</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body justify-content-center">
            <p align="left">
            <!-- <s:textfield key="txtProdName" label="Name"/> -->
            User Type:</br>
            		  <select name="userTypeId" class="form-control" required>
								<option value="" disabled="disabled" selected="selected">--</option>
								<option value="1">Administrator</option>
								<option value="2">Customer</option>
								<option value="3">Licensed Practitioner</option>		
					  </select>
					  <br/>
            
            Prefix:</br> 
					  <select name="prefix" class="form-control">
								<option value="" disabled="disabled" selected="selected">--</option>
								<option value="">None</option>
								<option value="Mr.">Mr.</option>
								<option value="Ms./Mrs.">Ms./Mrs.</option>
								<option value="Dr.">Dr.</option>												
					  </select>								
					  <br/>
					  
            First Name:</br> <input type='text' class="form-control" name='firstName' minlength='0' maxlength='100' required="required"/><br/>
            
            Middle Name:</br> <input type='text' class="form-control" name='middleName' minlength='0' maxlength='100'/><br/>
            
            Last Name:</br> <input type='text' class="form-control" name='lastName' minlength='0' maxlength='100' required="required"/><br/>
            
            Suffix:</br> 
					  <select name="suffix" class="form-control">
								<option value="" disabled="disabled" selected="selected">--</option>
								<option value="">None</option>
								<option value="Sr.">Sr.</option>
								<option value="Jr.">Jr.</option>
								<option value="MD">MD</option>
								<option value="PhD">PhD</option>													
					  </select>								
					  <br/>
            
            Gender:</br> 
					<select name="gender" class="form-control" required>
								<option value="" disabled="disabled" selected="selected">--</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Prefer Not To Say">Prefer Not To Say</option>	
					</select>
					<br/>
            
            Password:</br> <input type="password" minlength="8" maxlength="20" placeholder="Password" name="password" class="form-control" required> <br/>
            
            Mobile Number:</br> <input type="number" minlength="11" maxlength="11" class="form-control" name="mobileNo" placeholder="Mobile No." required> <br/>
            
            Telephone Number:</br> <input type="number" minlength="10" maxlength="12" class="form-control" name="telephone" placeholder="Telephone #" required> <br/>
            
            Email:</br> <input type="email" class="form-control" name="email" placeholder="E-Mail" required> <br/>
            
            Date of Birth:</br> <input type="text" class="form-control" name="dateOfBirth"> <br/>
            </p>
      
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="">Save</button>
      </div>
    </div>
  </div>
</div>
</div>
</form>
<!-- Modal: Add New User -->


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>


</html>
