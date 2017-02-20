<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function idCheckOpen(){
		window.open('idCheckForm.jin','idCheck','width=350, height=100');		
	}
</script>
</head>
<body>
<form name="join" action="memJoin.jin">
	<fieldset>
	<legend> 회원가입</legend>
		<ul>
			<li> ID: <input type="text" name="id" readonly> <input type="button" value="중복확인" onclick="idCheckOpen()"></li>
			<li> PWD: <input type="password" name="pwd"> </li>
			<li> 이름: <input type="text" name="name"> </li>
			<li> TEL: <input type="text" name="tel"> </li>
			<li> 주소: <input type="text" name="addr"> </li>
		</ul>
		<p>
			<input type="submit" value="회원가입">
			<input type="reset" value="다시작성">
		</p>
	</fieldset>
</form>
</body>
</html>