<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    


<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/login1.css">

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
  <div class="main">
	
	
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="registration" method="post">
			<h1>Create Account</h1>
			<br>
			<span> use your email for registration</span>
			<input type="text" placeholder="LastName" name="LastName"/>
			<input type="text" placeholder="FirstName" name="FirstName"/> 
			<input type="tel" placeholder="PhoneNumber" name="PhoneNumber"/>
			<input type="email" placeholder="Email" name="email"/>
			<input type="password" placeholder="Password" name="Password" />
			<input type="submit" name="signup" id="signup" class="btn " value="Sign Up" />
			
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="login" method="post" >
			<h1>Sign in</h1>
			<br>
			<span>or use your account</span>
			<input type="email" placeholder="Email" name="Email" />
			<input type="password" placeholder="Password" name="Password"/>
			<a href="#">Forgot your password?</a>
			<input type="submit" name="signin" id="signin" class="btn " value="Sign In" />
            
			
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>


 
    
  </div>

	

	<!-- JS -->
	<script>
			const signUpButton = document.getElementById('signUp');
			const signInButton = document.getElementById('signIn');
			const container = document.getElementById('container');
		
			signUpButton.addEventListener('click', () => {
				container.classList.add("right-panel-active");
			});
		
			signInButton.addEventListener('click', () => {
				container.classList.remove("right-panel-active");
			});
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
		swal("Congrats", "Account Created Successfully", "success");}

</script>
   
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>