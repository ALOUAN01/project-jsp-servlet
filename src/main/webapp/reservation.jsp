<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Booking Form HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/reservation.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<div id="booking" class="section">
		<div class="section-center">
			<div class="container">
				<div class="row">
					<div class="col-md-7 col-md-push-5">
						<div class="booking-cta">
							<h1>Make your reservation</h1>
							
							
							<p>
							</p>
						</div>
					</div>
					<div class="col-md-4 col-md-pull-7">
						<div class="booking-form">
							<form action="reservation" method="post">
								<div class="form-group">
									<span class="form-label">Your Bill-Id</span>
									<input class="form-control" type="text" id="displayid" name="idguest" Readonly >
								</div>
								<div class="form-group">
									<span class="form-label">Your address email</span>
									<input class="form-control" type="text" id="displayemail" name="Email" Readonly >
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Check In</span>
											<input class="form-control" type="date" name="checkin" required>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Check out</span>
											<input class="form-control" type="date" name="checkout" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Rooms</span>
											<select class="form-control" name="typeRoom">
												<option>Suite</option>
												<option>Deluxe</option>
												<option>Standard</option>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<span class="form-label">Adults</span>
											<select class="form-control" name="numberAdulte">
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
									
								</div>
								<div class="form-btn">
									
									<input type="submit" name="res" id="res" class="submit-btn" value="Check availability & reserve" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script>
        
		        var retrievedId = localStorage.getItem("myData");
		        var retrievedEmail = localStorage.getItem("myDataemail");
		        document.getElementById("displayid").value = retrievedId;
		        document.getElementById("displayemail").value = retrievedEmail;
		        
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "success"){
		swal("Reserved", "Your Room Is Booked Successfully", "success");
		}
		if(status == "failed"){
			swal("Already Filed Room", "Please chose another option", "error");
		}

</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->




</html>