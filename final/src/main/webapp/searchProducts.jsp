<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Products</title>
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return to home dashboard</button>

	<h3>Search Clothing Based on  Keywords</h3>
	<form action = 'searchProductsHandler.jsp' method ='post'>
		<input type="text" name="search" placeholder="search clothes">
		<button type="submit">Search</button>
	</form>
</body>
</html>