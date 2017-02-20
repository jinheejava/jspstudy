<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
    
<jsp:useBean id="wf" class="jin.wf.WebFolderDAO"
scope="session"/> 
<!-- 로그인 한 상태로는 웹하드를 계속 사용할 수 있어야하므로 session -->

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
			color: brown;
		}
		fieldset{
			width: 550px;
			margin: 0px auto;
		}
		section li{
			list-style-type: none;		
		}
		label{
			width: 100px;
			float: left;
		}
		meter{
			width: 350px;			
		}
		table{
			width: 500px;
			border-top: 2px double black;
			border-bottom: 2px double black;
			margin: 0px auto;
		}
		section p{
			float: right;
		}
		table td{
			text-align: center;
		}	
	</style>
	<script>
	 function OpenUpload(){
		 window.open('upload.jsp','upload','width=450, height=200');
	 }
	 function makeFolder(){
		 window.open('makeFolder.jsp','makefolder','width=350, height=150')
	 }
	 function fileDel(){
			<%
		 		String fname = request.getParameter("name");
				
				File f2 = new File(wf.USERS_HOME+"/"+wf.getCrpath()+"/"+fname);
				File files2[] = f2.listFiles();
				
				for(int i=0;i<files2.length;i++){
					if(files2[i].getName().equals(fname)){
						files2[i].delete();					
					}					
				}			
			%>
	 }
	</script>
</head>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid==null){
		%>
		<script>
			window.alert('로그인 후 이용 가능합니다');
			location.href='/myweb/index.jsp';
		</script>
		<%
		return;
		/* 자바가 해석 순위 1위로  sid가 null값일 때 script가 실행되기도 전에
		   아래 자바 코드들이 해석되고 있기 때문에 return 명령어를 주어 자바코드의 해석을 중지시킨다 */
	}
	/* 로그인을 한 뒤 사용할 수 있는 서비스들에서
	    경고창을 화면을 모두 띄워주고 경고창을 보여주는 것과 화면을 모두 보여주기 전에 경고창을 먼저 보여주는 방법이 있는데
	    경고창을 먼저 보여줄 때는 head와  body사이에, 화면을 보여주고 경고창을 보여줄 때에는 body의 맨 아래에 코드를 짜면 된다
	    but, 강사님: 화면을 먼저 보여주고 경고창을 보여줄 때에는 null값 같은 오류가 발생할 수도 있으니 경고창을 먼저 보여주는 것을 추천함..!
	    로그인 후 이용가능한 서비스들의 경고창은 자주 쓰이므로 따로 jsp 파일을 만들고 이를 include로 사용해도 편하다. -> 모듈..화..? 
	 */
%>
<%
	wf.setUser(sid);
	wf.userFolderExists();
	
	String cr = request.getParameter("cr");
	if(cr==null || cr.equals("")){
		cr=sid;
	}
	
	wf.setCrpath(cr);
%>
<body>
<%@ include file="/header.jsp" %>

<section>
	<article> 
		<h2> <%= sname %>님의 J드라이브 </h2>
		<fieldset>	
			<legend> 기본 사용 정보 </legend>
			<ul>
				<li> <label> 총 용량 </label>
					 <meter value="<%= wf.getTotalsize() %>" max="<%= wf.getTotalsize() %>" min="0"></meter> </li>
				<li> <label> 사용 용량 </label> 
					 <meter value="<%= wf.getUsedsize() %>" max="<%= wf.getTotalsize() %>" min="0"></meter> </li>
				<li> <label> 남은 용량 </label> 			
					 <meter value="<%= wf.getFreesize() %>" max="<%= wf.getTotalsize() %>" min="0"></meter> </li>
			</ul>			
		</fieldset>
	</article>
	<article>
		<fieldset>
			<legend> 탐색기 </legend>
			<p> <input type="button" value="파일 올리기" onclick="OpenUpload()">
				<input type="button" value="폴더 만들기" onclick="makeFolder()"> <br> </p>
			<br>
			<table>
			  <thead>
				<tr>
					<th> 분류 </th>
					<th> 파일명 및 폴더명 </th>
					<th> 삭제 </th>
				</tr>
				 </thead>
				 <tbody>
				 <%
				 	if(!wf.getCrpath().equals(wf.getUser())){
				 		int pos = wf.getCrpath().lastIndexOf("/"); //문자열에서 지정한 인덱스가 마지막으로 나오는 값을 가져옴
				 		
				 		String up_cp = wf.getCrpath().substring(0, pos); //처음부터 마지막 / 까지의 문자열을 가져옴
				 		
				 		%>
				 		<tr>
				 			<td colspan="3" align="left"> <a href="webFolder.jsp?cr=<%= up_cp%>"> 상위로 .. </a> </td>
				 		</tr>
				 		<%
				 	}
				 %>
					<% 
						File f = new File(wf.USERS_HOME+"/"+wf.getCrpath());
						
						File files[] = f.listFiles();
						
						if(files==null || files.length==0){
							%>
							<tr>
								<td colspan="3" align="center">
								등록된 파일 및 폴더가 없습니다.
								</td>
							</tr>
							<%
							
						} else {
							for(int i=0;i<files.length;i++){
								%>
								<tr>
									<td> <%= files[i].isFile()? "[FILE]" : "[DIR]" %> </td>
									<td> 
									<%
										if(files[i].isFile()){
											%>
											<a href="/myweb/wf/upload/<%=wf.getCrpath()%>/<%= files[i].getName() %>"> <%= files[i].getName() %> </a>
											<%											
										} else {
											%>
											<a href="webFolder.jsp?cr=<%= wf.getCrpath()%>/<%= files[i].getName() %>"> <%= files[i].getName() %> </a>
											<%											
										}
									%>
									</td>
									<td> 
										<%
											String name = files[i].getName();
											
											if(files[i].isDirectory()){
												
											} else {
												%>
												<a href="#" onclick="fileDel()?name=<%=files[i].getName()%>"> 삭제 </a>		
												<%																							
											}
										%>
										</td>
								</tr>
								<%
							}
						}	
					%>					
			    </tbody>
			</table>
		</fieldset>
	</article>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>