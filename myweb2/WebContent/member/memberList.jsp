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
<h2> 회원 보기</h2>
	<table border="1" cellspacing="0" width="450">
		<thead>
			<tr>
				<th> 회원번호 </th>
				<th> ID </th>
				<th> 이름 </th>
				<th> TEL</th>
				<th> 주소</th>
			</tr>
		</thead>
		<tbody>
		<c:set var="arr" value="${requestScope.arr}"/>
		
		<c:if test="${empty arr}">
			<tr>
				<td colspan="4" align="center"> 등록된 회원이 없습니다</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${arr}">
			<tr>
				<td>${dto.idx}</td>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.tel}</td>
				<td>${dto.addr}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>