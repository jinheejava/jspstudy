<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="jin.emp.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> 사원 목록 </h2>
	<table border="1" cellspacing="0" width="450">
		<thead>
			<tr>
				<th> 사원번호 </th>
				<th> 사원이름 </th>
				<th> E_mail</th>
				<th> 부서 이름</th>
			</tr>
		</thead>
		<tbody>
		<c:set var="arr" value="${requestScope.dtos}"/>
		<!-- controller에서 dtos 받아오기 -->
		
		<c:if test="${empty arr}">
			<tr>
				<td colspan="4" align="center"> 등록된 사원이 없습니다. </td>
			</tr>		
		</c:if>
		
		<c:forEach var="dto" items="${arr}">
			<tr>
				<td>${dto.idx}</td>
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td>${dto.dept}</td>
				<!-- el에서는 이름만 적어도 자동적으로 get이 붙어 그 값을 가져옴 -->
			</tr>
		</c:forEach>
		
			<%
			/*
				ArrayList<EmpDTO> arr = (ArrayList)request.getAttribute("arr");
			
			
				if(arr==null || arr.size()==0){
					%>
					<tr>
						<td colspan="4"> 검색하신 사원이 없습니다 </td>
					</tr>
					<%
				} else{
					for(int i=0;i<arr.size();i++){
					%>					
					<tr>
						<td><%= arr.get(i).getIdx() %></td>
						<td><%= arr.get(i).getName() %></td>
						<td><%= arr.get(i).getEmail() %></td>
						<td><%= arr.get(i).getDept() %></td>
					</tr>
					<%
					}
				}
			*/
			%>
		
			
		</tbody>
	</table>

</body>
</html>