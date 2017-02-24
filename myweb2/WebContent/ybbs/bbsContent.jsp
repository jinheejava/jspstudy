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
<h2> 자유게시판 본문 보기</h2>
<c:set var="dto" value="${requestScope.content}"/>
	<table border="1" cellspacing="0" width="550">
		<tr>
			<th>번호</th>
			<td>${dto.idx}</td>
			<th>작성 날짜</th>
			<td>${dto.writedate}</td>
		</tr>
		<tr>
			<th> 작성자</th>
			<td>${dto.writer}</td>
			<th> 조회 수</th>
			<td>${dto.readnum}</td>
		</tr>
		<tr>
			<th> 제목</th>
			<td colspan="3" align="left">${dto.subject}</td>
		</tr>
		<tr>
			<td colspan="4" align="left" valign="top">
			${dto.content}
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center"> <a href="javascript:history.back();">목록보기</a></td>
		</tr>
	</table>
</body>
</html>