<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"
    %>
     <%
    request.setCharacterEncoding("utf-8");
    
    int incomeType  = Integer.parseInt(request.getParameter("incomeType"));
    System.out.println(incomeType);
    String TypeName = request.getParameter("TypeName");
    
    try
    {
    	Class.forName("org.mariadb.jdbc.Driver");
    	Connection con = null;
    
    	String DB_URL ="jdbc:mysql://localhost:3306/kjtour";
    	
    	con = DriverManager.getConnection(DB_URL,"root","h99dpu");
    	
    	String sql = "INSERT INTO travelType(incomeType,TypeName) VALUES(?,?)";
    	
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	
    	pstmt.setInt(1,incomeType);
    	pstmt.setString(2,TypeName);
    	
    	pstmt.executeUpdate();
    	
    	pstmt.close();
    	con.close();
    	
    }
    catch(ClassNotFoundException e)
    {
    	out.println(e);
    }
    catch(SQLException e)
    {
    	out.println(e);
    }
    response.sendRedirect("travelType_List.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>travel_save</title>
</head>
<body>

</body>
</html>