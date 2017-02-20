<%@page import="java.util.ArrayList"%>
<%@page import="jin.emp.model.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jin.emp.model.EmpDTO"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="empUpdate2" action="empUpdate.jin">
	<fieldset>
		<legend> 사원 정보 </legend>
		<table>
			<thead>
				<tr>
					<th> 사원 번호: </th>
					<th> 사원 이름: </th>
					<th> E-Mail: </th>
					<th> 부서: </th>
				</tr>
			</thead>
			<tbody>
				<%
					EmpDTO dto = (EmpDTO)request.getAttribute("dto");
				%>
					<tr>
						<td><input type="text" name="idx" value="<%= dto.getIdx() %>"></td>
						<td><input type="text" name="name" value="<%= dto.getName() %>"></td>
						<td><input type="text" name="email" value="<%= dto.getEmail() %>"></td>
						<td><input type="text" name="dept" value="<%= dto.getDept() %>"></td>
					</tr>
			</tbody>
		</table>
		<p>
		<input type="submit" value="수정하기">
		</p>
	</fieldset>
</form>
</body>
</html>