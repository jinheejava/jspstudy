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
<form name="bbsContent" action="bbsContent.jin">
	<h2> 본문보기</h2>
	<c:set var="dto" value="${requestScope.dto}"/>
	
	<table border="1" cellspacing="0" width="550">		
		<thead>
			<tr>
				<th> 제목 </th>
				<td> ${dto.subject}</td>
				<th> 작성자 </th>
				<td> ${dto.writer} </td>				
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="4"> <textarea name="content" cols="75" rows="20" readonly="readonly">
					${dto.content}
					</textarea> </td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" align="right"> <input type="button" value="돌아가기" onclick="javascript:history.back()"></td>
			</tr>
		</tfoot>
	</table>

</form>

</body>
</html>