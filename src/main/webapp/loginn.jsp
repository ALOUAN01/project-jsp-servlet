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
<link rel="stylesheet" href="css/login.css">
</head>
<body>

		<div class="main">

		<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="images/building-66789_1280.jpg"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form action="login" method="post" >
          <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
            <p class="lead fw-normal mb-0 me-3">Sign in with</p>
            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-facebook-f"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-twitter"></i>
            </button>

            <button type="button" class="btn btn-primary btn-floating mx-1">
              <i class="fab fa-linkedin-in"></i>
            </button>
          </div>

          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Or</p>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" id="form3Example3" name="email" class="form-control form-control-lg"
              placeholder="Enter a valid email address" />
            
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" id="form3Example4" name="password" class="form-control form-control-lg"
              placeholder="Enter password" />
            
          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            <div class="form-check mb-0">
              <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
              <label class="form-check-label" for="form2Example3">
                Remember me
              </label>
            </div>
            <a href="#!" class="text-body">Forgot password?</a>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
          <input type="submit" name="signin" id="signin" class="btn btn-primary btn-lg" value="Login" style="padding-left: 2.5rem; padding-right: 2.5rem;"/>
            
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#!"
                class="link-danger">Register</a></p>
          </div>

        </form>
      </div>
    </div>
  </div>
  <div
    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
      Copyright © 2020. All rights reserved.
    </div>
    <!-- Copyright -->

    <!-- Right -->
    <div>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="#!" class="text-white me-4">
        <i class="fab fa-google"></i>
      </a>
      <a href="#!" class="text-white">
        <i class="fab fa-linkedin-in"></i>
      </a>
    </div>
    <!-- Right -->
  </div>
</section>
		</div>

	

	<!-- JS -->
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>