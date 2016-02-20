<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
    
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
    			
    			String query = "select a.idBus, a.busModel, a.busSerial, a.busLicense, b.memberName FROM bus a INNER JOIN member b ON a.busDriverId = b.idmember Order By idbus ASC;";
    			
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
		<td>버스 모델</td>
		<td>버스 자동차 번호</td>
		<td>버스 번호판</td>
		<td>담당 기사</td>
		<td>비고</td>
	</tr>
	<%
    	while(rs.next())
    	{
    		
    %>
	<tr>
		<td><%= rs.getInt("a.idbus") %></td>
		<td><%= rs.getString("a.busModel") %></td>
		<td><%= rs.getString("a.busSerial")%></td>
		<td><%= rs.getString("a.busLicense")%></td>
		<td><%= rs.getString("b.memberName")%></td>
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