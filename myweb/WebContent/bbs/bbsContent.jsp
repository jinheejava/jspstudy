<%@page import="java.io.Writer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="jin.bbs.*" %>

<jsp:useBean id="bdao" class="jin.bbs.BbsDAO" scope="session"/>

<%
	String idx_s = request.getParameter("idx");
	
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);

	BbsDTO dto = bdao.bbsContent(idx);
	if(dto==null){
		%>
		<script>
			window.alert('잘못된 접근 방식 또는 삭제된 게시글 입니다');
			location.href='bbsList.jsp';
		</script>
		<%
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="/myweb/css/mainLayout.css">
<style>
	h2{
		text-align: center;
	}
	table{
		margin: 0px auto;
		width: 550px;
		cellspacing: 0px;		
	}
	tbody{
		border-top: 2px double black;		
	}
	table th{
		border-bottom: 1px double black;
		background-color: #af9776;
		border-right: 2px solid black;
	}
	table td{
		border-right: 2px solid black;
		border-bottom: 1px double black;	
	}
</style>
<script>
</script>
</head>
<body>
<%@ include file="/header.jsp" %>

<section>
	<article>
	<h2> 본 문 보 기 </h2>
		<table> 
			<thead>	
			<tr>
				<td colspan="4" align="right"> <a href="bbsUpdateWrite.jsp?idx=<%= dto.getIdx()%>&writer=<%= dto.getWriter()%>&subject=<%= dto.getSubject()%>&content=<%= dto.getContent()%>"> 수정하기</a>
				 |<a href="bbsDelete.jsp?idx=<%=dto.getIdx()%>"> 삭제하기</a> </td> 
			</tr>	
			</thead>
			<tbody>		
			<tr>
				<th> 번호 </th>
				<td> <%= dto.getIdx() %> </td>
				<th> 날짜 </th>
				<td> <%= dto.getWritedate() %></td>
			</tr>
			<tr>
				<th> 이름 </th>
				<td> <%= dto.getWriter() %> </td>
				<th> 조회수 </th>
				<td> <%= dto.getReadnum() %> </td>
			</tr>
			<tr>
				<th> 제목 </th>
				<td colspan="3" align="left"> <%= dto.getSubject() %> </td>
			</tr>
			<tr height="250">
				<td colspan="4" align="left" valign="top"> <%= dto.getContent().replaceAll("\n", "<br>") %> </td>
				<!-- content(본문)의 개행이 DB에는 제대로 저장이 되지만 웹에는 표시가 제대로 안되므로 표시할 수 있는 방법이
					1. 있는 그대로 보여주는 태그 <pre> <content> </pre>
					2. String의 속성값에 있는 .replace() or .replaceAll() 을 사용 / replaceAll("변경할 값","변경 값") 으로 설정해준다 -->
			</tr>
			</tbody>
			<tr>
				<td colspan="4" align="center"> <a href="bbsList.jsp"> 목록으로.. </a>
					&nbsp; | &nbsp; <a href="bbsReWrite.jsp?subject=<%= dto.getSubject()%>&ref=<%= dto.getRef()%>&lev=<%= dto.getLev()%>&sunbun=<%= dto.getSunbun()%>"> 답변쓰기 </a> </td>
					<!-- 답변글을 쓸 때 원글의 제목이 자동으로 입력되므로 subject와 원 글의 답변글이라는 정보를 담고있는 ref, lev, sunbun값도 파라미터로 넘겨주어야 한다. -->
			</tr>
		</table>
	</article>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>