<!DOCTYPE html>
<html class="no-js" lang="zxx">
<%@page import = "CCINFOM.*, java.util.*"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Processing</title>

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

    <!--== Slider Area Start ==-->
    <section id="slider-area">
        <!--== slide Item One ==-->
        <div class="single-slide-item overlay">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        
                    </div>
                    <div class="col-lg-7 text-right">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="slider-right-text">
                                    <h1>WE ARE PROCESSING YOUR REQUEST</h1>
                                    <p>PLEASE WAIT</p>
                                    <a href="glreport.html"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
        <%  // Capture the data sent from the form
            String v_bookingno = request.getParameter("booking_no");
            String v_date       = request.getParameter("booked_date");
            String v_savedate       = request.getParameter("saved_date");
            if(v_savedate.equals(""))
                v_savedate = "9999-12-31";
            String v_confirmdate    = request.getParameter("confirm_date");
            if(v_confirmdate.equals(""))
                v_confirmdate = "9999-12-31";
            String v_canceldate    = request.getParameter("cancel_date");
            if(v_canceldate.equals(""))
                v_canceldate = "9999-12-31";
            String v_numhours     = request.getParameter("num_hours");
            String v_totalcost     = request.getParameter("totalcost");
            String v_numpeople     = request.getParameter("num_people");
            String v_groupno     = request.getParameter("group_no");
            String v_offerid     = request.getParameter("offerid");
            String v_status   = request.getParameter("status");
            
            Booking book = new Booking();
            // Instantiate the class that will process the registration
                
                book.booking_no = v_bookingno;
                book.booked_date = v_date;
                book.numhours = v_numhours;
                book.totalcost = v_totalcost;
                book.numpeople = v_numpeople;
                book.groupno = v_groupno;
                book.offerid = v_offerid;
                book.saved_date = v_savedate;
                book.confirmed_date = v_confirmdate;
                book.cancelled_date = v_canceldate;
                book.status = v_status;
                
                book.updateBooking();
       
            // Redirect to the correct message page
            String redirectURL;
            if (book.booking_status==1)
                redirectURL = "success.html";
            else {
                redirectURL = "fail.html";
            }
            response.sendRedirect(redirectURL);
        %>                 


                </div>
                <br>
                <br>
                <br>
                <br>
                
                <form action = "" align="center">
                            <div class="log-btn btn-lg">
				<button type="submit">               Proceed             </button>
                            </div>
                </form>
            </div>
        </div>
        <!--== slide Item One ==-->
    </section>
    <!--== Slider Area End ==-->

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

    <!--=== Mian Js ===-->
    <script src="assets/js/main.js"></script>

</body>

</html>