<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
%>
<%
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mysql://localhost:3306/kjtour";
    String DB_USER = "root";
    String DB_PASSWORD = "h99dpu";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    int rowCount=0;
    		try
    		{
    			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
    			stmt = con.createStatement();
    			
    			String query = "SELECT idmember, memberName FROM member";
    			rs = stmt.executeQuery(query);
    			
    		%>
    		 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>버스 정보 입력 페이지</title>
</head>
<body>
	<FORM action="bus_save_do.jsp" method="post">
	버스 모델 : <INPUT type = "text" name="busModel" maxlength="20" size="20"><BR>
	버스 자동차 번호 : <INPUT type = "text" name="busSerial" maxlength="20" size="20"><BR>
	버스 번호판 : <INPUT type = "text" name="busLicense" maxlength="10" size="20"><BR>
	담당 기사 :
	<select name ="busDriver"> 
		<option value="">기사</option>
		<% 
			while(rs.next())
			{		
		%>
			<option value="<%= rs.getInt(1)%>"><%= rs.getString(2) %></option>
			<%
			}
			%>
			
	</select><br>
	<INPUT type ="submit" value ="저 장">
	<%	
    			rs.close();
    	    	stmt.close();
    	    	con.close();
    	    		}catch (SQLException e){
    	    			out.println("err:"+e.toString());
    	    		}
    %>
	</FORM>
</body>
</html>