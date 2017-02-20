<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Document </title>
<link rel="stylesheet" type="text/css"
href="../css/mainLayout.css">
<style>
	section li{
		list-style-type: none;
	}
	label{
		width: 100px;
		float: left;
	}	
</style>
	<script>
		function openIdCheck(){
			window.open('idCheck.jsp','idCheck','width=350, height=100');
		}
	</script>
</head>
<body>
<%@ include file="../header.jsp" %> <!-- HTML : / = myweb -->

<section>
	<article>
	<h2> 회 원 가 입</h2>
	<fieldset>
	<legend> 입력 사항 </legend>
		<form name="join" action="join_ok.jsp" method="post">
			<ul>
				<li><label> ID </label>
					<input type="text" name="id" readonly>
					<input type="button" value="중복검사" onclick="openIdCheck()"></li>
				<li><label> 비밀번호 </label>
					<input type="password" name="pwd"></li>
				<li><label> 이름 </label>
					<input type="text" name="name"></li>
				<li><label> 전화번호 </label>
					<input type="text" name="tel"></li>
				<li><label> 주소 </label>
					<input type="text" name="addr"></li>			
			</ul>
			<p>
				<input type="submit" value="회원가입">
				<input type="reset" value="다시작성">
			</p>
			
		</form>
	</fieldset>
	</article>
</section>

<%@ include file="../footer.jsp" %>
</body>
</html>