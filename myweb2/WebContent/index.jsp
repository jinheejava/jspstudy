<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function loginOpen(){
		window.open('loginOpen.jin','login','width=300, height=250');
	}
</script>
</head>
<body>
<h1> index입니다 </h1>
	<ul>
		<li> <a href="emp.jin">사원관리 프로그램(MVC)</a> </li>
		<li> <a href="member.jin">회원가입</a> </li>
		<li> <a href="memList.jin">회원보기</a> </li>
		<li> <a href="memFind.jin"> 회원검색</a></li>
		<li> <a href="javascript:loginOpen()">로그인</a> | <a>로그아웃</a></li>
	</ul>
</body>
</html>