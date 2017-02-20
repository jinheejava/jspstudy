
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String idx_s=request.getParameter("idx"); //유효성 검사위해 한꺼번에 하지 않고 parseInt나중에
	if(idx_s==null||idx_s.equals("")){
		idx_s="0"; //임의로 입력하지 않아도 0 으로 처리
	}
	int idx=Integer.parseInt(idx_s);
	
	Connection conn = jin.db.JinDB.getConn();
	
	/*
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pwd="1234";
	
	Connection conn=DriverManager.getConnection(url, user, pwd);
	*/
	
	String sql="select * from employee where idx=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, idx);
	
	ResultSet rs=ps.executeQuery();
	
	if(!(rs.next())){ //데이터가 존재하지 않을 경우
		%>
		<script>
			window.alert('존재하지 않는 사번입니다.');
			location.href='emp.jsp';
		</script>
		<%
		return; /*java가 먼저 해석되고 있기 때문에 사번이 존재할 경우 if문을 아래 코드문을 수행하지 않고 메소드를 종료하기 위해 return사용*/
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
 function empback(){
	 location.href='emp.jsp';
 }
</script>
</head>
<body>
<%@include file="header.jsp"%>
<section>
	<article>
		<h2>번 사원의 정보 수정</h2>
	</article>
	<article>
		<%
		String deptnum=request.getParameter("deptnum");
		%>
		<form name="empUpdate" action="empUpdate_ok.jsp">
		<input type="hidden" name="idx" value="<%=idx%>"><!--사원번호 출력방법1-->
		<table>
			<tr>
				<th>사원번호</th>
				<td><%=rs.getInt("idx")%></td> <!--사원번호 출력방법2-->
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" value="<%=rs.getString("email")%>"></td>
			</tr>
			<tr>
				<th>부서명</th>
				<td><input type="text" name="dept" value="<%=rs.getString("dept")%>"></td>
				
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정하기">
				<input type="button" value="돌아가기" onclick="empback()">
				</td>
			</tr>
		</table>
		<% 
		rs.close();
		ps.close();
		conn.close();
		%>
		</form>
	</article>
</section>
<%@include file="footer.jsp"%>
</body>
</html>