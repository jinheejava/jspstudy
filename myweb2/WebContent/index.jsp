<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function loginOpen(){
		window.open('loginForm.yong','login','width=300, height=150');
	}
	function loginPopOpen(){
		window.open('loginForm.jin','login','width=300, height=150');
	}
</script>
</head>
<body>
	<c:if test="${empty sessionScope.sid}">
		<p><a href="javascript:loginOpen()">로그인(강사님)</a></p>
	</c:if>
	<c:if test="${!empty sessionScope.sid}">
		<p>${sessionScope.sname}님 로그인 중... | <a href="logout.jin">로그아웃</a></p>
	</c:if>
<p>
	<c:choose>
		<c:when test="${empty sessionScope.name}">
			 <a href="javascript:loginPopOpen()">로그인</a> | <a href="member.jin">회원가입</a>
		</c:when>
		<c:otherwise>
			 ${sessionScope.name}님 로그인 중... | <a href="logout.jin">로그아웃</a>
		</c:otherwise>
	</c:choose>		
</p>
<h1> index입니다 </h1>
	<ul>
		<li> <a href="emp.jin">사원관리 프로그램(MVC)</a> </li>
		<li> <a href="member.jin">회원가입</a> </li>
		<li> <a href="member.yong">회원가입(강사님)</a> </li>		
		<li> <a href="memList.jin">회원보기</a> </li>
		<li> <a href="memFind.jin">회원검색</a> </li>
		<li> <a href="memberFind.yong">회원검색(강사님)</a> </li>
		<li> <a href="bbsList.jin">게시판</a> </li>
		<li> <a href="bbsList.yong">게시판(강사님)</a> </li>
		<li> <a href="guestbook.jin">방명록</a> </li>
	</ul>
</body>
</html>