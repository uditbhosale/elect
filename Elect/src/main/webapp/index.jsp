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
      <meta charset="utf-8">
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
                           <button class="btn btn-secondary" type="button" style="background-color: #01ff01; color:#000;border-color:#01ff01 ">
                           <i class="fa fa-search"></i>
                           </button>
                        </div>
                     </div>
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
      <!-- fashion section start -->
      
       <%
try {
    promodel ps = new promodel(jdbc_connection.getConnection());
    List<product_entity> al = ps.display_items();

    // Filter the product list to include products with IDs between 1 and 9
    List<product_entity> filteredProducts = new ArrayList<>();
    for (product_entity product : al) {
        if (product.getId() >= 1 && product.getId() <= 9) {
            filteredProducts.add(product);
        }
    }
%>
<div class="fashion_section">
    <div id="main_slider" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <% 
            boolean isFirstItem = true;
            int itemsPerSlide = 3; // Number of products per slide
            for (int i = 0; i < filteredProducts.size(); i += itemsPerSlide) {
            %>
            <div class="carousel-item<%= isFirstItem ? " active" : "" %>">
            <div class="container">
                     <h1 class="fashion_taital">Smartphones</h1>
                     <div class="fashion_section_2">
                <div class="row">
                    <% 
                    for (int j = i; j < Math.min(i + itemsPerSlide, filteredProducts.size()); j++) {
                        product_entity p = filteredProducts.get(j);
                        
                        
                        
                        	
                        
                    %>
                    <div class="col-lg-4 col-sm-4"> <!-- Adjust column size as needed -->
                        <div class="box_main">
                            <h4 class="shirt_text"><%= p.getProduct_namel() %></h4>
                            <p class="items-color"><%= p.getDescription() %></p>
                            <p class="price_text">Price: <span style="color: #000000;">₹<%= p.getPrice() %></span></p>
                            <!-- Include other product details and images as needed -->
                            <div class="electronic_img">
                               <img alt="" src="<%=p.getImage()%>">
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
        <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
    </div>
</div>
<%
} catch (Exception e) {
    e.printStackTrace();
}
%>
       
       
       
       
      <!-- fashion section end -->
      <!-- electronic section start -->
      <div class="fashion_section">
         <div id="electronic_main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Laptops</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Msi titan gt77 hx</h4>
                                 <p class="items-color">(Intel 13th Gen. i9-13980HX, 44CM FHD 144Hz Mini LED,(64GB/4TB NVMe SSD/Windows 11 Home/Nvidia GeForce RTX4090, 16GB GDDR6/Core Black/3.3Kg))</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹5,70,990</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/msititan.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Msi creator pro x17 hx</h4>
                                 <p class="items-color">(Intel 13th Gen. i9-13980HX,44CM UHD 144Hz Mini LED Creator Laptop (64GB/4TB NVMe SSD/Windows 11 Pro/NVIDIA RTX™ 3500 Ada, GDDR6 12GB/Core Black/3.3Kg))</p>
                                 <p class="price_text">Price:<span style="color:rgb(0, 0, 0);">₹4,99,790</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/msicreatorpro.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">msi creator z16p</h4>
                                 <p class="items-color">(Intel 12th Gen. i9-12900H, 40CM QHD+ 165Hz Creator Laptop (64GB/2TB NVMe SSD/ Windows 11 Pro/Nvidia RTX A5500 16GB GDDR6/Lunar Grey/2.39Kg))</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹4,80,990</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/msicreatorz16p.jpg"></div>
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
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Laptops</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Apple macbook pro</h4>
                                 <p class="items-color">((14-inch, M3 chip with 8‑core CPU and 10‑core GPU, 8GB Unified Memory, 1TB,1.55 Kg,70W USB-C Power Adapter,Magic Keyboard with Touch ID) - Space Grey )</p>
                                 <p class="price_text">Price:<span style="color:rgb(0, 0, 0)6;">₹1,89,900</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/macbookm3.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">apple macbook pro</h4>
                                 <p class="items-color">(M2 Max chip with 12‑core CPU and 30‑core GPU: 33.74 cm (14.2-inch), 32GB Unified Memory, 1TB SSD,67W USB-C Power Adapter,Magic Keyboard with Touch ID,Silver)</p>

                                 <p class="price_text">Price:<span style="color: #262626;">₹2,19,900</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/macbookm2.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Apple Macbook pro </h4>
                                 <p class="items-color"> <p class="items-color">(13.3-inch/33.78 cm, M1 chip with 8‑core CPU and 8‑core GPU, 8GB RAM, 256GB SSD,13.3-inch Retina display with True Tone technology) - Space Grey)</p></p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹1,22,900</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/macbookm1.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart </a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Laptops</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">lenovo thinkpad t15g gen 2</h4>
                                  <p class="items-color">(15.6" Touchscreen Notebook - 4K UHD - 3840 x 2160 - Intel Core i9 11th Gen i9-11950H Octa-core (8 Core) 2.60 GHz - 32 GB RAM - 1 TB SSD - Black)</p>

                                 <p class="price_text">Price:<span style="color: #000000;">₹5,35,745</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/lenovothinkpad.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">ASUS ROG Zephyrus Duo 16</h4>
                                 <p class="items-color">(Mini LED 240Hz/3ms, QHD 16:10 Display, 100% DCI-P3, NVIDIA GeForce RTX 4090, AMD Ryzen 9, 32GB DDR5, 2TB SSD, Windows 11 Pro, GX650PY-XS97, Black)</p>

                                 <p class="price_text">Price:<span style="color: #000000;">₹5,14,703</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/AsusROGZephyrusDuo16.avif"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Dell Alienware m18 R1</h4>
                                 <p class="items-color">(Intel Core i9-13980HX Processor/64GB/1TB SSD/18.0" (45.72cm) QHD+ FHD 165Hz/NVIDIA RTX 4090 16GB GDDR6/Win 11 + MSO'21/Dark Metallic Moon/2.72kg)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹4,50,039</span></p>
                                 <div class="electronic_img"><img src="images/photo-content/dellalienware.jpg"></div>
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
            <a class="carousel-control-prev" href="#electronic_main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#electronic_main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
         </div>
      </div>
      <!-- electronic section end -->
      <!-- jewellery  section start -->
      <div class="jewellery_section">
         <div id="jewellery_main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">Tvs</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung 214 cm (85 inches)</h4>
                                 <p class="items-color">(8K Ultra HD Smart Neo QLED TV QA85QN900AKXXL (Steel) | With 3 Years Warranty)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹11,49,990</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/samsung8ksteel.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung 214 cm (85 inches)</h4>
                                 <p class="items-color">(8K Ultra HD Smart Neo QLED TV QA85QN900CKXXL (Titan Black) | with 3 Years Warranty)</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹10,99,990</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/samsung8ktitanblack.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Samsung 189 cm (75 inches)</h4>
                                 <p class="items-color">(8K Ultra HD Smart Neo QLED TV QA75QN800BKXXL (Stainless Steel) | With 3 Years Warranty)</p>

                                 <p class="price_text">Price:<span style="color: #000000;">₹6,74,990</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/samsung8kstainlesssteel.jpg"></div>
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
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">Tvs</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Sony Bravia 210 cm (83 inches)</h4>
                                 <p class="items-color">(XR Series 4K Ultra HD Smart OLED Google TV XR-83A80L (Black))</p>

                                 <p class="price_text">Price<span style="color: #000000;">₹6,07,990</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/sonyxr83a80l.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Sony Bravia 215 cm (85 inches)</h4>
                                 <p class="items-color">(XR Series 4K Ultra HD Smart Mini LED Google TV XR-85X95L (Black))</p>
                                 <p class="price_text">Price:<span style="color: #000000;">₹4,93,990</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/sonyxr85x95l.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Sony Bravia 195 cm (77 inches) </h4>
                                 <p class="items-color">(XR Series 4K Ultra HD Smart OLED Google TV XR-77A80L (Black))</p>

                                 <p class="price_text">Price:<span style="color: #000000;">₹4,46,490</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/sonyxr77a80l.jpg"></div>
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
               <div class="carousel-item">
                  <div class="container">
                     <h1 class="fashion_taital">TVs</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Vu 248 cms (98 inches)</h4>
                                 <p class="items-color">(Masterpiece Series 4K Ultra HD Smart QLED TV 98QV (Jetplane Grey))</p>

                                 <p class="price_text">Price:<span style="color: #000000;">₹5,49,999</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/vu98qv.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Hisense 305 cm (120 inches)</h4>
                                 <p class="items-color">(Trichrom ALR Screen Series 4K Ultra HD Smart Laser TV 120L9HE (Black) Dolby Audio | Dolby Atmos)</p>

                                 <p class="price_text">Price:<span style="color: #262626;">₹4,99,999</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/hisense120l9he.jpg"></div>
                                 <div class="btn_main">
                                    <div class="buy_bt"><a href="#">Buy Now</a></div>
                                    <div class="seemore_bt"><a href="#">Add to cart</a></div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text">Hisense 189 cm (75 inches)</h4>
                                 <p class="items-color">(8K Ultra HD Smart Certified Android QLED TV 75U80G (Metal Gray) with Dolby Vision and Atmos)</p>

                                 <p class="price_text">Price:<span style="color: #000000;">₹3,49,990</span></p>
                                 <div class="jewellery_img"><img src="images/photo-content/hisense75u80g.jpg"></div>
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
            <a class="carousel-control-prev" href="#jewellery_main_slider" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control-next" href="#jewellery_main_slider" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i>
            </a>
            <div class="loader_main">
               <div class="loader"></div>
            </div>
            
         </div>
        
         
      </div>
     						
    
      
      
     
      <!-- jewellery  section end -->
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
    }, 250); // Adjust the delay time (in milliseconds) as needed
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