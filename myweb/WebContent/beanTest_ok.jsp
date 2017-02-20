<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> beanTest_ok.jsp </h2>

<%
	request.setCharacterEncoding("utf-8");
%>

<% /*
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	*/
%>

<jsp:useBean id="btest" class="jin.bean.BeanTest"/>

<jsp:setProperty property="*" name="btest"/>

<h3>이름: <jsp:getProperty property="name" name="btest"/> <br>
나이 : <jsp:getProperty property="age" name="btest"/> <br>
주소 : <jsp:getProperty property="addr" name="btest"/> <br>
전화번호: <jsp:getProperty property="tel" name="btest"/> </h3>

<!-- 폼에 있는 정보와 DTO의 정보가 (변수이름,타입..) 모두 일치할경우 값을 받아오고 저장하는 과정(+파싱과정까지)을 생략할 수 있다. -->
</body>
</html>