 <!DOCTYPE html>
<html class="no-js" lang="zxx">
<%@page import = "CCINFOM.*, java.util.*, java.sql.*"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>View Report</title>

    <!--=== Bootstrap CSS ===-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!--=== Slicknav CSS ===-->
    <link href="assets/css/plugins/slicknav.min.css" rel="stylesheet">
    <!--=== Magnific Popup CSS ===-->
    <link href="assets/css/plugins/magnific-popup.css" rel="stylesheet">
    <!--=== Owl Carousel CSS ===-->
    <link href="assets/css/plugins/owl.carousel.min.css" rel="stylesheet">
    <!--=== Gijgo CSS ===-->
    <link href="assets/css/plugins/gijgo.css" rel="stylesheet">
    <!--=== FontAwesome CSS ===-->
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <!--=== Theme Reset CSS ===-->
    <link href="assets/css/reset.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="style.css" rel="stylesheet">
    <!--=== Responsive CSS ===-->
    <link href="assets/css/responsive.css" rel="stylesheet">


    <!--[if lt IE 9]>
        <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="loader-active" style="background-image: url(assets/img/sportscar.jpg); background-size: 100%">

    <!--== Preloader Area Start ==-->
    <div class="preloader">
        <div class="preloader-spinner">
            <div class="loader-content">
                <img src="assets/img/preloader.gif" alt="JSOFT">
            </div>
        </div>
    </div>
    <!--== Preloader Area End ==-->

    <!--== Header Area Start ==-->
    <header id="header-area" class="fixed-top">

        <!--== Header Bottom Start ==-->
        <div id="header-bottom">
            <div class="container">
                <div class="row">
                    <!--== Logo Start ==-->
                    <div class="col-lg-4">
                        <a href="index.html" class="logo">
                            <img src = "assets/img/zero_logo.png">            
                        </a>
                    </div>
                    <!--== Logo End ==-->

                <!--== Main Menu Start ==-->
                
                <div class="col-lg-8 d-none d-xl-block">
                    <nav class="mainmenu alignright">
                        <ul>
                            <li><a href="index.html">Group Leader</a> </li>
                            <li><a href="m1.html">Member 1</a></li>
                            <li><a href="m2.html">Member 2</a></li>
                        </ul>
                    </nav>
                </div>
               
                <!--== Main Menu End ==-->
            </div>
        </div>
    </div>
    <!--== Header Bottom End ==-->
</header>
<!--== Header Area End ==-->

    <!--== Login Page Content Start ==-->
    <section id="lgoin-page-wrap" class="section-padding">
        <div id="cur">
            <h1 style= "text-align:center ; " >
                REPORT<br>
                GENERATION
            </h1>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-8 m-auto">
                	<div class="login-page-content">
                		<div class="login-form">
                                    <%
            // 1. Connect to the database
            String v_month = request.getParameter("month");
            String v_year = request.getParameter("year");
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection c;
            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement ps = c.prepareStatement("SELECT		CU.COUNTRY, COUNT(CU.EMAIL) AS NUMCUSTOMERS " +
                                                       "FROM		CLIENT_USERS CU JOIN CLIENT_BOOKINGS CB " +
                                                       "				ON	 CU.EMAIL = CB.EMAIL " +
                                                       "                                JOIN BOOKINGS B " +
                                                       "                                ON	 CB.BOOKING_NO = B.BOOKING_NO " +
                                                       "WHERE		MONTH(cb.booked_date) = " + v_month + " AND " +
                                                       "YEAR(cb.booked_date) = " + v_year + " AND " +
                                                       "B.STATUS = 'D' " +
                                                       "GROUP BY	CU.COUNTRY " +
                                                       "ORDER BY	CU.COUNTRY ");
            
            // 3. Execute the SQL Statement
            
            ResultSet rs = ps.executeQuery();
            
            // 4. Process the results
                
            // 5. Disconnect
            
         %>
							<form action="index.html">
                                                                <div class="username">
                                                                    <strong>Global Distribution of Customers per Country<br></strong>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <table class="table">
                                                                        <tr>
                                                                            <th>Country</th>
                                                                            <th>Number of Customers</th>
                                                                        </tr>
                                                                        <%    while(rs.next()) {
                                                                       %> <tr>                                                            
                                                                            <td><%=rs.getString("COUNTRY")%></td>
                                                                            <td><%=rs.getString("NUMCUSTOMERS")%></td>
                                                                        </tr>
                                                                           <%} ps.close();
                                                                               c.close();%>
                                                                    </table>
                                                                 </div>
                                                                <div class="log-btn">
									<button type="submit"><i class="fa fa-check-square"></i> Proceed</button>
								</div>
							</form>
                		</div>
                	</div>
                </div>
        	</div>
        </div>
    </section>
    <!--== Login Page Content End ==-->

    <!--== Scroll Top Area Start ==-->
    <div class="scroll-top">
        <img src="assets/img/scroll-top.png" alt="JSOFT">
    </div>
    <!--== Scroll Top Area End ==-->

    <!--=======================Javascript============================-->
    <!--=== Jquery Min Js ===-->
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <!--=== Jquery Migrate Min Js ===-->
    <script src="assets/js/jquery-migrate.min.js"></script>
    <!--=== Popper Min Js ===-->
    <script src="assets/js/popper.min.js"></script>
    <!--=== Bootstrap Min Js ===-->
    <script src="assets/js/bootstrap.min.js"></script>
    <!--=== Gijgo Min Js ===-->
    <script src="assets/js/plugins/gijgo.js"></script>
    <!--=== Vegas Min Js ===-->
    <script src="assets/js/plugins/vegas.min.js"></script>
    <!--=== Isotope Min Js ===-->
    <script src="assets/js/plugins/isotope.min.js"></script>
    <!--=== Owl Caousel Min Js ===-->
    <script src="assets/js/plugins/owl.carousel.min.js"></script>
    <!--=== Waypoint Min Js ===-->
    <script src="assets/js/plugins/waypoints.min.js"></script>
    <!--=== CounTotop Min Js ===-->
    <script src="assets/js/plugins/counterup.min.js"></script>
    <!--=== YtPlayer Min Js ===-->
    <script src="assets/js/plugins/mb.YTPlayer.js"></script>
    <!--=== Magnific Popup Min Js ===-->
    <script src="assets/js/plugins/magnific-popup.min.js"></script>
    <!--=== Slicknav Min Js ===-->
    <script src="assets/js/plugins/slicknav.min.js"></script>

    <!--=== Main Js ===-->
    <script src="assets/js/main.js"></script>
                                 
</body>

</html>
</body>

</html>