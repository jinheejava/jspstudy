<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!-- import할 경우 import="1,2,3..." 처럼 여러개를 나열 할 수도 있지만
	하나를 import할 때마다 가독성을 높이기 위해 페이지 디렉토리를 새로 만들어 import 해 준다-->

<% 
	String name = request.getParameter("name");
	
	Connection conn = jin.db.JinDB.getConn();
	
	/*
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, pwd);
	*/
	
	String sql = "delete from employee where name=?";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, name);
	
	int count = ps.executeUpdate();
	
	ps.close();
	
	conn.close();
	
	/*
	//	if(count>0){
		%>
<!-- 		<script>
		window.alert('사원이 삭제되었습니다');
		loction.href="emp.jsp";
		</script>
		<%		
//	} else {
		%>
		<script>
		window.alret('없는 사원입니다');
		location.href="emp.jsp";
		</script> -->
		<%
//		}	*/

	
	
	String msg = count>0?"퇴사 처리가 완료되었습니다." : "퇴사 처리 중 문제가 발생하였습니다.";
 
 %>
 	<script>
 	window.alert("<%= msg %>");
 	location.href="emp.jsp";
 	</script> 	
 	
 	


 	