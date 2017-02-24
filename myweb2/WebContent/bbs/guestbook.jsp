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
<form name="guestbook">
	<h2> 방명록 </h2>
	<br>
	<div style="text-align:right;">
		<input type="button" onclick="location='bbsWriteForm.jin'" value="글쓰기">
	</div>
	<hr>
<c:set var="arr" value="${requestScope.arr}"/>
	<table>
		<c:forEach var="dtos" items="${arr}">
			<tr>
				<th> 작성자 </th>
				<td colspan="2"> ${dtos.writer}</td>
				<td style="text-align:right;"> ${dtos.writedate} &nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4">
				<textarea rows="10" cols="75" readonly>${dtos.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" height="20"> </td>
			</tr>
		</c:forEach>
	</table>
</form>

</body>
</html>