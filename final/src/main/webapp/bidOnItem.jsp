<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid on Item</title>
</head>
<body>
	<button onclick="window.location.href='sortAuctions.jsp';">Return Auctions Page </button>

<h2> Bid on this Item!</h2>
	<%
	int auctionID = Integer.parseInt(request.getParameter("auction_id"));
	session.setAttribute("auction_id", auctionID);

	out.print("<form method='post' action='checkAutoBid.jsp'>");

	out.print("<table>");

	out.print("<tr>");
	out.print("<td>The entries are required if '**' is present</td>");
	out.print("</tr>");

	out.print("<tr>");

	out.print("<td><label for='autobid_bool'>**Set Autobidding?</label>");

	out.print("<select name='autobid_bool'>");
	out.print("<option value='yes'>yes</option>");
	out.print("<option value='no'>no</option>");

	out.print("</select>");
	
	out.print("</td>");

	out.print("</tr>");
	

	out.print("</table>");
	out.print("<input type='submit' value='Submit Bid!'>");
	out.print("</form>");
	%>
</body>
</html>