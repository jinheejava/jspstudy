<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="yong.member.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="memberFindForm" method="post">
	<h2> 회원검색 </h2>
	<hr>
	<fieldset style="width:370px;">
		<select name="key">
			<option value="id"> ID </option>
			<option value="name"> 이름 </option>
		</select>
		<input type="text" name="value">
		<input type="submit" value="검색">		
	</fieldset>
	<hr>
	<c:if test="${requestScope.method=='GET'}">
		<h3> 위 검색란에 검색어를 입력해주세요 </h3>
	</c:if>
	<c:if test="${requestScope.method=='POST'}">
		<table border="1" cellspacing="0" width="450">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 이름</th>
					<th>ID</th>
					<th>가입 날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="arr" value="${requestScope.dtos}"/>
			<!-- 명확성을 위해 requestScope라고 정해주긴 하지만 안써도 가능 -->
			
			<c:if test="${empty arr}">
				<tr>
					<td colspan="4" align="center"> 검색된 회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${arr}">
				<tr>
					<td>${dto.idx}</td>
					<td>${dto.name}</td>
					<td>${dto.id}</td>
					<td>${dto.joindate}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
</form>
</body>
</html>