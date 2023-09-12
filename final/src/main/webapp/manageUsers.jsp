<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
</head>
<body>
	<button onclick="window.location.href='customerRepHomepage.jsp';">Return to account page</button><br>
	<h3>Manage User Accounts</h3>
	<form>
		<input type="text" name="search" placeholder="username">
		<button type="submit">Search</button>
	</form>

	<%
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String entity = request.getParameter("search");
		String str = "SELECT * FROM account WHERE username LIKE'%" + entity
		+ "%' AND username NOT IN (SELECT username FROM admin) AND username NOT IN(SELECT username FROM customerrep)";
		ResultSet result = stmt.executeQuery(str);

		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		out.print("<td>");
		out.print("Name");
		out.print("</td>");
		out.print("<td>");
		out.print("Email");
		out.print("</td>");
		out.print("</tr>");
		while (result.next()) {
			
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("username"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("name"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("email"));
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form action='editUser.jsp' method='post'><button name='username' type='submit' value='"
			+ result.getString("username") + "'>Edit User</button></form>");
			out.print("</td>");

			out.print("<td>");
			out.print("<form action='deleteUser.jsp' method='post'> <button name = 'username' type = 'submit' value='"
					+ result.getString("username") + "'>Delete</button></form>");
			out.print("</td>");
			

			out.print("</tr>");

	}

	out.print("</table>");
	con.close();

	} catch (Exception e) {
	}
	%>

</body>
</html>