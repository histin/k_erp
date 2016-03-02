<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%
    request.setCharacterEncoding("utf-8");
    
    String checkId  = request.getParameter("inputId");
    String checkPassword = request.getParameter("inputPassword");
	
    response.sendRedirect("./home.html");	
   	return; 
	
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
    			
    			String query = "SELECT userId, password FROM user";
    			
    			rs = stmt.executeQuery(query);
    			
    			
    			
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K-ERP | 로그인 체크</title>
</head>
<body>
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