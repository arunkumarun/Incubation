<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="style.css">
<title>SignUp</title>


</head>
<body>
	<div class="login-form">
	<h1>Join the Users!!!!!</h1><br>
	<form action="Welcome" method="post">
		<input type="text" id="UserName" class="form-control" placeholder="Your Name" name="uname"><br>
		<input type="password" id="Passwod" class="form-control" placeholder="New Password" name="pass"><br>
		<input type="password" id="Passwod" class="form-control" placeholder="Retype Password" name="repass"><br>
		<input type="hidden" name="operation" value="signup">
		<input type="submit" class="log-btn" value="Create"><br><br>
		<span class="alert">${err}</span>
		<p>${err}</p>	
	</form>
	</div>
	
	
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <!-- <script src="index.js"></script> -->
</body>
</html>