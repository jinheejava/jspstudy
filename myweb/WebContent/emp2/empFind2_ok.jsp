<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="jin.emp.*"%>
<jsp:useBean id="edao" class="jin.emp.EmpDAO"/>

<% String name = request.getParameter("name"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="../css/mainLayout.css">
<style>
	h2{
		text-align: center;
		color: black;
	}
	table{
		margin: 0px auto;
		border-spacing: 0px;
		width: 450px;
		border-top: 2px double black;
		border-bottom: 2px double black;
	}
	table thead th{
		background-color: #cdbea9;
	}
	table tbody td{
		text-align: center;
	}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<section>
	<article>
		<h2> 사원 검색 </h2>
		<table>
		  <thead>
			<tr>
				<th> 사원번호 </th>
				<th> 사원이름 </th>
				<th> E-mail</th>
				<th> 부서명 </th>				
		  	</tr>
		  </thead>
		  <tbody>
		  <%		  
		  	EmpDTO dtos[] = edao.empFind(name);
		  
		  	if(dtos==null||dtos.length==0){
		  		%>
		  		<tr>
		  			<td colspan="4" align="center"> 
		  			등록된 사원이 없습니다 </td>
		  		</tr>
		  		<%
		  	} else {
		  		for(int i=0; i<dtos.length;i++){
		  			%>
		  			<tr>
		  				<td> <%= dtos[i].getIdx() %> </td>
		  				<td> <%= dtos[i].getName() %> </td>
		  				<td> <%= dtos[i].getEmail() %> </td>
		  				<td> <%= dtos[i].getDept() %> </td>
		  			</tr>
		  			<%
		  		}
		  	}
		 
		  %>
		  </tbody>
		</table>
	</article>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>
