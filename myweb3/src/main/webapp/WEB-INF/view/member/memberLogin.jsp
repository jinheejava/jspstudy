<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="login" action="login.do" method="post">
	<fieldset>
		<legend> 로그인 </legend>
		Id : <input type="text" name="id" value="${cookie.saveid.value}"> <br>
		Pwd : <input type="password" name="pwd">
	</fieldset>
	<p>
		<input type="checkbox" name="saveid" value="checked" ${empty cookie.saveid.value?'':'checked'}> ID 기억하기 
		<input type="submit" value="로그인">
	</p>
</form>
</body>
</html>