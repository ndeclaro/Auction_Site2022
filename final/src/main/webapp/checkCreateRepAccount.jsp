<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Customer Rep Account Check Details</title>
</head>
<body>
<jsp:include page="checkWinner.jsp" />
	<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String account_type = request.getParameter("account_type");
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();

	ResultSet rs = null;
	rs = stmt.executeQuery("select * from customerrep where username='" + userid + "'");
	if (rs.next()) {
		out.println("Username exists, please try another <a href='createRepAccount.jsp'>try again</a>");
	} else {
		int x = stmt.executeUpdate("insert into account values('" + userid + "', '" + pwd + "', '" + address + "', '"
		+ email + "', '" + name + "', '" + account_type + "')");
		int y = stmt.executeUpdate("insert into customerrep values('" + userid + "', '" + pwd + "')");
		session.setAttribute("account_type", account_type);
		out.println("Customer Representative account created");
		out.println("<br><a href = 'adminPage.jsp'>Go back to homepage</a>");
	}
	%>

</body>
</html>