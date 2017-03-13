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
<h2> mvc적용 게시판</h2>
<table border="1" cellspacing="0" width="550">
	<thead>
		<tr>
			<th> 번호</th>
			<th> 제목</th>
			<th> 작성자</th>
			<th> 조회수</th>
		</tr>
	</thead> 
	<tbody>
		<c:set var="dtos" value="${requestScope.arr}"/>
		<c:if test="${empty dtos}">
			<tr>
				<td colspan="4" align="center"> 등록된 게시글이 없습니다 </td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td>${dto.idx}</td>
				<td>
					<c:url var="contentUrl" value="bbsContent.yong">
						<c:param name="idx">${dto.idx}</c:param>
					</c:url>
					<a href="${contentUrl}">${dto.subject}</a></td>
					<!-- <a href="bbsContent.yong?idx=${dto.idx}"> 
											    파라미터 값이 많아지면 오타가 날 수가 있음 -->
				<td>${dto.writer}</td>
				<td>${dto.readnum}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<td colspan="3" align="center"> ${requestScope.pageStr} </td>
		<td> <a href="bbsWriteForm.yong">글쓰기</a> </td>
	</tfoot>
</table>
</body>
</html>