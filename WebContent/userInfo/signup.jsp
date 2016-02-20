<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 가입 페이지</title>
</head>
<body>
	<FORM action="save_do.jsp" method="post">
	ID : <INPUT type = "text" name="id" maxlength="16" size="8"><BR>
	PW : <INPUT type = "password" name="pwd" maxlength="10" size="8"><BR>
	이름  : <INPUT type = "text" name="name" maxlength="16" size="8"><BR>
	email : <INPUT type = "text" name="email" maxlength="16" size="8"><BR>
	<INPUT type ="submit" value ="저 장">
	</FORM>
</body>
</html>