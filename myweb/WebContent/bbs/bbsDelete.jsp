<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bdao" class="jin.bbs.BbsDAO" scope="session"/>

<%
	String idx_s = request.getParameter("idx");
	
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);

	int result = bdao.bbsDelete(idx);
	
	if(result>0){
		%>
		<script>
		window.alert('게시글이 삭제되었습니다');
		location.href='bbsList.jsp';
		</script>
		<%
	} else {
		%>
		<script>
		window.alert('삭제 실패');
		location.href='bbsList.jsp';
		</script>
		<%
	}

%>