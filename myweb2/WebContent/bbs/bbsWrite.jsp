<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="bbsWrite" action="bbsWrite.jin">
	<h2> 글쓰기 </h2>
	<table border="1" cellspacing="0" width="550">
		<tr>
			<th> 작성자</th>
			<td> <input type="text" name="writer"></td>
			<th> 비밀번호</th>
			<td> <input type="password" name="pwd"></td>
		</tr>
		<tr>
			<th> 제목</th>
			<td colspan="3"> <input type="text" name="subject" size="65"></td>
		</tr>				
		<tr>
			<td colspan="4"><textarea name="content" cols="75" rows="20"></textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="center"> <input type="button" value="돌아가기" onclick="javascript:history.back()">
			<input type="submit" value="글쓰기"> <input type="reset" value="다시작성"></td>
		</tr>
		</table>
		
</form>

</body>
</html>