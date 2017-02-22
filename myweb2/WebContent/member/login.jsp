<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="login" action="login.jin">
	<fieldset>
	<legend> 로그인 </legend>
	<!-- 강사님 코드 -->
		<table>
			<tr>
				<th> ID </th>
				<td> <input type="text" name="userid" value="${cookie.saveid.value}"> </td>
				<!-- cookie.saveid 까지만 입력하면 saveid라는 값을 가진 객체를 지정하게 되는 것이기 때문에 value까지 적어주어야 한다 -->
			</tr>
			<tr>
				<th> PWD </th>
				<td> <input type="password" name="userpwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="checkbox" name="saveid" value="on" ${empty cookie.saveid.value?'':'checked'}> ID 기억하기
				<input type="submit" value="Login"></td>
			</tr>
		</table>
	<!-- 내코드
		ID : <input type="text" name="id"> <br>
		PWD : <input type="password" name="pwd">
	</fieldset>
	<p>
		<input type="checkbox" value="checked"> ID 기억하기
		<input type="submit" value="로그인">
	</p>
	-->
	</fieldset>
</form>

</body>
</html>