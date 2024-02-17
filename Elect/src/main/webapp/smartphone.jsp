<%@page import="com.entity.signup_entity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Smartphones</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
      <!-- font awesome -->
      <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <!--  -->
      <!-- owl stylesheets -->
      <link href="https://fonts.googleapis.com/css?family=Great+Vibes|Poppins:400,700&display=swap&subset=latin-ext" rel="stylesheet">
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesoeet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
   </head>
   <body>
      <!-- banner bg main start -->
      <div class="banner_bg_main">
         <!-- header top section start -->
         <div class="container">
            <div class="header_section_top">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="custom_menu">
                        <ul>
                           <li><a href="#">Best Sellers</a></li>
                           <li><a href="#">Gift Ideas</a></li>
                           <li><a href="#">New Releases</a></li>
                           <li><a href="#">Today's Deals</a></li>
                           <li><a href="#">Customer Service</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- header top section start -->
         <!-- logo section start -->
         <div class="logo_section">
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="logo"><a href="index.jsp"><img src="images/Elect2.png"></a></div>
                  </div>
               </div>
            </div>
         </div>
         <!-- logo section end -->
         <!-- header section start -->
         <div class="header_section">
            <div class="container">
               <div class="containt_main">
                  <div id="mySidenav" class="sidenav">
                     <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                     <a href="index.jsp">Home</a>
                     <a href="smartphone.jsp">Smartphone</a>
                     <a href="laptop.jsp">Laptop</a>
                     <a href="tv.jsp">Tv</a>
                  </div>
                  <span class="toggle_icon" onclick="openNav()"><img src="images/toggle-icon.png"></span>
                  <div class="dropdown">
                     <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All Category 
                     </button>
                     <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="smartphone.jsp">Smartphones</a>
                        <a class="dropdown-item" href="laptop.jsp">Laptops</a>
                        <a class="dropdown-item" href="tv.jsp">Tvs</a>
                     </div>
                  </div>
                  <div class="main">
                     <!-- Another variation with a button -->
                     <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search your items">
                        <div class="input-group-append">
                           <button class="btn btn-secondary" type="button" style="background-color: #01ff01; border-color:#01ff01 ">
                           <i class="fa fa-search"></i>
                           </button>
                        </div>
                     </div>
                  </div>
                  <div class="header_box">
                     
                     <div class="login_menu">
                        <ul>
                           <li><a href="#">
                              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                              <span class="padding_10">Cart</span></a>
                           </li>
                           <li><a href="#">
                              <i class="fa fa-user" aria-hidden="true"></i>
                              
                              <span class="padding_10" id="account" onmouseover="showDropdown();">Account</span>
                           </a>
                              <ul class="dropdown" id="dropdownMenu" onmouseover="showDropdown();">
                                  <%
                                 
                                 signup_entity s2=(signup_entity)session.getAttribute("user_login");
                                 if(s2!=null){%>
                                	 
                                	 
                                	 <li ><a href="#" class="dropdown-item" style="color: #000000;">My Account</a></li>
                                     <br>
                                     
                                     <li><a href="#" class="dropdown-item"  style="color: #000000;">Orders</a></li>
                                 <br>
                                	 <li><a href="logout_servlet" class="dropdown-item"  style="color: #000000;">Logout</a></li>
                                <%}
                                 else{%>
                                	 <li><a href="login.jsp" class="dropdown-item"  style="color: #000000;">Login</a></li>
                                     <br>
                                	 
                                <%} %> 
                             </ul>
                          

                              
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- header section end -->
         <!-- banner section start -->
         <div class="banner_section layout_padding">
            <div class="container">
               <div id="my_slider" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                     <div class="carousel-item active">
                        <div class="row">
                           <div class="col-sm-12">
                              <h1 class="banner_taital">Get Started <br>Buy your favourite Smartphone</h1>
                              <div class="buynow_bt"><a href="smartphone.jsp">Buy Now</a></div>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-sm-12">
                              <h1 class="banner_taital">Upgrade Now!<br>Buy your favourite Laptop NOW!</h1>
                              <div class="buynow_bt"><a href="laptop.jsp">Buy Now</a></div>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item">
                        <div class="row">
                           <div class="col-sm-12">
                              <h1 class="banner_taital">TVs on Sale!<br>Buy your favourite TV</h1>
                              <div class="buynow_bt"><a href="tv.jsp">Buy Now</a></div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
                  <i class="fa fa-angle-left"></i>
                  </a>
                  <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
                  <i class="fa fa-angle-right"></i>
                  </a>
               </div>
            </div>
         </div>
         <!-- banner section end -->
      </div>
      <!-- banner bg main end -->
      <!-- electronic section start -->
      <div class="fashion_section">
         <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Smartphones</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Iphone 15 pro max</h4>
                                 <p class="items-color">(Natural Titanium)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹ 1,59,900</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/iphone15promaxnaturaltitanium.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Iphone 15 pro max</h4>
                                 <p class="items-color">(Black Titanium)</p>
                                 <p class="price_text">Price  <span style="color: #000000;">₹1,59,900</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/iphone15promaxblackltitanium.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Iphone 15 pro max</h4>
                                 <p class="items-color">(Blue Titanium)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,59,900</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/iphone15promaxbluetitanium.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung Galaxy S23 Ultra </h4>
                                 <p class="items-color">(Cream)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,00,325</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/s23cream.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung Galaxy S23 Ultra </h4>
                                 <p class="items-color">(Green)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,00,400</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/s23green.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung Galaxy S23 Ultra </h4>
                                 <p class="items-color">(Black)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,21,999</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/s23black.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Oneplus open </h4>
                                 <p class="items-color">(Emerald Dusk)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,39,999</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/oneplusopenemeralddusk.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Motorola razr 40</h4>
                                 <p class="items-color">(Viva Magneta)</p>

                                 <p class="price_text">Price  <span style="color: #000000;">₹79,999</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/motorolarazrmagneta.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">google pixel 7</h4>
                                 <p class="items-color">(Obsidian)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹42,999</span></p>
                                 <div class="tshirt_img"><img src="images/photo-content/pixel7.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung Galaxy Z Fold5 5G</h4>
                                 <p class="items-color">(Cream, 12GB RAM, 512GB Storage)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,64,999</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/samsungfold5.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>

                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Google Pixel 8 Pro</h4>
                                 <p class="items-color">(Bay Blue)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹113,999</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/googlepixel8pro.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>



                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung Galaxy Z Flip5 5G </h4>
                                 <p class="items-color">(Lavender,8GB RAM.512GB Storage)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">$ 100</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/samsungflip5.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           

                        </div>


                        
                     </div>
                  </div>
               </div>
               
            </div>
           
         </div>
      </div>
      <!-- electronic section end -->
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="footer_logo"><a href="index.jsp"><img src="images/Elect2.png"></a></div>
            <div class="input_bt">
               <input type="text" class="mail_bt" placeholder="Your Email" name="Your Email">
               <span class="subscribe_bt" id="basic-addon2"><a href="#">Subscribe</a></span>
            </div>
            <div class="footer_menu">
               <ul>
                  <li><a href="#">Best Sellers</a></li>
                  <li><a href="#">Gift Ideas</a></li>
                  <li><a href="#">New Releases</a></li>
                  <li><a href="#">Today's Deals</a></li>
                  <li><a href="#">Customer Service</a></li>
               </ul>
            </div>
            <div class="location_main">Help Line  Number : <a href="#">+917219248099</a></div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">© 2023 All Rights Reserved. Design by Udit Bhosale</p>
         </div>
      </div>
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script>
         function openNav() {
           document.getElementById("mySidenav").style.width = "250px";
         }
         
         function closeNav() {
           document.getElementById("mySidenav").style.width = "0";
         }
      </script>
      
      
      <script>
               // Get the elements
const accountElement = document.getElementById("account");
const dropdownMenu = document.getElementById("dropdownMenu");
const dropdownItems = document.querySelectorAll(".dropdown-item");

let timeoutHandle; // Variable to store the timeout handle

// Function to show the dropdown
function showDropdown() {
    clearTimeout(timeoutHandle); // Clear any previous timeout
    dropdownMenu.style.display = "block";

    // Show each dropdown item
    dropdownItems.forEach(item => {
        item.style.display = "block";
    });
}

// Function to hide the dropdown after a delay
function hideDropdown() {
    timeoutHandle = setTimeout(() => {
        dropdownMenu.style.display = "none";

        // Hide each dropdown item
        dropdownItems.forEach(item => {
            item.style.display = "none";
        });
    }, 200); // Adjust the delay time (in milliseconds) as needed
}

// Event listener for mouseover on the "Account" section
accountElement.addEventListener("mouseover", showDropdown);

// Event listener for mouseleave on the "Account" section
accountElement.addEventListener("mouseleave", hideDropdown);

// Event listener for mouseleave on the dropdown menu
dropdownMenu.addEventListener("mouseleave", hideDropdown);

             </script>
   </body>
</html>