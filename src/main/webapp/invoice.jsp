

<% 

String email = (String) session.getAttribute("email");
String firstname = (String) session.getAttribute("firstname");
String lastname = (String) session.getAttribute("lastname");
String idg = (String) session.getAttribute("idg");
String phonenumber=(String) session.getAttribute("phonenumber");
String paymentDate=(String) session.getAttribute("paymentDate");
String amount=(String) session.getAttribute("amount");
String paymentId= (String) session.getAttribute("idpayment");

%>

<% String idgq = (String) session.getAttribute("idg");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/invoice.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>


<div class="col-md-12">   
 <div class="row">
		
        <div class="receipt-main col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            			
			<div class="row">
				<div class="receipt-header receipt-header-mid">
					<div class="col-xs-8 col-sm-8 col-md-8 text-left">
						<div class="receipt-right">
							<h5 >FirstName : <%= firstname %> </h5>
							<h5 >LastName : <%= lastname %> </h5>
							<h5 >Email : <%= email %> </h5>
							<h5 >PhoneNumber : <%= phonenumber %> </h5>
							
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4">
						<div class="receipt-left">
							<h3> INVOICE # <%= paymentId %> </h3>
						</div>
					</div>
				</div>
            </div>
			
            <div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-9">Payment for your Reservation </td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> <%= amount %></td>
                        </tr>
                        
                       
                        
                        <tr>
                           
                            <td class="text-right"><h2><strong>Total: </strong></h2></td>
                            <td class="text-left text-danger"><h2><strong><i class="fa fa-inr"></i> <%= amount %>/-</strong></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
			
			<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<div class="col-xs-8 col-sm-8 col-md-8 text-left">
						<div class="receipt-right">
							<p><b>Date :</b> <%=paymentDate  %></p>
							<h5 style="color: rgb(140, 140, 140);">Thank You for Your Visite !</h5>
						</div>
					</div>
					
				</div>
            </div>
			
        </div>    
	</div>
</div>



<script>
        
		        var Id = localStorage.getItem("myDidg");
		        var Email = localStorage.getItem("myDemail");
		        var Firstname = localStorage.getItem("myDfirstname");
		        var Lastname = localStorage.getItem("myDlastname");
		        var PhoneNumber = localStorage.getItem("myDphonenumber");
		        	
		        
		        document.getElementById("displayFirstname").innerText = "Firstname: " + Firstname + "\n" +
                "Lastname: " + Lastname + "\n" +
                "Email: " + Email + "\n" +
                "PhoneNumber: " + PhoneNumber;
		        
		      
		        
    </script>



</body>
</html>