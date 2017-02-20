<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> paramTest3.jsp </h1>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
%>

<h4> 이름 : <%= name %></h4>
<h4> 나이 : <%= age %></h4>
<h4> 주소 : <%= addr %></h4>
<h4> 전화번호 : <%= tel %></h4>

</body>
</html>

<!-- 데이터를 전달시킬 경우, 내 다음 페이지까지만 전달되는 것을 확인할 수 있는 실습 -->