<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="jin.member.MemberDAO"/>

<%
	String userid = request.getParameter("userid");

	boolean result = mdao.idCheck(userid);
	
	if(result){
		%>
		<script>
			window.alert('이미 등록된 ID입니다');
			location.href='idCheck.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			window.alert('<%=userid%>는 사용 가능한 ID입니다');
			opener.document.join.id.value='<%= userid %>';
			window.self.close();
		</script>
		<%
	}
	
%>
