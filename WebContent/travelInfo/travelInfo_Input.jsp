<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="java.sql.*"
	%>
<%
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mysql://localhost:3306/kjtour";
    String DB_USER = "root";
    String DB_PASSWORD = "h99dpu";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    
    		try
    		{
    			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
    			stmt = con.createStatement();
    			
    			//운행 버스 쿼리 검색
    			String query = "SELECT idbus, busModel FROM bus";
    			 
    			rs = stmt.executeQuery(query);
    			
    			//운송 타입 검색
    			query = "SELECT idtravelType, TypeName FROM travelType";
    			
    			rs2 = stmt.executeQuery(query);
 %>
    		 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운행 기록</title>
</head>
<body>
	<FORM action="travelInfo_save_do.jsp" method="post">
		출발지 : <INPUT type ="text" name ="depart" maxlength="20" size="20"><BR>
		도착지 : <INPUT type ="text" name ="arrive" maxlength="20" size ="20"><BR>
		운행 버스 : 
		<select name="driveBusId">
			<option value="">버스 선택</option	>
		<%
			while(rs.next())
			{
		%>
			<option value="<%= rs.getInt(1)%>"><%= rs.getString(2) %></option>
		<%
			}	
		%>	
		</select><BR> 
		운행 상세 : 
		<select name="travelTypeId">
			<option value="">운행 종류</option>
			<%
				while(rs2.next())
				{
			%>
				<option value="<%= rs2.getInt(1) %>"><%= rs2.getString(2) %></option>
			<% 
				}
			%>
		</select>
		<%	
    			rs.close();
				rs2.close();
    	    	stmt.close();
    	    	con.close();
    	    		}catch (SQLException e){
    	    			out.println("err:"+e.toString());
    	    		}
    %>
		<INPUT type="submit" value="저 장">
	</FORM>
</body>
</html>