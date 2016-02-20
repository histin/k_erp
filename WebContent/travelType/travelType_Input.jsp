<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운행 정보</title>
</head>
<body>
	<FORM action="travelType_save_do.jsp" method="post">
		운행 종류 : 
		<select name="incomeType">
			<option value="">운행선택</option>
			<option value="1">운송수입</option>
			<option value="2">기타수입</option>
		</select><BR> 
		운행 상세 :
		 <INPUT type="text" name="TypeName" maxlength="20"size="8"><BR>
		<INPUT type="submit" value="저 장">
	</FORM>
</body>
</html>