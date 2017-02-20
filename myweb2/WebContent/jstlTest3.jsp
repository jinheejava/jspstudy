<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String fruit[] = {"사과","배","포도","딸기","바나나"}; %>
<c:set var="f" value="<%= fruit %>"/>
<ul>
	<c:forEach var="temp" items="${f}">
		<li> ${temp}</li>
	</c:forEach>
</ul>

<c:forEach var="i" begin="1" end="10" step="1">
	${i} &nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>

<hr>
<c:forTokens var="i" items="거북이,토끼,당근,당나귀,짐" delims=",">
	${i} &nbsp;&nbsp;&nbsp;&nbsp;
</c:forTokens>
</body>
</html>