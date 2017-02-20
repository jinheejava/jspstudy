<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width:250px; height:250px; border: 2px double gray;">
	<h2 style="text-align:center"> 공 지 사 항 </h2>
	<h3> 1. 지각하지 말아요 </h3>
	<h3> 2. 졸지말아요 </h3>
	<h3> 3. 집중하세요 </h3> </div>
	
	<form name="fm" action="popup_ok.jsp">
	<input type="checkbox" name="popupck" value="on"> 오늘 하루 안보기  <!-- 체크박스 체크할 경우 on 값이 넘어감 -->
	<input type="submit" value="닫기">
	</form>	
</body>
</html>