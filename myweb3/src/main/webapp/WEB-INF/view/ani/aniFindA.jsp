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
 	인기검색어 :
 	<c:forEach var="temp" items="${keyword}">
 		${temp} &nbsp;
 	</c:forEach>
	<br>
	<form name="f" action="aniFindB.do">
		<select	name="cate">
			<c:forEach var="op" items="${cate}">
				<option value="${op}">${op}</option>
			</c:forEach>
		</select>
		<input type="text" name="key">
		<input type="submit" value="검색">
	</form>
	<hr>
	실제 컨텐츠가 들어갈 곳~ A페이지의 컨텐트가 있다라고 가정~
</body>
</html>