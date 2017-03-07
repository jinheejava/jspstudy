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
	<h2> 현재 페이지는 aniFindB.jsp 입니다 </h2>
</body>
</html>