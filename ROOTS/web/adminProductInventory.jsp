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
                A D M I N I S T R A T O R </a>
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
	                    <li>
		                    <a href="adminProductDetails.jsp">
		                    <i class="fa fa-list-alt" aria-hidden="true"></i>
		                        <p>Product Details</p>
		                    </a>
	                    </li>
	                    
	                    <li class="active">
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
                            <a href="#">
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
                                <h4 class="title">Products</h4></h4>

                                <p class="category">Manage Inventory</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped" id="productTable">
                                    <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Current Quantity</th>
                                        <th>Unit</th>
                                        <th>Product Last Update</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sqlproduct = "SELECT productsTable.prodID, productsTable.prodName,"
					+ " productsTable.description, productsTable.initialPrice, productsTable.prodQty,"
					+ " unitsTable.unit, categoryTable.catID, categoryTable.category, productsTable.Availability,"
					+ " productsTable.prodLastUpdate, productsTable.critLevel FROM productsTable INNER JOIN categoryTable ON"
					+ " productsTable.categoryID = categoryTable.catID"
					+ " INNER JOIN unitsTable ON productsTable.unitID = unitsTable.unitID";
			resultSet = statement.executeQuery(sqlproduct);
		while (resultSet.next()) {
	%>
                                        <tr>
                                            <td><%=resultSet.getString("prodID")%></td>
                                            <td><%=resultSet.getString("prodName")%></td>
                                            <td><%=resultSet.getString("prodQty")%></td>
                                            <td><%=resultSet.getString("unit")%></td>
                                            <td><%=resultSet.getString("prodLastUpdate")%></td>
                                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addprodqty"><span class="glyphicon glyphicon-edit"></span>Add Stock</button></td>     
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
                                <h4 class="title">Product Quantity Change</h4></h4>

                                <p class="category">View Product Quantity Change</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped" id="categoryTable">
                                    <thead>
                                        <th>Inventory ID</th>
                                        <th>Product Name</th>
                                        <th>Quantity Change</th>
                                        <th>Description</th>
                                        <th>Quantity Change Date</th>
                                    </thead>
                                    <tbody>
	<%
		try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sqlcategory = "SELECT inventoryTable.inventoryID, productsTable.prodName,"
					+ " inventoryTable.prodQtyChange, inventoryTable.prodQtyChangeDate, inventoryTable.qtyChangeDesc"
					+ " FROM inventoryTable INNER JOIN productsTable ON"
					+ " inventoryTable.prodID = productsTable.prodID";
			resultSet = statement.executeQuery(sqlcategory);
		while (resultSet.next()) {
	%>
                                        <tr>
                                            <td><%=resultSet.getString("inventoryID")%></td>
                                            <td><%=resultSet.getString("prodName")%></td>
                                            <td><%=resultSet.getString("prodQtyChange")%></td>
                                            <td><%=resultSet.getString("qtyChangeDesc")%></td>
                                            <td><%=resultSet.getString("prodQtyChangeDate")%></td>
                                            <!-- <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addnewcategory"><span class="glyphicon glyphicon-edit"></span> EDIT</button></td> -->     
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

<!-- Modal: addStock -->
<div class="modal fade eft" id="addprodqty" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
     		<%
				try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sqlcategory = "SELECT prodID FROM productsTable";
				resultSet = statement.executeQuery(sqlcategory);
			%>
      <!--Body-->
      <div class="modal-body">
      <form action="addProdQty.action" method="post">
            <p align="left">
             Product ID: </br>
             <input type="text" class="form-control" name="prodID" id="productIdGetTest" readonly/><br/>
            <%
				}	catch (Exception e) {
			e.printStackTrace();
			}
			%>
            
            Product Name:</br> 
            <input type='text' id="productNameGetTest" class="form-control" name='prodName' readonly/></br>
            Current Quantity:</br><input type='number' id="quantityGetTest" class="form-control" name='prodQty' min='1' max='300' readonly/></br>
            Unit: </br> <input type='number' id="unitGetTestasd" class="form-control" name='unit' readonly/></br>
            Add Stock:</br>
            <input type='number' class="form-control" name='prodQtyChange' min='1' max='9999' required="required"/>
            <!-- Availability:</br> <input type='text' class="form-control" name='availability' value='Yes' readonly /><br/>
            Image file name:</br><input type='text' class="form-control" name='image' readonly/><br/> -->
            </p>
      
      <!--Footer-->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Add Stock">
      </div>
    </form>
    </div>
  </div>
</div>
</div>
<!-- Modal: addstock-->
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

            demo.initChartist();

            $.notify({
                icon: 'pe-7s-gift',
                message: "You are in the <b>Products Page</b> "
            },{
                type: 'danger',
                timer: 4000
            });
            
            //DataTables
            $('#productTable').DataTable();
            $('#categoryTable').DataTable();
            
        });
        
        //Get ID of row element
        var table = document.getElementById('productTable');
        
        for(var i = 1; i < table.rows.length; i++){
            table.rows[i].onclick = function(){
                 //rIndex = this.rowIndex;
				 document.getElementById("productIdGetTest").value = this.cells[0].innerHTML;
                 document.getElementById("productNameGetTest").value = this.cells[1].innerHTML;
                 document.getElementById("quantityGetTest").value = this.cells[2].innerHTML;
                 document.getElementById("unitGetTest").value = this.cells[3].innerHTML;
                 /* document.getElementById("descriptionGetTest").value = this.cells[].innerHTML; */
                 /* document.getElementById("categoryGetTest").value = this.cells[].innerHTML; */
                 /* document.getElementById("priceGetTest").value = this.cells[].innerHTML; */
       		};
        }
        
        
    </script>
</html>