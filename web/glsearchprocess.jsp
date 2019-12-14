<!DOCTYPE html>
<html class="no-js" lang="zxx">
<%@page import = "CCINFOM.*, java.util.*"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Update</title>

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

<body class="loader-active">
    <%
        String v_bookingno = request.getParameter("booking_no");
        
        Booking book = new Booking();
        book.searchno = v_bookingno;
        book.displayBooking();
        %>

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
    <header id="header-area" class="fixed-top" style="background-color: black">
        <!--== Header Bottom Start ==-->
        <div id="header-bottom">
            <div class="container">
                <div class="row">
                    <!--== Logo Start ==-->
                    <div class="col-lg-4">
                        <a href="index.html" class="logo">

                            <img src = "assets/img/logo.png">            
                        
                        </a>
                    </div>
                    <!--== Logo End ==-->

                </div>
            </div>
        </div>
        <!--== Header Bottom End ==-->
    </header>
    <!--r== Header Area End ==-->

    <!--== Login Page Content Start ==-->
    <section id="lgoin-page-wrap" class="section-padding">
        <div id="cur">
            <h1 style= "font-family: Verdana; font-size : 400%; text-align:center ; color: black" >
                Search<br>
                Booking
            </h1>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-8 m-auto">
                	<div class="login-page-content">
                		<div class="login-form">
							<form action="index.html">
                                                                <div class="username">
                                                                    <strong>Booking Number</strong>
                                                                    <p><%=book.booking_no%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Booked Date</strong>
                                                                    <p><%=book.booked_date%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Number of Hours</strong>
                                                                    <p><%=book.numhours%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Date Saved</strong>
                                                                    <p><%=book.saved_date%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Confirmed Date</strong>
                                                                    <p><%=book.confirmed_date%><p>
                                                                </div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Cancelled Date</strong>
                                                                    <p><%=book.cancelled_date%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Total Cost</strong>
                                                                    <p><%=book.totalcost%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Number of People</strong>
                                                                    <p><%=book.numpeople%><p>
								</div
                                                                <br><br>
                                                                <div class="username">
                                                                    <strong>Status</strong>
                                                                    <p><%=book.status%><p>
								</div
                                                                <br><br>
                                                                <div class="username">
                                                                    <strong>Group Number</strong>
                                                                    <p><%=book.groupno%><p>
								</div>
                                                                <br>
                                                                <div class="username">
                                                                    <strong>Offer ID</strong>
                                                                    <p><%=book.offerid%><p>
								</div>
                                                                <br>
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