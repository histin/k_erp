<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.sql.*"
	import="java.text.SimpleDateFormat"
	import="java.util.Date"
	%>

	<%
	request.setCharacterEncoding("utf-8");
    
    String memberName  = request.getParameter("memberName");
    int memberAge = Integer.parseInt(request.getParameter("memberAge"));
    String memberContact = request.getParameter("memberContact");
    String memberAddress = request.getParameter("memberAddress");
    String Startwork = request.getParameter("workStart");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date workStart = sdf.parse(Startwork);
    java.sql.Date workStart2 = new java.sql.Date(workStart.getTime());
    try
    {
    	Class.forName("org.mariadb.jdbc.Driver");
    	Connection con = null;
    
    	String DB_URL ="jdbc:mysql://localhost:3306/kjtour";
    	
    	con = DriverManager.getConnection(DB_URL,"root","h99dpu");
    	
    	String sql = "INSERT INTO member(memberName, memberAge, memberContact, memberAddress, workStart) VALUES(?,?,?,?,?)";
    	
    	PreparedStatement pstmt = con.prepareStatement(sql);
    	
    	pstmt.setString(1, memberName);
    	pstmt.setInt(2, memberAge);
    	pstmt.setString(3, memberContact);
    	pstmt.setString(4, memberAddress);
    	pstmt.setDate(5, workStart2);
    	
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
    response.sendRedirect("memberList.jsp");
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