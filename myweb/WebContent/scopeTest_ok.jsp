<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="stest" class="jin.bean.ScopeTest"
scope="application"/>
<h3 style="color:purple;"> count의 값 :
<jsp:getProperty property="count" name="stest"/> </h3>
<a href="scopeTest.jsp"> 이전 페이지로... </a>

</body>
</html>