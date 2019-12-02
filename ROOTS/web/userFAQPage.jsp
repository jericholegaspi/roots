<!DOCTYPE html>
<html lang="en">
<head>
<title>FAQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

 <link rel="stylesheet" type="text/css" href="assets/css/FAQPage.css">

  <link rel="shortcut icon" sizes="16x16 32x32 64x64" href="assets/css/images/logo5.png"/>

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

<!-- START of hero -->
  <div class="hero-image">
  <div class="hero-text">
    <strong>Frequently Asked Questions</strong>    
    <hr>
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><span class="fa fa-search"></span></button>
  </div>
</div>
</div>

<!-- END of hero -->
<div class="col-sm-12">

<div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Traditional Medicine
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="col-sm-12">
        <div class="card-body">
          Traditional medicine, as defined by the World Health Organization, is the sum total of the knowledge, skills, and practices based on the theories, beliefs, and experiences indigenous to different cultures, whether explicable or not, used in the maintenance of health as well as in the prevention, diagnosis, improvement, or treatment of physical and mental illness.
        </div>
      </div>
      
      <div class="col-sm-12">
      <div class="card-body">
        <ol>
        <li><p class="col-sm-12"><u>Is it safe?</u> <br>
          <p class="col-sm-12">Yes, as long as it is used or administered properly and only in right quantities or as directed by a Traditional Medicine Expert.</p>
        </li>
        <li><p class="col-sm-12"><u>How does Traditional Medicine compare to Pharmaceutical Medicine?</u> <br>
          <p class="col-sm-12">Pharmaceutical products often provides faster results than Traditional Medicine, but they come with a higher risk of side effects, higher costs, and more often addresses the symptoms rather than the actual cause. Traditional Medicine, on the other hand, promotes long-term healing and lifestyle changes as well as having lower costs and risks, but is more often required to be taken regularly for an extended period of time.</p>
        </li>
        <li><p class="col-sm-12"><u>How is Traditional Medicine used?</u> <br>
          <p class="col-sm-12">Different Traditional Medicines are meant to be used in different ways. Not all plants and herbs are intended for consumption as some of them are not safe to ingest. A Traditional Medicine Expert can advise you how to use each plant and herbal medicine and ask you questions to determine whether it’s suitable for you to use.</p>
        </li>
        <li><p class="col-sm-12"><u>Can Traditional Medicine be used in conjunction with Pharmaceutical Medicine?</u> <br>
          <p class="col-sm-12">This is dependent on one's situation. While it is generally safe to do so, some Pharmaceutical Medicines do not work together with Traditional Medicine and may have adverse effects instead. It is often best to focus on only one form of treatment or consult a Traditional Medicine Expert regarding this matter.</p>
        </li>
        </ol>
      </div>
    </div>
  </div>
 
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          PITAHC
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        PITAHC, which stands for the Philippine Institute of Traditional and Alternative Health Care, is a government owned and controlled corporation attached to the Department of Health.  As a research institute, PITAHC is responsible for the documentation, promotion, and advocacy for the use of traditional and alternative health care products, modalities, and technologies. <br>
      </div>
    </div>
    <div class="col-sm-12">
      <div class="card-body">
        <ol>
        <li><p class="col-sm-12"><u>Where can we inquire for more information about Traditional Medicine?</u> <br>
          <p class="col-sm-12">You can inquire more about Traditional Medicine from the PITAHC, located in Pitahc Building, Matapang, Pinyahan, Quezon City, 1100 Metro Manila.</p>
        </li>
        <li><p class="col-sm-12"><u>When and how was PITAHC established?</u> <br>
          <p class="col-sm-12">Republic Act 8423, otherwise known as the Traditional and Alternative Medicine Act of 1997 (TAMA)Law was passed on December 8, 1997 and was signed into law by then President Fidel V. Ramos on December 9, 1997.  The law was created to improve the quality and delivery of health care services to the Filipino people through the development of traditional and alternative health care (TAHC) and its integration into the national health care delivery system. This law led to the creation of the Philippine Institute of Traditional and Alternative Health Care (PITAHC).</p>
        </li>
        </ol>
      </div>
    </div>
  </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          What are traditional remedies for cough or colds?
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Bitter Melon (Ampalaya)</li>
          <li>Garlic (Bawang)</li>
          <li>Hibiscus (Gumamela)</li>
          <li>Calamansi (Kalamansi)</li>
          <li>Ginger (Luya)</li>
          <li>Mango (Mangga)</li>
          <li>Tamarind (Sampalok)</li>
          <li>Onion (Sibuyas)</li>
          <li>Pomelo (Suha)</li>
          <li>Sunflower</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFour">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          What are traditional remedies for fever?
        </button>
      </h5>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Orange (Dalandan)</li>
          <li>Durian</li>
          <li>Pomegranate (Granada)</li>
          <li>Hibiscus (Gumamela)</li>
          <li>Calamansi (Kalamansi)</li>
          <li>Langsat (Lansones)</li>
          <li>Mango (Mangga)</li>
          <li>Melon</li>
          <li>Pineapple (Pinya)</li>
          <li>Banana (Saging)</li>
          <li>Tamarind (Sampalok)</li>
          <li>Turnip (Singkamas)</li>
          <li>Pomelo (Suha)</li>
          <li>Lemon Grass (Tanglad)</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFive">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
          What are traditional remedies for dizziness?
        </button>
      </h5>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Guava (Bayabas)</li>
          <li>Orange (Dalandan)</li>
          <li>Calamansi (Kalamansi)</li>
          <li>Ginger (Luya)</li>
          <li>Turmeric (Luyangdilaw)</li>
          <li>Pomelo (Suha)</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSix">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
          What are traditional remedies for headache?
        </button>
      </h5>
    </div>
    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Garlic (Bawang)</li>
          <li>Ginger (Luya)</li>
          <li>Turmeric (Luyangdilaw)</li>
          <li>Banana (Saging)</li>
          <li>Onion (Sibuyas)</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSeven">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
          What are traditional remedies for gas pain?
        </button>
      </h5>
    </div>
    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Garlic (Bawang)</li>
          <li>Orange (Dalandan)</li>
          <li>Celery (Kintsay)</li>
          <li>Ginger (Luya)</li>
          <li>Turmeric (Luyangdilaw)</li>
          <li>Onion (Sibuyas)</li>
          <li>Lemon Grass (Tanglad)</li>
        </ol>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingEight">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
          What plants are recommended for Tooth Pain (Masakit na ngipin)?
        </button>
      </h5>
    </div>
    <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordion">
      <div class="col-sm-12">
        <div class="card-body">
          Please prefer from the following plants:
          <ol>
            <li>Avocado</li>
            <li>Garlic</li>
            <li>Guava</li>
            <li>Coconut</li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingNine">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
          What plants are recommended for Mouth Ulcer (Singaw)?
        </button>
      </h5>
    </div>
    <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Avocado</li>
          <li>Guava</li>
          <li>Pomegranate</li>
          <li>Mango</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
          What plants are recommended for Rheumatism (Rayuma)?
        </button>
      </h5>
    </div>
    <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Avocado</li>
          <li>Garlic</li>
          <li>Taro</li>
          <li>Sesame</li>
          <li>Ginger</li>
          <li>Turmeric</li>
          <li>Papaya</li>
          <li>Onion</li>
          <li>Asthma Weed</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingEleven">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
          What plants are recommended for Scabies (Galis)?
        </button>
      </h5>
    </div>
    <div id="collapseEleven" class="collapse" aria-labelledby="headingEleven" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Avocado</li>
          <li>Guava</li>
          <li>Jackfruit</li>
          <li>Langsat</li>
          <li>Sesame</li>
          <li>Turmeric</li>
          <li>Coconut</li>
          <li>Rice</li>
          <li>Papaya</li>
          <li>Tamarind</li>
          <li>Cayenne Pepper</li>
          <li>Soybean</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwelve">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
          What plants are recommended for Appetite Stimulant (Pampagutom)?
        </button>
      </h5>
    </div>
    <div id="collapseTwelve" class="collapse" aria-labelledby="headingTwelve" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Ampalaya</li>
          <li>Papaya</li>
          <li>Onion</li>
          <li>Chili</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThirteen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
          What plants are recommended for Intestinal Worms (Bulate)?
        </button>
      </h5>
    </div>
    <div id="collapseThirteen" class="collapse" aria-labelledby="headingThirteen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Ampalaya</li>
          <li>Garlic</li>
          <li>Jackfruit</li>
          <li>Langsat</li>
          <li>Turmeric</li>
          <li>Mango</li>
          <li>Watermelon</li>
          <li>Papaya</li>
          <li>Pineapple</li>
          <li>Cucumber</li>
          <li>Asthma Weed</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFourteen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
          What plants are recommended for Wounds (Sugat)?
        </button>
      </h5>
    </div>
    <div id="collapseFourteen" class="collapse" aria-labelledby="headingFourteen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Avocado</li>
          <li>Ampalaya</li>
          <li>Garlic</li>
          <li>Guava</li>
          <li>Jackfruit</li>
          <li>Langsat</li>
          <li>Ginger</li>
          <li>Peanut</li>
          <li>Coconut</li>
          <li>Rice</li>
          <li>Banana</li>
          <li>Onion</li>
          <li>Turnip</li>
          <li>String Beans</li>
          <li>Sugar Cane</li>
          <li>Soybean</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFifteen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen">
          What plants are recommended for Itchiness or Insect bites (Makati o may kagat ng insekto)?
        </button>
      </h5>
    </div>
    <div id="collapseFifteen" class="collapse" aria-labelledby="headingFifteen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Garlic</li>
          <li>Guava</li>
          <li>Gabi</li>
          <li>Calamansi</li>
          <li>Cassava</li>
          <li>Rice</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSixteen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">
          What plants are recommended for Diarrhea (Nagtatae)?
        </button>
      </h5>
    </div>
    <div id="collapseSixteen" class="collapse" aria-labelledby="headingSixteen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Avocado</li>
          <li>Guava</li>
          <li>Coconut</li>
          <li>Calamansi</li>
          <li>Rice</li>
          <li>Banana</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingSeventeen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen">
          What plants are recommended for Hyperacidity?
        </button>
      </h5>
    </div>
    <div id="collapseSeventeen" class="collapse" aria-labelledby="headingSeventeen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Carrot</li>
          <li>Turmeric</li>
          <li>Papaya</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingEighteen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseEighteen" aria-expanded="false" aria-controls="collapseEighteen">
          What plants are recommended for Anxiety (Pagkabalisa)?
        </button>
      </h5>
    </div>
    <div id="collapseEighteen" class="collapse" aria-labelledby="headingEighteen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Dalandan</li>
          <li>Calamansi</li>
          <li>Sesame</li>
          <li>Pomelo</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingNineteen">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseNineteen" aria-expanded="false" aria-controls="collapseNineteen">
          What plants are recommended for Swelling (Namamaga)?
        </button>
      </h5>
    </div>
    <div id="collapseNineteen" class="collapse" aria-labelledby="headingNineteen" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Avocado</li>
          <li>Guava</li>
          <li>Taro</li>
          <li>Pomegranate</li>
          <li>Langsat</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwenty">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseTwenty" aria-expanded="false" aria-controls="collapseTwenty">
          What plants are recommended for Dysentery (Disinteria)?
        </button>
      </h5>
    </div>
    <div id="collapseTwenty" class="collapse" aria-labelledby="headingTwenty" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Pomegranate</li>
          <li>Langsat</li>
          <li>Mango</li>
          <li>Coconut</li>
          <li>Cucumber</li>
          <li>Onion</li>
          <li>Sunflower</li>
          <li>Asthma Weed</li>
        </ol>
      </div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwentyOne">
      <h5 class="mb-0">
        <button class="btn btn-link text-white collapsed stretched-link" data-toggle="collapse" data-target="#collapseTwentyOne" aria-expanded="false" aria-controls="collapseTwentyOne">
          What plants are recommended for Boils or Burns (Pigsa o Paso)?
        </button>
      </h5>
    </div>
    <div id="collapseTwentyOne" class="collapse" aria-labelledby="headingTwentyOne" data-parent="#accordion">
      <div class="col-sm-12">
      <div class="card-body">
        Please prefer from the following plants:
        <ol>
          <li>Hibiscus</li>
          <li>Kamatis</li>
          <li>Jackfruit</li>
          <li>Turmeric</li>
          <li>Coconut</li>
          <li>Onion</li>
          <li>Pomelo</li>
          <li>Eggplant</li>
          <li>Asthma Weed</li>
        </ol>
      </div>
    </div>
    </div>
  </div>
</div>
</div>
  
</div>


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


<!-- START of script-->
<script>

//Tooltip
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

//Search
function myFunction() {
    var input, filter, cards, cardContainer, h4, title, i;
    input = document.getElementById("searchbar");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myDIV");
    cards = cardContainer.getElementsByClassName("card");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body h4.card-title");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

<!-- Search -->
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


<!-- END of scripts-->
</body>
</html>