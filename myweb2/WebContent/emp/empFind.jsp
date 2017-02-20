<%@ page import="java.util.ArrayList"%>
<%@ page import="jin.emp.model.EmpDTO"%>
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
	<h2> 사원 검색 </h2>
	<table border="1" cellspacing="0" width="450">
		<thead>
		<tr>
			<th> 사원 번호 </th>
			<th> 사원 이름 </th>
			<th> E-mail</th>
			<th> 부서 </th>
		</tr>
		</thead>
		<tbody>
		<c:set var="arr" value="${requestScope.arr}"/>
		
		<c:if test="${empty arr}">
			<tr>
				<td colspan="4" align="center"> 검색하신 사원이 없습니다 </td>
			</tr>
		</c:if>
		
		<c:forEach var="arr2" items="${arr}" >
			<tr>
				<td>${arr2.idx}</td>
				<td>${arr2.name}</td>
				<td>${arr2.email} </td>
				<td>${arr2.dept} </td>
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