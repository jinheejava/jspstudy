<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="jin.wf.WebFolderDAO"
scope="session"/> 
    
<%
	String fname = request.getParameter("makefolder");

	File f = new File(wf.USERS_HOME+"/"+wf.getCrpath()+"/"+fname);
	
	if(!f.exists() ){
		f.mkdir();
		%>
		<script>
			window.alert('폴더 생성 성공 :)');
			opener.location.href=''
			window.self.close(wf.USERS_HOME+"/"+wf.getCrpath());
		</script>
		<%
	} else {
		%>
		<script>
			window.alert('이미 존재하는 폴더입니다');
			location.href='makeFolder.jsp';
		</script>
		<%
	}	
%>