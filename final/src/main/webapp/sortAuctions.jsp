<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Sort Auctions</title>
	<style>
			body {
			margin: 0;
			}
		</style>
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return
		to account page</button>
	<h2>List of all open auctions.</h2>
	<p>Sort by different parameters available</p>
	<p>Bid on item or view bid history for that auction</p>
	<div id="buttons">
		<form action='sortAuctionsHandler.jsp'>
			
			<label for="sortAuctions">Sort Auctions By</label> <select name="sortAuctions"
				required>
				<option value="Sort by Auction ID" selected>Auction ID</option>
				<option value="Sort by Category"> Category</option>
				<option value="Sort by Brand">Brand</option>
				<option value="Sort by Gender">Gender</option>
				<option value="Sort by Color">Color</option>
				<option value="Sort by Price">Price</option>
				<option value="Sort by End Time">End Times</option>
			</select>
			
			<label for="orderBy">Order By</label> <select name="orderBy"
				required>
				<option value="ascending" selected>Ascending</option>
				<option value="descending">Descending</option>
			</select>
			<input type="submit" value="Sort Auctions" />
		</form>
		
	</div>

	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	String seller = session.getAttribute("user").toString();
	ResultSet result = null;
	try {
		String str = "select * from auction join product using (product_id) where status = 'open' order by (auction_id);";
		result = stmt.executeQuery(str);

		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID ");
		out.print("</th>");
		out.print("<th>");
		out.print("Category");
		out.print("</th>");
		out.print("<th>");
		out.print("Brand");
		out.print("</th>");
		out.print("<th>");
		out.print("Color");
		out.print("</th>");
		out.print("<th>");
		out.print("Gender");
		out.print("</th>");
		out.print("<th>");
		out.print("Seller");
		out.print("</th>");

		out.print("<th>");
		out.print("Current Bid");
		out.print("</th>");

		out.print("<th>");
		out.print("Price");
		out.print("</th>");

		out.print("<th>");
		out.print("New Bid Increment");
		out.print("</th>");

		out.print("<th>");
		out.print("End Time");
		out.print("</th>");

		while (result.next()) {
			String status1 = result.getString("status");

			out.print("<tr>");
			out.print("<td>");
			out.print(result.getInt("auction_id"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("category"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("brand"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("color"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("gender"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getString("seller"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getFloat("current_bid"));
			out.print("</td>");

			out.print("<td>");
			out.print("$" + result.getFloat("price"));
			out.print("</td>");

			out.print("<td>");
			out.print("$" + result.getFloat("new_bid_increment"));
			out.print("</td>");

			out.print("<td>");
			out.print(result.getTimestamp("end_date"));
			out.print("</td>");

			if (!status1.equals("close") && result.getString("seller").equalsIgnoreCase(seller) == false) {
		out.print("<td>");
		out.print("<form action='bidOnItem.jsp' method='post'><button name='auction_id' type='submit' value='"
				+ result.getInt("auction_id") + "'> Bid on Item </button></form>");
		out.print("</td>");
			}

			out.print("<td>");
			out.print("<form action='bidHistory.jsp' method='post'><button name='auction_id' type='submit' value='"
			+ result.getInt("auction_id") + "'> View Bid History </button></form>");
			out.print("</td>");

			out.print("<td>");
			out.print("<form action='viewSimilarItems.jsp' method='post'><button name='auction_id' type='submit' value='"
			+ result.getInt("auction_id") + "'> View Similar Items </button></form>");
			out.print("</td>");

			out.print("</tr>");
		}
		out.print("</table>");
	} catch (Exception e) {
		out.print(e);
	} finally {
		if (result != null)
			result.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	%>
</body>
</html>

