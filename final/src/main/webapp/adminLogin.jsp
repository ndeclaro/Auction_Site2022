<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Page</title>
</head>
<body>
<h2>Admin Login</h2>
	<form action="checkAdminLogin.jsp" method="POST">
		Username: <input type="text" name="username" /> <br /> Password: <input
			type="password" name="password" /> <br /> <input type="submit"
			value="Submit" />
	</form>

</body>
</html>