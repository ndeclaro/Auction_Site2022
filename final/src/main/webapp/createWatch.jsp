<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Watch</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
   	<button onclick="window.location.href='account.jsp';">Return to Homepage</button>
   	<h2> Create a new auction</h2>
	<div class="content">
		<form action="checkCreateWatch.jsp" method="POST">
			<label for="category">Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="Tops">Tops</option>
				<option value="Bottoms">Bottoms</option>
				<option value="Shoes">Shoes</option>
			</select> <br>
			<table>
				<tr>
					<td>Brand:</td>
					<td><input type="text" name="brand" required></td>
				</tr>
				<tr>
					<td>Color:</td>
					<td><input type="text" name="color" required></td>
				</tr>
				<tr>
					<td>Gender:</td>
					<td><input type="text" name="gender" required></td>
				</tr>
				<tr>
			</table>
			<input type="submit" value="Create Auction">
		</form>
	</div>
</body>
</html>
