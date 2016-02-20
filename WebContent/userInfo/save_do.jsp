<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
    <%
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    try
    {
    	Class.forName("org.mariadb.jdbc.Driver");
    	Connection con = null;
    
    	String DB_URL ="jdbc:mysql://localhost:3306/kjtour";
    	
    	con = DriverManager.getConnection(DB_URL,"root","h99dpu");
    	
    	String sql = "INSERT INTO user(userId,password,userName,email) VALUES(?,?,?,?)";
    	
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	
    	pstmt.setString(1,id);
    	pstmt.setString(2,pwd);
    	pstmt.setString(3,name);
    	pstmt.setString(4,email);
    	
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
    response.sendRedirect("userList.jsp");
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