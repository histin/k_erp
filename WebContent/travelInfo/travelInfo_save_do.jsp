<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String depart = request.getParameter("depart");
    String arrive = request.getParameter("arrive");
    int driveBusId = Integer.parseInt(request.getParameter("driveBusId"));
    int travelTypeId = Integer.parseInt(request.getParameter("travelTypeId"));
    
    try
    {
    	Class.forName("org.mariadb.jdbc.Driver");
    	Connection con = null;
    
    	String DB_URL ="jdbc:mysql://localhost:3306/kjtour";
    	
    	con = DriverManager.getConnection(DB_URL,"root","h99dpu");
    	
    	String sql = "INSERT INTO travelInfo(depart, arrive, driveBusId, travelTypeId) VALUES(?,?,?,?)";
    	
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, depart);
    	pstmt.setString(2, arrive);
    	pstmt.setInt(3, driveBusId);
    	pstmt.setInt(4, travelTypeId);
    	
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
    response.sendRedirect("travelInfo_List.jsp");
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>