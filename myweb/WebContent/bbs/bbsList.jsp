<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="jin.bbs.*" %>
<jsp:useBean id="bdao" class="jin.bbs.BbsDAO" scope="session"/>
<jsp:useBean id="bdto" class="jin.bbs.BbsDTO" scope="page"/>

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
		width: 600px;
		margin: 0px auto;
		border-top : 2px double black;
		border-bottom : 2px double black;
		border-spacing: 0px;		
	}
	table th{
		border-bottom: 1px double black;
		background: #af9776;
	}
	table td{
		border-bottom: 1px solid black;
		text-align: center;
	}
	.subject{
		border-left : 1px solid black;
		border-right : 1px solid black;
		text-align: left;
	}	
	.readnum{
		border-left : 1px solid black;
	}	
</style>
</head>

<%
	int totalCnt = bdao.getTotalCnt(); //총 게시물 수
	int listSize = 10; //보여줄 리스트 수
	int pageSize = 5; //보여줄 페이지 수
	//int cp = 8; //현재 위치
	String cp_s = request.getParameter("cp");
	if(cp_s==null || cp_s==""){
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s);
	
	int totalPage =  totalCnt/listSize+1; //총 페이지수
	if(totalCnt%listSize==0) totalPage--;
	
	int userGroup = cp/pageSize;
	if(cp%pageSize==0) userGroup--;
%>

<body>
<%@ include file="/header.jsp" %>

<section>
	<h2> 자유 게시판 </h2>
	<form name="bbsList" action="bbsWrite.jsp">
	<table>
		<thead>
		<tr>
			<th> 번호 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 조회수 </th>
		</tr>
		</thead>
		<tbody>
		<%
			ArrayList<BbsDTO> arr = bdao.bbsList(cp, listSize);
			
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center"> 등록된 게시글이 없습니다 </td>
				</tr>
				<%
			} else{
				for(int i=0;i<arr.size();i++){
					%>
					<tr>
						<td class="idx"> <%= arr.get(i).getIdx()%> </td>
						<td class="subject"> 
						<%
							for(int z=0;z<arr.get(i).getLev();z++){
								out.println("&nbsp;&nbsp;");
							}
						%>
							<a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx()%>"> <%= arr.get(i).getSubject()%> </a> </td>
						<td class="writer"> <%= arr.get(i).getWriter()%> </td>
						<td class="readnum"> <%= arr.get(i).getReadnum()%> </td>
					</tr>
					<%				
				}
			}
		%>		
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" align="center">
				 <%
					if(userGroup!=0){
						%> <a href="bbsList.jsp?cp=<%= (userGroup-1)*pageSize+pageSize%>"> &lt;&lt; </a>
						<%
					}
						for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
							%>
							&nbsp;&nbsp;&nbsp;&nbsp;<a href="bbsList.jsp?cp=<%=i%>"> <%= i %> </a>&nbsp;&nbsp;&nbsp;&nbsp;
							<%
							if(i==totalPage) break;
						}
					if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
						%> <a href="bbsList.jsp?cp=<%= (userGroup+1)*pageSize+1 %>"> &gt;&gt; </a>
						<%
					}
					/* 마지막 그룹일 경우를 제외하고는 오른쪽으로 가는 화살표 보여주기*/
				%>
				</td>
				<td> <a href="bbsWrite.jsp"> 글쓰기 </a> </td>
			</tr>				 
		</tfoot>
	</table>
	</form>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>