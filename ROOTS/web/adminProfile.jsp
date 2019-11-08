<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="com.mysql.jdbc.PreparedStatement"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Roots</title>

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
    
<%
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
    
</head>


<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="adminLogin.jsp"></jsp:forward>
<%} %>

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
              <%= resultSet.getString("firstName") %> <%= resultSet.getString("lastName") %>  </a> <p id="adminFirstName" hidden="hidden"> <%= resultSet.getString("firstName") %> </p>
            </div>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
            <ul class="nav">
                <li class="active">
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
                <li>
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
                    <a class="navbar-brand" href="adminProfile.jsp">Admin Profile</a>
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
                                <p>  Log out</p>
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
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Edit Profile</h4>
<%
try {
connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM users where userID = " + session.getAttribute("uid");

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>    
                            </div>
                            <div class="content">
                                <form action="adminupdate.action" name="myForm" method="post" onsubmit="return validate()">
                                 <input type="hidden" name="userId" value="<%= session.getAttribute("uid") %>">
                                
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Company (disabled)</label>
                                                <input type="text" class="form-control" disabled placeholder="Company" value="Roots Administrator">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email address</label>
                                                <input type="email" name="email" class="form-control" disabled value="<%= resultSet.getString("email") %>">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input name="firstName" type="text" class="form-control" value="<%= resultSet.getString("firstName") %>">
                                            </div>
                                        </div>
                                         <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Middle Name</label>
                                                <input name="middleName" type="text" class="form-control" value="<%= resultSet.getString("middleName") %>">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input name="lastName" type="text" class="form-control" value="<%= resultSet.getString("lastName") %>">
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input name="password"  type="text" class="form-control" placeholder="Change Password">
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Confirm Password</label>
                                                <input name="confirmpassword"  type="text" class="form-control" placeholder="Confirm Password">
                                            </div>
                                        </div>
                                    </div> 

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<!-- JAVASCRIPT Validation -->
<script type="text/javascript">

function validate()
{
	if (document.myForm.firstName.value == "") 
	{
		alert("Please Enter First Name");
		document.myForm.firstName.focus();
		return false;
	}

	if (document.myForm.lastName.value == "") 
	{
		alert("Please Enter Last Name");
		document.myForm.lastName.focus();
		return false;
	}

	if (document.myForm.password.value == "")
	{
		alert("Please Create your Password");
		document.myForm.password.focus();
		return false;
	}
	
	if (document.myForm.password.value != document.myForm.confirmpassword.value)
	{
		alert("Passwords do not match.");
		document.myForm.password.focus();
		return false;
	}	
	
}

</script>


                                    <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="assets/img/faces/face-3.jpg" alt="..."/>

                                      <h4 class="title">Mike Andrew<br />
                                         <small>michael24</small>
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center"> "Lamborghini Mercy <br>
                                                    Your chick she so thirsty <br>
                                                    I'm in that two seat Lambo"
                                </p>
                            </div>
                            <hr>
                            <div class="text-center">
                                <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                                <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                                <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

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




    <script type="text/javascript">
        $(document).ready(function(){
        	var adminFirstName = document.getElementById('adminFirstName').innerHTML;

            demo.initChartist();
			
            $.notify({
                icon: 'pe-7s-gift',
                message: "Hi Admin<b> "+ adminFirstName +"! </b> "

            },{
                type: 'info',
                timer: 4000
            });

        });

       
    </script>

</html>
