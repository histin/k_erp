<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- This document version is HTML5 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원 데이터 입력</title>
</head>
<body>
	<FORM action="member_save_do.jsp" method="post">
		이 름 : <INPUT type="text" name="memberName" maxlength="10" size="20"><BR>
		나 이 : <INPUT type="text" name="memberAge" maxlength="3" size="20"><BR>
		연락처 : <INPUT type="text" name="memberContact" maxlength="13" size="20"><BR>
		주 소 : <INPUT type="text" name="memberAddress" maxlength="10" size="20"><BR>
		입사날짜 : <input name="workStart" type="date">

		<BR> <INPUT type="submit" value="저 장">
	</FORM>
</body>
</html>