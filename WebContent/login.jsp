<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Hello user! Welcome to my site!</h2>
	<form action="login">
		<h3>Please enter your account info~</h3>
		<label for="name">Username : </label>
		<input type="text" id="name" name="userName" /><br>
		<label for="passwd">Password : </label>
		<input type="password" id = "passwd" name="password"/><br>
		<input type="submit" value="sign in"><br>
		<a href="signup.jsp">Have'nt got an account yet? Click to sign up!</a>
	</form>
</body>
</html>