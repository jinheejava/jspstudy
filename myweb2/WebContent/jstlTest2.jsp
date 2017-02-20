<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> if 태그 테스트</h3>
<form name="f">
이름: <input type="text" name="name">
<input type="submit" value="전달">
</form>

<hr>
<h4>사용자 이름: ${param.name }</h4>

<c:if test="${empty param.name}">
	<h4 style="color:red;"> 이름을 입력하세요.</h4>
</c:if>
<c:if test="${param.name=='둘리'}">
	<h4 style="color:blue;">둘리는 아기공룡</h4>
</c:if>
<hr>

<c:choose>
	<c:when test="${param.name=='킬러'}">
		<h4 style="color:red;"> 킬러는 접속이 불가합니다</h4>
	</c:when>
	<c:when test="${param.name eq '홍길동'}">
		<h4 style="color:red;"> 홍길동은 접속이 불가능합니다</h4>
	</c:when>
	<c:otherwise>
		<h4 style="color:blue;"> 환영합니다</h4>
	</c:otherwise>
</c:choose>


























</body>
</html>