<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> jstl Test1.jsp</h2>
<!-- 변수선언 -->
<c:set var="num1" value="100"/>
<c:set var="num2"> 200 </c:set>
<h3> num1: ${num1}</h3>
<h3> num2: ${num2}</h3>

<h4>num1+num2= ${num1+num2}</h4>

<% HashMap map = new HashMap(); %>
<c:set var="m" value="<%=map %>"/>
<!-- set태그에는 기본데이터 뿐만이 아니라 객체도 저장이 가능 -->
<c:set target="${m}" property="name" value="홍길동"/>
<c:set target="${m}" property="addr">서울시 강남구</c:set>
<c:set target="${m}" property="user-id" value="hong"/>
<c:remove var="m"/>

<ul>
	<li>이름: ${m.name}</li>
	<li>주소: ${m.addr}</li>
	<li>ID: ${m['user-id']}</li> <!-- . 대신 [] 가능 -->
</ul>






















</body>
</html>