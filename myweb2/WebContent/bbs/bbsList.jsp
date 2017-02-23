<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{
		text-align:center;
	}
	.sub{
		text-align:left;
	}
	.button{
		text-align:right;
	}
</style>
</head>
	<c:set var="pagesize" value="${requestScope.pagesize}"/>
	<c:set var="totalpage" value="${requestScope.totalpage}"/>
	<c:set var="usergroup" value="${requestScope.usergroup}"/>		
<body>
<form name="bbs">
	<h2>게시판</h2>
		<table border="1" cellspacing="0" width="550" height="300">
			<thead>
				<tr>
					<th> NO.</th>
					<th> 제목</th>
					<th> 글쓴이</th>
					<th> 조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="arr" value="${requestScope.arr}"/>
		
			<c:if test="${empty arr}">
				<tr>
					<td colspan="4" align="center"> 등록된 게시글이 없습니다 </td>
				</tr>
			</c:if>
			
			<c:forEach var="dtos" items="${arr}">
				<tr>
					<td>${dtos.idx}</td>
					<td class="sub"><a href="bbsContentForm.jin?contentidx=${dtos.idx}">${dtos.subject}</a></td>
					<td>${dtos.writer}</td>
					<td>${dtos.readnum}</td>
				</tr>
			</c:forEach>				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<c:if test="${usergroup!=0}">
					<a href="bbsList.jin?cp=${(usergroup-1)*pagesize+pagesize}"> &lt;&lt;</a> </c:if>
					
					<c:forEach var="page" begin="${usergruop*pagesize+1}" end="${usergroup*pagesize+pagesize}" step="1">
					&nbsp;&nbsp;&nbsp; <a href="bbsList.jin?cp=${page}"> ${page}</a> &nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					
					<c:if test="${usergroup!=((totalpage/pagesize)-(totalpage%pagesize==0?1:0)) } }">
					<a href="bbsList.jin?cp=${(usergroup+1)*pagesize+1}"> &gt;&gt;</a></c:if>
					</td>
				</tr>
				<tr>
					<td class="button" colspan="4"> <a href="bbsWriteForm.jin">글쓰기</a></td>
				</tr>
			</tfoot>
		</table>
</form>

</body>
</html>