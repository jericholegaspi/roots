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

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
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
                <%= resultSet.getString("firstName") %> <%= resultSet.getString("lastName") %>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
                 </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="lpProfile.jsp">
                        <i class="pe-7s-user"></i>
                        <p>Profile</p>
                    </a>
                </li>
                <li class="active">
                    <a href="lpAppointment.jsp">
                        <i class="pe-7s-note2"></i>
                        <p>Appointment</p>
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
                    <a class="navbar-brand" href="#">Appointment</a>
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
                            <a href="lplogout.action">
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

                    <!-- start of table -->
                          
                    <div class="col-md-12">
                        <div class="card">

                            <div class="header">


                                <h4 class="title">List of Pending Appointments</h4>
                                <div class="form-group pull-right">
                                    <input type="text" id="searchbar" onkeyup="myFunction()" class="search form-control" placeholder="Search">
                                </div>

                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped results" id="myTable">
                                    <thead>
                                        <th>Appointment ID</th>
                                        <th>Customer Name</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Date Added</th>
                                        <th>Service Status</th>
                                        <th>Payment Status</th>
                                        <th>Date Modified</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td scope="row">1</td>
                                            <td>Dakota Rice</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td><select class="form-control">
                                            <option value="" disabled="disabled" selected="selected">...</option>
                                            <option value="upc">Upcoming</option>
                                            <option value="ong">Ongoing</option>
                                            <option value="done">Done</option>
                                            </select></td>
                                            <td><select class="form-control">
                                                <option value="" disabled="disabled" selected="selected">...</option>
                                                <option value="paid">Paid</option>
                                                <option value="unpaid">Unpaid</option>
                                            </select></td>
                                            <td>04/07/2019</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">2</td>
                                            <td>Minerva Hooper</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td><select class="form-control">
                                            <option value="" disabled="disabled" selected="selected">...</option>
                                            <option value="upc">Upcoming</option>
                                            <option value="ong">Ongoing</option>
                                            <option value="done">Done</option>
                                            </select></td>
                                            <td><select class="form-control">
                                                <option value="" disabled="disabled" selected="selected">...</option>
                                                <option value="paid">Paid</option>
                                                <option value="unpaid">Unpaid</option>
                                            </select></td>
                                            <td>04/07/2019</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">3</td>
                                            <td>Sage Rodriguez</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td><select class="form-control">
                                            <option value="" disabled="disabled" selected="selected">...</option>
                                            <option value="upc">Upcoming</option>
                                            <option value="ong">Ongoing</option>
                                            <option value="done">Done</option>
                                            </select></td>
                                            <td><select class="form-control">
                                                <option value="" disabled="disabled" selected="selected">...</option>
                                                <option value="paid">Paid</option>
                                                <option value="unpaid">Unpaid</option>
                                            </select></td>
                                            <td>04/07/2019</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">4</td>
                                            <td>Philip Chaney</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td><select class="form-control">
                                            <option value="" disabled="disabled" selected="selected">...</option>
                                            <option value="upc">Upcoming</option>
                                            <option value="ong">Ongoing</option>
                                            <option value="done">Done</option>
                                            </select></td>
                                            <td><select class="form-control">
                                                <option value="" disabled="disabled" selected="selected">...</option>
                                                <option value="paid">Paid</option>
                                                <option value="unpaid">Unpaid</option>
                                            </select></td>
                                            <td>04/07/2019</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">5</td>
                                            <td>Doris Greene</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td><select class="form-control">
                                            <option value="" disabled="disabled" selected="selected">...</option>
                                            <option value="upc">Upcoming</option>
                                            <option value="ong">Ongoing</option>
                                            <option value="done">Done</option>
                                            </select></td>
                                            <td><select class="form-control">
                                                <option value="" disabled="disabled" selected="selected">...</option>
                                                <option value="paid">Paid</option>
                                                <option value="unpaid">Unpaid</option>
                                            </select></td>
                                            <td>04/07/2019</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">6</td>
                                            <td>Mason Porter</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td><select class="form-control">
                                            <option value="" disabled="disabled" selected="selected">...</option>
                                            <option value="upc">Upcoming</option>
                                            <option value="ong">Ongoing</option>
                                            <option value="done">Done</option>
                                            </select></td>
                                            <td><select class="form-control">
                                                <option value="" disabled="disabled" selected="selected">...</option>
                                                <option value="paid">Paid</option>
                                                <option value="unpaid">Unpaid</option>
                                            </select></td>
                                            <td>04/07/2019</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- end of table -->

<!-- start of table -->
                          
                    <div class="col-md-12">
                        <div class="card">

                            <div class="header">

                                <h4 class="title">Transaction History</h4>
                                <div class="form-group pull-right">
                                    <input type="text" id="searchbar2" onkeyup="myFunction()" class="search form-control" placeholder="Search">
                                </div>

                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped results" id="myTable2">
                                    <thead>
                                        <th>Appointment ID</th>
                                        <th>Customer Name</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Date Added</th>
                                        <th>Feedback</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td scope="row">1</td>
                                            <td>Dakota Rice</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td>Good</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">2</td>
                                            <td>Minerva Hooper</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td>Good</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">3</td>
                                            <td>Sage Rodriguez</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td>Good</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">4</td>
                                            <td>Philip Chaney</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td>Good</td>
                                        </tr>
                                        <tr>
                                            <td scope="row">5</td>
                                            <td>Doris Greene</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td>Good</td>
                                           
                                        </tr>
                                        <tr>
                                            <td scope="row">6</td>
                                            <td>Mason Porter</td>
                                            <td>05/07/2019</td>
                                            <td>2:00 PM</td>
                                            <td>04/07/2019</td>
                                            <td>Good</td>
                                            
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <!-- end of table -->

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

            demo.initChartist();

            $.notify({
                icon: 'pe-7s-bell',
                message: "Reminder : Always check your <b>Appointment Schedule</b>"

            },{
                type: 'warning',
                timer: 4000
            });

        });

        // searchbar: item results 

$(document).ready(function() {
  $(".search").keyup(function () {
    var searchTerm = $(".search").val();
    var listItem = $('.results tbody').children('tr');
    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
    
  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
  });
    

  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','false');
  });

  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','true');
  });

  var jobCount = $('.results tbody tr[visible="true"]').length;
    $('.counter').text(jobCount + ' item');

  if(jobCount == '0') {$('.no-result').show();}
    else {$('.no-result').hide();}
          });
});

$(document).ready(function(){
  $("#searchbar").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

// searchbar2: item results
$(document).ready(function() {
  $(".search").keyup(function () {
    var searchTerm = $(".search").val();
    var listItem = $('.results tbody').children('tr');
    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
    
  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
  });
    

  $(".resultss tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','false');
  });

  $(".resultss tbody tr:containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','true');
  });

  var jobCount = $('.resultss tbody tr[visible="true"]').length;
    $('.counter').text(jobCount + ' item');

  if(jobCount == '0') {$('.no-result').show();}
    else {$('.no-result').hide();}
          });
});



//second searchbar
$(document).ready(function(){
  $("#searchbar2").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable2 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
       
    </script>

</html>
