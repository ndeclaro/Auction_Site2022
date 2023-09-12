<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Bids</title>
</head>
<body>
	<% 	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	ResultSet result = null;
	PreparedStatement ps = null;
	float current_bid =0;
	String name = "";
	String str ;
	try
	{
		int bid_id = Integer.parseInt(request.getParameter("bid_id")); 
		
		String delete = "DELETE FROM bid WHERE bid_id =" + bid_id;
        stmt.executeUpdate(delete);
    	
    	int auction_id = Integer.parseInt(session.getAttribute("auction_id").toString());
    	
    	String str2 = "select max(amount) from bid where auction_id = ?";
    	PreparedStatement ps3 = con.prepareStatement(str2);
    	ps3.setInt(1,auction_id);
    	ResultSet result2 = ps3.executeQuery();
    	if(result2.next())
    	{
    	current_bid = result2.getFloat("max(amount)");
    	}

    	if(current_bid == 0){
    		name = "";
    	}
    	else{
   		 	str = "SELECT buyer from bid join auction using (auction_id) where amount = ? and auction_id = ?"; //get the max bid for our current auction
    		ps = con.prepareStatement(str);
    		ps.setFloat(1, current_bid);
    		ps.setInt(2, auction_id);
    		ResultSet result3 = ps.executeQuery();
    		result3.next();
    		name = result3.getString("buyer");
		}
	
    	str = "UPDATE auction a SET a.current_bid=? , a.winner=? where a.auction_id = ?";
    	ps = con.prepareStatement(str);
    	ps.setString(2, name);
    	ps.setFloat(1, current_bid);
    	ps.setInt(3, auction_id);
    	ps.executeUpdate();
    	
  		
    	
		response.sendRedirect("manageAuctionsCustomerRep.jsp");		
	}		
	
	catch (Exception e) 
	{
			out.print(e);
	}
	finally
	{
		if (result != null) result.close();
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}%>

</body>
</html>
