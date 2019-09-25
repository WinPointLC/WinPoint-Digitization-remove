<!DOCTYPE html>
<html lang="en-in">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Forget Password form</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/forgot-password.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
		function validateEmailId() {
			alert("From validateEmailId");
	        var emailVal = $("#email").val();
           alert("email = " + emailVal);
	        var myData = {
	                    email: emailVal
            };
	        //alert("*** " + JSON.stringify(myData));
	        //console.log(myData);
	         $.ajax({
	             type: 'POST',
	             url: '/OnlineEvaluationSystem/CommonController?action=ForgotPasswordServlet',
	             data: JSON.stringify(myData),
	             dataType: 'json',
	             contentType: 'application/json; charset=utf-8',
	             traditional: true,
	             success: function (jsonObj) {
	             	alert("Success from LoginForm");
	        //         var responseJson1=jsonObj[0], responseJson2=jsonObj[1];
	        //         var locationJson = eval('(' + responseJson1 + ')');
	        //         //var studentJson = eval('(' + responseJson2 + ')');
	                	if (locationJson.success) {
	        //     		var strResJSON = JSON.stringify(responseJson2);
	        //     		//alert("studentEmail : " + responseJson2.email);
	                 	window.location.href = locationJson.location + "?varid=" + encodeURIComponent(strResJSON) +"&username=" + "Anjali" +"&password=" + "Anjali";
	             	} else {
	        //             $('#ajaxGetUserServletResponse').text(responseText);
	            	}
	        //     },
	        //     error: function(){
	        //     	//alert("Error");
	        //     	document.getElementById("error").innerHTML = "Invalid email or password";
	        //     }
					//
	        // });
	    }
	    
	</script>
</head>

<body>
	<div class="container">
	  <div class="col-sm-6 col-md-4 col-lg-4 form-content ml-auto mr-auto">
	  	<!--  <form class="form-outer" me	thod="post" action="/OnlineEvaluationSystem/CommonController"> -->
	  	<form class="form-outer" >
				<h3 class="form-login-heading text-center">Forgot Password Form</h3>
				<div class="form-group">
					<label for="email">Email Id</label>
					<input class="form-control" id="email" type="email" placeholder="Type your Email ID" name="email" required>
				</div>
				<div class="form-group">
					<input type="button"  class="submit-btn" value="Submit" name="Submit" onclick="validateEmailId();">
				</div>
				<div class="login-link">
					<a href="LoginForm.jsp">Back to Login</a>
				</div>
	  	</form>
	  </div>
	</div>
</body>
</html>