	<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.product_entity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.connection.jdbc_connection"%>
<%@page import="com.model.promodel"%>
<%@page import="com.entity.signup_entity"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    		signup_entity s1=(signup_entity)session.getAttribute("user_login");
    
    if(s1==null){
    	request.setAttribute("user_login",s1);
    	response.sendRedirect("login.jsp");
    }
    
    
    ArrayList<product_entity> cart_list=(ArrayList<product_entity>) session.getAttribute("cart-list");
    ArrayList<product_entity> al2=null;
    
    List<product_entity> searchResults = (List<product_entity>) request.getAttribute("searchResults");
    System.out.println("Search Results in search.jsp: " + searchResults);

        // Check if searchResults is not null and not empty
        if (searchResults != null && !searchResults.isEmpty()) {
            // Assuming the first product in the search results has the desired searchTerm
            product_entity firstProduct = searchResults.get(0);
            String productName = firstProduct.getProduct_namel();
            String productDescription = firstProduct.getDescription();
            
            // Use the product name if available, otherwise use the product description
            String searchTerm = (productName != null && !productName.isEmpty()) ? productName : productDescription;
            System.out.println("Search Term: " + searchTerm); // Optional: Print the searchTerm
        }
        else {
            System.out.println("No search results found");
        }
    
    if(cart_list!=null){
    
    promodel ps=new promodel(jdbc_connection.getConnection());
	
     al2=ps.displaycart(cart_list);
     
     request.setAttribute("cart_list", cart_list); 
     
    
   
    
    
    }
    %>


<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>ElecT</title>
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
         <h6 style="color: white;">₹</h6>
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
                  <form action="SearchServlet" method="post" accept-charset="UTF-8">
                     <!-- Another variation with a button -->
                     <div class="input-group">
        <input type="text" class="form-control" placeholder="Search your items" id="productForm" name="term" required>
                    <button class="btn btn-secondary" type="submit" style="background-color: #01ff01; color: #000; border-color: #01ff01 " onclick="searchItems()">
                <i class="fa fa-search"></i>
            </button>
        </div>
        </form>
        
    
                  </div>
                  <div class="header_box">
                     
                     <div class="login_menu">
                        <ul>
                           <li><a href="cart.jsp">
                              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                              <span class="padding_10">Cart<span class="badge badge-light" style="padding:7px;margin-left:5px;background-color: #01ff01;color:#000">${cart_list.size()}</span></span></a>
                           </li>
                           <li><a href="#">
                              <i class="fa fa-user" aria-hidden="true"></i>
                              
                              <span class="padding_10" id="account" onmouseover="showDropdown();">Account</span>
                           </a>
                              <ul class="dropdown" id="dropdownMenu" onmouseover="showDropdown();">
                                
                                 
                                 
                                 <%
                                 
                                 signup_entity s2=(signup_entity)session.getAttribute("user_login");
                                 if(s2!=null){%>
                                	 
                                	 
                                	 <li ><a href="myaccount.jsp" class="dropdown-item" style="color: #000000;">My Account</a></li>
                                     <br>
                                     
                                     <li><a href="orders.jsp" class="dropdown-item"  style="color: #000000;">Orders</a></li>
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
                              <div class="buynow_bt"><a href="tv.jsp">Buy Now </a></div>
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
      <!-- fashion section start -->
      <div class="fashion_section">
       <% 
        if (searchResults != null && !searchResults.isEmpty()) {
        %>
 
       
        <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <% 
                boolean isFirstItem = true;
                int itemsPerSlide = 200; // Number of products per slide
                for (int i = 0; i < searchResults.size(); i += itemsPerSlide) {
                %>
                <div class="carousel-item<%= isFirstItem ? " active" : "" %>">
                    <div class="container">
                        <h1 class="fashion_taital">Search Results</h1>
                        <div class="fashion_section_2">
                            <div class="row">
                                <% 
                                for (int j = i; j < Math.min(i + itemsPerSlide, searchResults.size()); j++) {
                                    product_entity p = searchResults.get(j);
                                    
                                    // Fetch image data as byte array
                                    byte[] imageData = p.getImage();
                                    // Convert byte array to Base64 string
                                    String base64Image = imageData != null ? Base64.getEncoder().encodeToString(imageData) : "";
                                %>
                                <div class="col-lg-4 col-sm-4"> <!-- Adjust column size as needed -->
                                    <div class="box_main">
                                        <h4 class="shirt_text"><%= p.getProduct_namel() %></h4>
                                        <p class="items-color"><%= p.getDescription() %></p>
                                        <p class="price_text">Price: <span style="color: #000000;">₹<%= p.getPrice() %></span></p>
                                        <!-- Display the image using Base64 encoded data URI -->
                                        <div class="electronic_img">
                                            <img alt="" src="data:image/*;base64, <%= base64Image %>">
                                        </div>

                                        <div class="btn_main">
                                            <div class="buy_bt"><a href="#">Buy Now</a></div>
                                            <div class="seemore_bt"><a href="AddToCartServlet?id=<%=p.getId() %>">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                                <% 
                                }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                    isFirstItem = false;
                }
                %>
            </div>
           
        </div>
        <% 
        } else {
        %>
        <div class="no-results"><div  style="text-align: center;"><img src="images/photo-content/psyduck1.png" style=" width:30%;height:30%;margin-top: 2%"><br><h1 style="margin-top: 2%"><strong>No search results found</strong></h1></div></div>
        <% 
        }
        %>
    </div>
     
     
      <!-- jewellery  section end -->
      <!-- footer section start -->
      <div class="footer_section layout_padding" style="margin-top: -10%">
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
    }, 250); // Adjust the delay time (in milliseconds) as needed
}

// Event listener for mouseover on the "Account" section
accountElement.addEventListener("mouseover", showDropdown);

// Event listener for mouseleave on the "Account" section
accountElement.addEventListener("mouseleave", hideDropdown);

// Event listener for mouseleave on the dropdown menu
dropdownMenu.addEventListener("mouseleave", hideDropdown);

             </script>
             
             <script type="text/javascript">
             
             function searchItems() {
                 var searchTerm = document.getElementById('productForm').value.toLowerCase();
                 console.log('Search Term:', searchTerm);
                 

                 // Make an AJAX request to the Servlet
                 var xhr = new XMLHttpRequest();
                 xhr.onreadystatechange = function() {
                     if (xhr.readyState === XMLHttpRequest.DONE) {
                         if (xhr.status === 200) {
                             var results = JSON.parse(xhr.responseText);
                             displayResults(results);
                         } else {
                             console.error('Error:', xhr.status);
                         }
                     }
                 };

                 xhr.open('GET', 'SearchServlet?term=' + searchTerm, true);
                 xhr.send();
             }

             function displayResults(results) {
                 var resultsContainer = document.getElementById('searchResults');
                 resultsContainer.innerHTML = ''; // Clear previous results

                 if (results.length === 0) {
                     resultsContainer.innerHTML = '<p>No results found.</p>';
                 } else {
                     results.forEach(function(item) {
                         var resultCard = document.createElement('div');
                         resultCard.classList.add('card', 'mb-2');
                         resultCard.innerHTML = `
                             <div class="card-body">
                                 <h5 class="card-title">${item.productName}</h5>
                                 <p class="card-text">${item.description}</p>
                             </div>
                         `;
                         resultsContainer.appendChild(resultCard);
                     });
                 }
             }

             
              
             </script>

             <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
             
             
            
   </body>
</html>