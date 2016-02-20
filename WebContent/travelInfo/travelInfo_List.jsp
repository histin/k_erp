<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
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
    			
    			String query = "SELECT a.idtravelInfo, a.depart, a.arrive, b.busModel, c.memberName, d.TypeName FROM travelInfo a INNER JOIN bus b ON a.driveBusId = b.idbus INNER JOIN member c ON b.busDriverId = c.idmember INNER JOIN travelType d ON a.travelTypeId = d.idtravelType;";
    			
    			rs = stmt.executeQuery(query);
    		
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellspacing="0">
	<tr>
		<td>번호</td>
		<td>출발지</td>
		<td>도착지</td>
		<td>배정버스</td>
		<td>배정기사</td>
		<td>운행종류</td>
		<td>비고</td>
	</tr>
	<%
		while(rs.next())
		{
	%>
	<tr>
		<td><%= rs.getInt("a.idtravelInfo") %></td>
		<td><%= rs.getString("a.depart") %></td>
		<td><%= rs.getString("a.arrive") %></td>
		<td><%= rs.getString("b.busModel")%></td>
		<td><%= rs.getString("c.memberName")%></td>
		<td><%= rs.getString("d.TypeName")%></td>
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