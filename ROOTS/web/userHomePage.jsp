<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!--Font-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <!--Customized--> 
  <link rel="stylesheet" type="text/css" href="assets/css/home.css">
 <style>
   .carousel-inner > .item > img,
   .carousel-inner > .item > a > img {
    width: 75%;
    margin: auto;
   }
 </style>
</head>



<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("email")== null) )
{
%>
<jsp:forward page="userLogin.jsp"></jsp:forward>
<%} %>



<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-inverse navbar-expand-sm navbar-fixed-top">

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
        <li><a href="userProductIndex.jsp">Products</a></li> <!-- TEST CHECKOUT -->
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
<div class="bg">
  <div class="hero-image">
  <div class="hero-text">
    <h1>Welcome</h1>
    <button class="explore">Explore Roots</button>
  </div>
</div>

<div class="title">

<div id="rhome" class="carousel slide carousel-fade" data-ride="carousel">
  
<!--Indicators-->
  <ol class="carousel-indicators">
    <li class="item1 active"></li>
    <li class="item2"></li>
    <li class="item3"></li>
    <li class="item4"></li>
    <li class="item5"></li>
  </ol>
  <!--/.Indicators-->

  <!-- The slideshow -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="assets/css/images/hpage-1.1.png" alt="Los Angeles" width="1100" height="500">
    </div>
    <div class="item">
      <img src="assets/css/images/hpage-2.png" alt="Chicago" width="1100" height="500">
    </div>
    <div class="item">
      <img src="assets/css/images/hpage-3.png" alt="New York" width="1100" height="500">
    </div>
    <div class="item">
      <img src="assets/css/images/hpage-4.png" alt="New York" width="1100" height="500">
    </div>
    <div class="item">
      <img src="assets/css/images/hpage-5.png" alt="New York" width="1100" height="500">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#rhome" role="button">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#rhome" role="button">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>

<div class="row">
<div class="hero-image second">
  <div class="hero-text">
    <h1 class="down">Begin Here</h1>
    <button class="cat" href="catalog-logged_in.html">Go to Catalogue</button>
    <button class="cat" href="allproducts-logged_in.html">Go to Products</button>
    <button class="cat">Go to Services</button>
  </div>
</div>
</div>

<script>
  $(document).ready(function(){
    $("#rhome").carousel();
  
  $(".item1").click(function(){
    $("#rhome").carousel(0);
});
  $(".item2").click(function(){
    $("#rhome").carousel(1);
});
  $(".item3").click(function(){
    $("#rhome").carousel(2);
});
  $(".item4").click(function(){
    $("#rhome").carousel(3);
});
  $(".item5").click(function(){
    $("#rhome").carousel(4);
});
  $(".left").click(function(){
    $("#rhome").carousel("prev");
  });
  $(".right").click(function(){
    $("#rhome").carousel("next");
  });
});


function initComparisons() {
  var x, i;
  /*find all elements with an "overlay" class:*/
  x = document.getElementsByClassName("img-comp-overlay");
  for (i = 0; i < x.length; i++) {
    /*once for each "overlay" element:
    pass the "overlay" element as a parameter when executing the compareImages function:*/
    compareImages(x[i]);
  }
  function compareImages(img) {
    var slider, img, clicked = 0, w, h;
    /*get the width and height of the img element*/
    w = img.offsetWidth;
    h = img.offsetHeight;
    /*set the width of the img element to 50%:*/
    img.style.width = (w / 2) + "px";
    /*create slider:*/
    slider = document.createElement("DIV");
    slider.setAttribute("class", "img-comp-slider");
    /*insert slider*/
    img.parentElement.insertBefore(slider, img);
    /*position the slider in the middle:*/
    slider.style.top = (h / 2) - (slider.offsetHeight / 2) + "px";
    slider.style.left = (w / 2) - (slider.offsetWidth / 2) + "px";
    /*execute a function when the mouse button is pressed:*/
    slider.addEventListener("mousedown", slideReady);
    /*and another function when the mouse button is released:*/
    window.addEventListener("mouseup", slideFinish);
    /*or touched (for touch screens:*/
    slider.addEventListener("touchstart", slideReady);
    /*and released (for touch screens:*/
    window.addEventListener("touchstop", slideFinish);
    function slideReady(e) {
      /*prevent any other actions that may occur when moving over the image:*/
      e.preventDefault();
      /*the slider is now clicked and ready to move:*/
      clicked = 1;
      /*execute a function when the slider is moved:*/
      window.addEventListener("mousemove", slideMove);
      window.addEventListener("touchmove", slideMove);
    }
    function slideFinish() {
      /*the slider is no longer clicked:*/
      clicked = 0;
    }
    function slideMove(e) {
      var pos;
      /*if the slider is no longer clicked, exit this function:*/
      if (clicked == 0) return false;
      /*get the cursor's x position:*/
      pos = getCursorPos(e)
      /*prevent the slider from being positioned outside the image:*/
      if (pos < 0) pos = 0;
      if (pos > w) pos = w;
      /*execute a function that will resize the overlay image according to the cursor:*/
      slide(pos);
    }
    function getCursorPos(e) {
      var a, x = 0;
      e = e || window.event;
      /*get the x positions of the image:*/
      a = img.getBoundingClientRect();
      /*calculate the cursor's x coordinate, relative to the image:*/
      x = e.pageX - a.left;
      /*consider any page scrolling:*/
      x = x - window.pageXOffset;
      return x;
    }
    function slide(x) {
      /*resize the image:*/
      img.style.width = x + "px";
      /*position the slider:*/
      slider.style.left = img.offsetWidth - (slider.offsetWidth / 2) + "px";
    }
  }
}

initComparisons();
</script>
<br><br>

<script>
$(document).ready(function(){
  $('body').scrollspy({target: ".navbar", offset: 50});   
});
</script>
</body>
</html>
