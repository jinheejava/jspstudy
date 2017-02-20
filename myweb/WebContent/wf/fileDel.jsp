<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="jin.wf.WebFolderDAO"
scope="session"/> 

<%
	File f2 = new File(wf.USERS_HOME+"/"+wf.getCrpath());

	File files[] = f2.listFiles();

	f2.delete();
	
	if(f2.delete()){
		%>
			<script>
			window.alert('삭제성공');
			</script>
		<%
	} else {
		%>
		<script>
			window.alert('삭제실패');
		</script>
		<%		
	}
%>
