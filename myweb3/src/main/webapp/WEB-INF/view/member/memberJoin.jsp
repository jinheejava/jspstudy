<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function idCheck(){
		window.open('idCheck.do','idCheck','width=350 height=150');	
	}	
</script>
<body>
<h2> 회원가입 </h2>
<form name="memberJoin" action="memberJoin.do" method="post">
	<fieldset style="width:350px;">
	<legend> 회원가입</legend>
		<ul>
			<li> ID: <input type="text" name="id" readonly><input type="button" value="중복검사" onclick="idCheck()"></li>
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