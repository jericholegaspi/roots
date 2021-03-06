<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
    
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ROOTS Admin: Products</title>
    
 	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    
    <!-- Data Tables -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
</head>

<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="adminLogin.jsp"></jsp:forward>
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
                    <a href="adminDashboard.jsp">
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
                <li class="active" data-target="#productsPages">
                   <a href="#">
                   <i class="pe-7s-cart"></i>
                        <p>Products</p>
                    </a>
                    <ul style="list-style: none;" id="productsPages">
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
                    <a class="navbar-brand" href="#">Products</a>
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
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addnewproduct" style="float: right;"><span class="glyphicon glyphicon-plus"></span></button>
                                <h4 class="title">Products</h4></h4>

                                <p class="category">Manage Products</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped" id="productTable">
                                    <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Price (&#8369;)</th>
                                        <th>Quantity</th>
                                        <th>Unit</th>
                                        <th>Description</th>                      
                                        <th>Availability</th>
                                        <th>Critical Level</th>
                                        <th>Product Approval State</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sqlproduct = "SELECT products.*, units.*, category.* FROM products"
					+ " INNER JOIN category ON products.catID = category.catID"
					+ " INNER JOIN units ON products.unitID = units.unitID"
					+ " WHERE products.availability = 'Available'"
					+ " AND products.productApproval = 'Product Archive Not Yet Approved'"
					+ " OR products.productApproval = 'Approved'";
			resultSet = statement.executeQuery(sqlproduct);
		while (resultSet.next()) {
	%>
                                        <tr>
                                            <td><%=resultSet.getString("prodID")%></td>
                                            <td><%=resultSet.getString("prodName")%></td>
                                            <td id="catGetTest"><%=resultSet.getString("catID")%> - <%=resultSet.getString("category")%></td>
                                            <td>&#8369;<%=resultSet.getString("initialPrice")%>.00</td>
                                            <td><%=resultSet.getString("prodQty")%></td>
                                            <td><%=resultSet.getString("unit")%></td>
                                            <td><%=resultSet.getString("description")%></td>
                                            <td><%=resultSet.getString("Availability")%></td>
                                            <td><%=resultSet.getString("critLevel")%></td>
                                            <td style="color: green;"><%=resultSet.getString("productApproval")%></td>
                                            <td>
                                            	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editproduct">
                                            		EDIT
                                            	</button>
                                            </td>
                                            <td>
                                            	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#delete-confirmation">
                                            		ARCHIVE
                                            	</button>
                                            </td>     
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
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addnewcategory" style="float: right;"><span class="glyphicon glyphicon-plus"></span></button>
                                <h4 class="title">Category</h4></h4>

                                <p class="category">Add New Category</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped" id="categoryTable">
                                    <thead>
                                        <th>Category ID</th>
                                        <th>Category</th>
                                    </thead>
                                    <tbody>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sqlcategory = "SELECT * FROM category";
			resultSet = statement.executeQuery(sqlcategory);
		while (resultSet.next()) {
	%>
                                        <tr>
                                            <td><%=resultSet.getString("catID")%></td>
                                            <td><%=resultSet.getString("category")%></td>     
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
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                            <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addnewproduct" style="float: right;"><span class="glyphicon glyphicon-plus"></span></button> -->
                                <h4 class="title">Archived Products</h4></h4>

                                <p class="category">View archived products</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped" id="archivedTable">
                                    <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Price (&#8369;)</th>
                                        <th>Quantity</th>
                                        <th>Unit</th>
                                        <th>Description</th>                      
                                        <th>Availability</th>
                                        <th>Critical Level</th>
                                        <th>Archive Approval State</th>
                                    </tr>
                                    </thead>
                                    <tbody>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sqlproduct = "SELECT products.*, units.*, category.* FROM products"
					+ " INNER JOIN category ON products.catID = category.catID"
					+ " INNER JOIN units ON products.unitID = units.unitID"
					+ " WHERE products.availability = 'Archived'"
					+ " AND products.productApproval = 'Approved'";
			resultSet = statement.executeQuery(sqlproduct);
		while (resultSet.next()) {
	%>
                                        <tr>
                                            <td><%=resultSet.getString("prodID")%></td>
                                            <td><%=resultSet.getString("prodName")%></td>
                                            <td id="catGetTest"><%=resultSet.getString("category")%></td>
                                            <td>&#8369;<%=resultSet.getString("initialPrice")%>.00</td>
                                            <td><%=resultSet.getString("prodQty")%></td>
                                            <td><%=resultSet.getString("unit")%></td>
                                            <td><%=resultSet.getString("description")%></td>
                                            <td style="color: red;"><%=resultSet.getString("Availability")%></td>
                                            <td><%=resultSet.getString("critLevel")%></td>
                                            <td><%=resultSet.getString("productApproval")%></td>
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

	<%
	try {
		connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		statement = connection.createStatement();
		String sqlcategory = "SELECT * FROM category";
		resultSet = statement.executeQuery(sqlcategory);
	%>

<!-- Modal: addnewproduct -->
<div class="modal fade eft" id="addnewproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
        <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Add New Product</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">�</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
      <form action="addNewProduct.action" method="post">
            <p align="left">
            <!-- <s:textfield key="txtProdName" label="Name"/> -->
            Product Name:</br> 
            <input type='text' class="form-control" name='prodName' minlength='0' maxlength='100' required="required"/><br/>
            
            Category: </br> <select class="form-control" name='catID' required="required">
            <option value="" disabled selected>Select your option</option>
            <% while(resultSet.next()){%>
            <option value="<%=resultSet.getString("catID") %>"><%=resultSet.getString("catID") %> - <%=resultSet.getString("category") %></option>
            <%
            		}
				}	catch (Exception e) {
			e.printStackTrace();
			}
	
			try {
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();
					String sqlcategory = "SELECT * FROM units";
					resultSet = statement.executeQuery(sqlcategory);
			%>
            </select><br/>
            <input type="hidden" name="userID" value="<%= session.getAttribute("uid") %>"/>
            Initial Price:</br><input type='number' class="form-control" name='initialPrice' min='0' max='999' required="required"/><br/>
            Quantity:</br><input type='number' class="form-control" name='prodQty' min='1' required="required"/><br/>
            Unit: </br> <select class="form-control" name='unitID' required="required">
            <option value="" disabled selected>Select your option</option>
            <% while(resultSet.next()){%>
            <option value="<%=resultSet.getString("unitID") %>"><%=resultSet.getString("unit") %></option>
            <%
            		} 
				}	catch (Exception e) {
			 e.printStackTrace();
            }
            %>
            </select><br/>
            Description:</br><input type='text' class="form-control" name='description' minlength='0' maxlength='500' required="required"/><br/>
            Critical Level:</br><input type='number' class="form-control" name='critLevel' min='0' max='999' required="required"/><br/>
            <!-- Availability: --></br> <input type='hidden' class="form-control" name='availability' value='Available'/><br/>
            </p>      
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Submit">
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- Modal: addnewproduct -->

<!-- Modal: editproduct -->
<div class="modal fade left" id="editproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
        <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Edit Product</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">�</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
      <form action="editProduct.action" method="post">
            <input type="hidden" class="form-control" name="prodID" id="productIdGetTest" readonly/>
            <p align="left">
            Product Name:</br> 
            <input type='text' id="productNameGetTest" class="form-control" name='prodName' minlength='0' maxlength='100' required="required"/><br/>
            
            Current Category: 	<input type="text" id="categoryGetTest" class="form-control" readonly/></br> 
            <select class="form-control" name='catID' required="required">
            <option value="" disabled selected>Select your option...</option>
            <%
				try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sqlcategory = "SELECT * FROM category";
				resultSet = statement.executeQuery(sqlcategory);
				while(resultSet.next()){
			%>
            <option value="<%=resultSet.getString("catID") %>"><%=resultSet.getString("category") %></option>
            <%
            		}
				}	catch (Exception e) {
			e.printStackTrace();
			}
			%>
            </select><br/>
            Current Unit: 	<input type="text" id="unitGetTest" class="form-control" readonly/></br> 
           	
           	<select class="form-control"  name='unitID' required="required">
            <option value="" disabled selected>Select your option...</option>
            <%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sqlcategory = "SELECT * FROM units";
				resultSet = statement.executeQuery(sqlcategory);
           		while(resultSet.next()){%>
            <option value="<%=resultSet.getString("unitID") %>"><%=resultSet.getString("unit") %></option>
            <%
            		} 
				}	catch (Exception e) {
			e.printStackTrace();
            }
            %>
            </select><br/>
            Description:</br><input type='text' id="descriptionGetTest" class="form-control" name='description' minlength='0' maxlength='500' required="required"/><br/>
            </p>
      
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save Changes">
      </div>
    </form>
    </div>
  </div>
</div>
</div>
<!-- Modal: editproduct -->

<!-- Modal: addnewcategory -->
<div class="modal fade eft" id="addnewcategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
        <!--Header-->
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Add New Category</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">�</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
      <form action="addNewCategory.action" method="post">
            <p align="left">
            <!-- <s:textfield key="txtProdName" label="Name"/> -->
            Category:</br> 
            <input type='text' class="form-control" name='category' minlength='0' maxlength='100' required="required"/><br/>
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Submit">
      </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- Modal: addnewcategory -->

<!-- START of Archive Confirmation Modal -->
<div class="modal fade" id="delete-confirmation" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalLabel">
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form action="archiveProductApproval.action" method="post" id="archiveProductApproval">
      		<input type="hidden" id="prodArchiveIdGetTest" name="prodID"/>
            <p class="text-center">Are you sure you want to archive this product?</p>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <button type="submit" form="archiveProductApproval" class="btn btn-warning">Archive</button>
      </div>
    </div>
  </div>
</div> 
<!--END of Archive Confirmation Modal -->
</body>

	
    <!-- DataTables -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
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
            
            //DataTables
            $('#productTable').DataTable();
            $('#categoryTable').DataTable();
            $('#archivedTable').DataTable();
        
        //Get ID of row element
        var table = document.getElementById('productTable');
        
        for(var i = 1; i < table.rows.length; i++){
            table.rows[i].onclick = function(){
                 //rIndex = this.rowIndex;
                 document.getElementById("prodArchiveIdGetTest").value = this.cells[0].innerHTML;
				 document.getElementById("productIdGetTest").value = this.cells[0].innerHTML;
                 document.getElementById("productNameGetTest").value = this.cells[1].innerHTML;
              	 document.getElementById("categoryGetTest").value = this.cells[2].innerHTML;
                 /* document.getElementById("priceGetTest").value = this.cells[3].innerHTML;
                 document.getElementById("quantityGetTest").value = this.cells[4].innerHTML; */
                 document.getElementById("unitGetTest").value = this.cells[5].innerHTML;
                 document.getElementById("descriptionGetTest").value = this.cells[6].innerHTML;
       		};
        }
});
    </script>
</html>