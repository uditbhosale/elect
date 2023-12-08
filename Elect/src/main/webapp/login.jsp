<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="./style-login.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="wrapper">

  <div class="login-box">
    <form action="login_servlet" method="post">
      <h2>Login</h2>

      <div class="input-box">
        <span class="icon">
          <ion-icon name="mail"></ion-icon>
        </span>
        <input type="email" required placeholder="Email" name="email">
        
      </div>

      <div class="input-box">
        <span class="icon">
          <ion-icon name="lock-closed"></ion-icon>
        </span>
        <input type="password" required placeholder="Password" name="password" >
        
      </div>

      <div class="remember-forgot">
        
      </div>

      <button type="submit">Login</button>

      <div class="register-link">
        <p>Don't have an account? <a href="signup.jsp">Register</a></p>
      </div>
    </form>
  </div>

</div>
<!-- partial -->
  <script src='https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js'></script>
<script src='https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js'></script>
</body>
</html>
