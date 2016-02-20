<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
    
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mysql://localhost:3306/kjtour";
    String DB_USER = "root";
    String DB_PASSWORD = "h99dpu";
    
    Connection con = null;
    		Statement stmt = null;
    		ResultSet rs = null;
    		
    		try
    		{
    			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
    			stmt = con.createStatement();
    			
    			String query = "SELECT idtravelType, incomeType, TypeName FROM travelType";
    			
    			rs = stmt.executeQuery(query);
    		
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운행 리스트</title>
</head>
<body>
<table border="1" cellspacing="0">
	<tr>
		<td>번호</td>
		<td>운송종류</td>
		<td>운송상세</td>
		<td>비고</td>
	</tr>
	<%
    	while(rs.next())
    	{
    		
    		int incomeType = rs.getInt("incomeType");
    		String inType = null;
    		switch(incomeType)
    		{
    		case 1 :
    			inType = "운송수입";
    		break;
    		case 2 :
    			inType = "기타수입";
    		break;
    		}
    %>
	<tr>
		<td><%= rs.getInt("idtravelType") %></td>
		<td><% out.print(inType); %></td>
		<td><%= rs.getString("TypeName")%></td>
	</tr>
	<%
    	}//while end
    %>
</table>
<%
    	rs.close();
    	stmt.close();
    	con.close();
    		}catch (SQLException e){
    			out.println("err:"+e.toString());
    		}
    		
    %>
</body>
</html>