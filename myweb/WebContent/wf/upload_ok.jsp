<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="jin.wf.WebFolderDAO"
scope="session"/> 

<%
	String savepath=wf.USERS_HOME+"/"+wf.getCrpath();

	try{
	MultipartRequest mr = new MultipartRequest(request,
											   savepath,
											   wf.getFreesize(),"utf-8");
	%>
	<script>
		window.alert('업로드 성공');
		opener.location.href='webFolder.jsp?cr=<%=wf.getCrpath()%>';
		window.self.close();
	</script>
	<%
	} catch(Exception e){
		%>
		<script>
			window.alert('업로드 실패');
			window.self.close();
		</script>
		<%
	}	
%>