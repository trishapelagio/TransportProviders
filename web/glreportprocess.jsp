<!DOCTYPE html>
<html class="no-js" lang="zxx">
<%@page import = "CCINFOM.*, java.util.*, java.sql.*"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Report Process</title>

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

<body class="loader-active" style="background-image: url(assets/img/blackred.jpg); background-size: 100% ;">

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
            <h1 style= "text-align:cente;" >
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
            String v_year = request.getParameter("years");
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/transportation?autoReconnect=true&useSSL=false&user=root&password=p@ssword");
            // 2. Prepare the SQL Statement
            PreparedStatement stmt = conn.prepareStatement("SELECT A.MONTH, A.NUMCOMPLETED, B.NUMCANCELLED, C.TOTALSALES\n" +
                                                            "FROM (SELECT MONTH(b.booked_date) AS MONTH, COUNT(b.status) AS NUMCOMPLETED\n" +
                                                            "		FROM bookings b \n" +
                                                            "        WHERE b.status = 'D' and year(b.booked_date) = "+v_year+"\n" +
                                                            "        GROUP BY MONTH(b.booked_date) \n" +
                                                            "        ORDER BY b.status, MONTH(b.booked_date)\n" +
                                                            "	 ) A LEFT JOIN (SELECT MONTH(bb.booked_date) AS MONTH, COUNT(bb.status) AS NUMCANCELLED\n" +
                                                            "						FROM bookings bb\n" +
                                                            "                        WHERE bb.status ='C' and YEAR (bb.booked_date) = "+v_year+"\n" +
                                                            "                        GROUP BY MONTH(bb.booked_date) \n" +
                                                            "                        ) B ON A.MONTH = B.MONTH\n" +
                                                            "                        LEFT JOIN (SELECT MONTH(bbb.booked_date) AS MONTH, SUM(t.transamount) AS TOTALSALES\n" +
                                                            "										FROM bookings bbb JOIN client_bookings c ON bbb.booking_no = c.booking_no\n" +
                                                            "                                        JOIN transactions t ON t.bookcid = c.bookcid\n" +
                                                            "                                        WHERE bbb.status='D' AND YEAR(bbb.booked_date) = "+v_year+"\n" +
                                                            "                                        GROUP BY MONTH(bbb.booked_date) \n" +
                                                            "                                        ORDER BY bbb.status, MONTH(bbb.booked_date)\n" +
                                                            "                                        ) C ON A.MONTH = C.MONTH;");
            // 3. Execute the SQL Statement
            
            ResultSet rs = stmt.executeQuery();
            
            // 4. Process the results
                
            // 5. Disconnect
            
         %>
							<form action="index.html">
                                                                <div class="username">
                                                                    <strong>Monthly Completed and Cancelled Bookings <br>and Total Sales</strong>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <table class="table">
                                                                        <tr>
                                                                            <th>Month</th>
                                                                            <th>Completed Bookings</th>
                                                                            <th>Cancelled Bookings</th>
                                                                            <th>Total Sales</th>
                                                                        </tr>
                                                                        <%    while(rs.next()) {
                                                                       %> <tr>                                                            
                                                                            <td><%=rs.getString("A.MONTH")%></td>
                                                                            <td><%=rs.getString("A.NUMCOMPLETED")%></td>
                                                                            <td><%=rs.getString("B.NUMCANCELLED")%></td>
                                                                            <td><%=rs.getString("C.TOTALSALES")%></td>
                                                                                   
                                                                        </tr>
                                                                           <%} stmt.close();
                                                                               conn.close();%>
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
    </section
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