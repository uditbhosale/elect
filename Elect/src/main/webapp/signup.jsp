<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Signup</title>
  <link rel="stylesheet" href="./style-login.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="wrapper">

  <div class="login-box">
    <form action="signup_servlet" method="post">
      <h2>Signup</h2>
      
      
      <div class="input-box">
        
        <input type="text" required placeholder="First name" name="firstname">
        
      </div>
      
      
      
      
      <div class="input-box">
        
        <input type="text" required placeholder="Last Name" name="lastname">
        
      </div>

      <div class="input-box">
        >
        <input type="email" required placeholder="Email" name="email">
  
      </div>

      <div class="input-box">
        
        <input type="password" required placeholder="Password" name="password">
        
      </div>

      

      <button type="submit">Signup</button>

      
    </form>
  </div>

</div>
<!-- partial -->
  <script src='https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js'></script>
<script src='https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js'></script>
</body>
</html>
