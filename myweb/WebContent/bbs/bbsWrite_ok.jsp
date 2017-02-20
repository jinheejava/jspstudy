<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bdto" class="jin.bbs.BbsDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="jin.bbs.BbsDAO" scope="session"/>

<%
	int result = bdao.bbsWrite(bdto);
	
	if(result>0){
		%>
		<script>
			window.alert('글 등록 완료');
			location.href='bbsList.jsp';
		</script>
		<%
	} else{
		%>
		<script>
			window.alert('글 등록 실패');
			location.href='bbsList.jsp';
		</script>
		<%
	}

%>