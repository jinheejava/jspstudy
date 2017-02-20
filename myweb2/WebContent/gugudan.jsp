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
<c:forEach var="j" begin="1" end="9" step="1">
	<c:forEach var="i" begin="2" end="9" step="1">
		<c:if test="${i==2}">
			<br>
		</c:if>
		  ${i}*${j}=${i*j} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
	</c:forEach>
</c:forEach>

</body>
</html>