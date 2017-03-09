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
	<h2> 사원관리 프로그램 </h2>
	<hr>
	<h3> 사원등록 </h3>
	<form name="empAdd" action="empAdd.do">
		<fieldset>
			<legend> 사원등록 </legend>
			<table border="1" cellspacing="0" width="300">
				<tr>
					<th> 사원 이름</th>
					<td> <input type="text" name="name"></td>
				</tr>
				<tr>
					<th> E-mail</th>
					<td> <input type="text" name="email"></td>
				</tr>
				<tr>
					<th> 부서</th>
					<td> <input type="text" name="dept"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"> <input type="submit" value="사원등록">
						<input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<hr>
	
	<h3> 사원삭제 </h3>
	<fieldset>
	<legend>사원삭제</legend>
		<form name="empDel" action="empDel.do">
			사원 이름: <input type="text" name="name"> <input type="submit" value="삭제하기">
		</form>
	</fieldset>
	<hr>
	
	<h3><a href="empList.do">모든 사원 내역보기</a></h3>
	<hr>
	
	<h3> 사원 검색 </h3>
	<fieldset>
		<legend>사원 검색</legend>
		<form name="empFind" action="empFind.do">
			사원 이름: <input type="text" name="name"> <input type="submit" value="검색하기">
		</form>
		<hr>
		<c:set var="findname" value="${param.name}"/>
		
		<c:choose>
			<c:when test="${empty findname}">
				<h4>사원을 검색해주세요</h4>
			</c:when>
			<c:otherwise>
				<c:set var="findlist" value="${empFindList}"/>	
				<table border="1" cellspacing="0" width="350">
					<thead>
						<th> 사원번호</th>
						<th> 사원이름</th>
						<th> E-mail</th>
						<th> 부서명</th>
					</thead>
					<tbody>
						<c:if test="${empty findlist}">
							<tr>
								<td colspan="4" align="center"> 검색하신 사원이 없습니다 </td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${findlist}">
							<tr>
								<td>${dto.idx}</td>
								<td>${dto.name}</td>
								<td>${dto.email}</td>
								<td>${dto.dept}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>						
			</c:otherwise>
		</c:choose>		
	</fieldset>	
	<hr>
	
	<h3> 사원 수정하기 </h3>
	<fieldset>
		<legend> 사원정보 수정 </legend>
		<form name="empUpdateForm" action="empUpdateFind.do">
			사원 번호: <input type="text" name="idx"> <input type="submit" value="검색하기">
		</form>
			<hr>
			<c:set var="findidx" value="${param.idx}"/>
			
			<c:choose>
				<c:when test="${empty findidx}">
					<h4> 사원을 검색해주세요 </h4>
				</c:when>
				<c:otherwise>
					<form name="empUpdate" action="empUpdate.do">
						<input type="hidden" name="idx" value="${findidx}">
						<c:set var="dto" value="${empUpdateFind}"/>
						
						<c:if test="${empty dto}">
							검색하신 사원이 없습니다
						</c:if>
						
						<c:forEach var="dtos" items="${dto}">					
							<table border="1" cellspacing="0" width="300">
								<tr>
									<th> 이름:</th>
									<td> <input type="text" name="name" value="${dtos.name}"></td>
								</tr>
								<tr>
									<th> E-mail:</th>
									<td> <input type="text" name="email" value="${dtos.email}"></td>
								</tr>
								<tr>
									<th> 부서:</th>
									<td> <input type="text" name="dept" value="${dtos.dept}"></td>
								</tr>
								<tr>
									<td colspan="2"> <input type="submit" value="수정하기">
											<input type="reset" value="다시작성"> </td>
								</tr>
							</table>
						</c:forEach>
					</form>			
				</c:otherwise>
			</c:choose>		
	</fieldset>
	
	





































</body>
</html>