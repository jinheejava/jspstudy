<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bdto" class="jin.bbs.BbsDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="jin.bbs.BbsDAO" scope="session"/>

<%
	String idx_s = request.getParameter("idx");
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);
	String sub = request.getParameter("subject");
	String con = request.getParameter("content");

	int result = bdao.updateWrite(idx, sub, con);
	
	if(result>0){
		%>
		<script>
			window.alert('글 수정 완료');
			location.href='bbsList.jsp';
		</script>
		<%
	} else{
		%>
		<script>
			window.alert('글 수정 실패');
			location.href='bbsList.jsp';
		</script>
		<%
	}

%>