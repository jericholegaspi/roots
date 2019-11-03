<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Light Bootstrap Dashboard by Creative Tim</title>

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
                    <a href="admin.jsp">
                        <i class="pe-7s-user"></i>
                        <p>Profile</p>
                    </a>
                </li>
                <li>
                    <a href="dashboard.jsp">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="users.jsp">
                        <i class="pe-7s-users"></i>
                        <p>Users</p>
                    </a>
                </li>
                <li>
                    <a href="catalogue.jsp">
                        <i class="pe-7s-notebook"></i>
                        <p>Catalogue</p>
                    </a>
                </li>
                <li class="active" data-toggle="collapse" data-target="#productsPages">
                   <a href="#">
                   <i class="pe-7s-cart"></i>
                        <p>Products</p>
                    </a>
                    <ul style="list-style: none;" id="productsPages" class="collapse in">
	                    <li class="active">
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
	                    
	                    <li>
		                    <a href="adminProductHistory.jsp">
		                    <i class="fa fa-history" aria-hidden="true"></i>
		                        <p>Product History</p>
		                    </a>
	                    </li>
                    </ul>
                </li>
                <li>
                   <a href="modalities.jsp">
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
		                    <a href="adminModealityPrices.jsp">
		                    <i class="fa fa-home" aria-hidden="true"></i>
		                        <p>Modality Prices</p>
		                    </a>
	                    </li>
                    </ul>
                </li>
                <li>
                    <a href="lp.jsp">
                        <i class="pe-7s-id"></i>
                        <p>Licensed Practitioners</p>
                    </a>
                </li>
                <li>
                    <a href="feedback.jsp">
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
                            <a href="adminlogout">
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
                            <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addnewuser" style="float: right;"><span class="glyphicon glyphicon-plus"></span></button> -->
                                <h4 class="title">List of Users</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>User ID</th>
                                        <th>Full Name </th>
                                        <th>User Type</th>
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
String sql = "SELECT u.userID, u.firstName, u.middleName, u.lastName, ut.userType, u.gender, u.mobileNo, u.telephone, u.email, u.dateAdded, u.dateModified FROM users u INNER JOIN usertype ut ON u.userTypeId = ut.userTypeId";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
                                        <tr>
                                            <td><%= resultSet.getString("userID") %></td>
                                            <td><%= resultSet.getString("firstName") %> <%= resultSet.getString("middleName") %> <%= resultSet.getString("lastName") %></td>
                                            <td><%= resultSet.getString("userType") %></td>
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

<!-- Modal: addneweplant -->
<div class="modal fade eft" id="addnewuser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
        <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">English Table: Add New Plant</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body justify-content-center">
            <p align="left">
            <!-- <s:textfield key="txtProdName" label="Name"/> -->
            English Plant Name:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Scientific Name:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Benefit/s:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Traditional Use/s:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Caution/s:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Popular Use/s:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Use as Food:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Other Use/s:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Additional Information:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Location:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            Reference:</br> <input type='text' class="form-control" name='txtProdName' minlength='0' maxlength='100' required="required"/><br/>
            </p>
      
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="">
        </span>Save</button>
      </div>
    </div>
  </div>
</div>
</div>
<!-- Modal: addnewfproduct -->


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
