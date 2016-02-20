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
    			
    			String query = "SELECT idmember, memberName, memberAge, memberContact, memberAddress, workStart, workExpire FROM member";
    			
    			rs = stmt.executeQuery(query);
    		
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원리스트</title>
</head>
<body>
    <table border="1" cellspacing="0">
	<tr>
		<td>번호</td>
		<td>직원이름</td>
		<td>나이</td>
		<td>연락처</td>
		<td>주소</td>
		<td>입사날짜</td>
		<td>퇴사날짜</td>
		<td>비고</td>
	</tr>
	<%
    	while(rs.next())
    	{
    %>
	<tr>
		<td><%= rs.getInt("idmember") %></td>
		<td><%= rs.getString("memberName") %></td>
		<td><%= rs.getInt("memberAge")%></td>
		<td><%= rs.getString("memberContact")%></td>
		<td><%= rs.getString("memberAddress")%></td>
		<td><%= rs.getDate("workStart")%></td>
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