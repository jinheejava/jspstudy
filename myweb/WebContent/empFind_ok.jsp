<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="css/mainLayout.css">

<style>
	h2{
		text-align: center;
	}
	table{
		margin: 0px auto;
		width: 450px;
		border-spacing: 0px;
		border-top: 2px double black;
		border-bottom: 2px double black;
	}
	table thead th{
		background-color: #cdbea9;
	}
	table tbody td{
		text-align: center;
	} 
</style>

</head>
<body>
<%@ include file="header.jsp" %>

<article>
	<h2> 사원 검색</h2>
	<table>
	  <thead>
		<tr>
			<th> 사원 번호 </th>
			<th> 사원 이름 </th>
			<th> E-mail </th>
			<th> 부서명 </th>
		</tr>	
	  </thead>
	  <tbody>
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
	 		
	 		String sql = "select * from employee where name= ?";
	 		
	 		PreparedStatement ps = conn.prepareStatement(sql);
	 		
	 		ps.setString(1, name);
	 		
	 		ResultSet rs = ps.executeQuery();
	 		
	 		if(rs.next()){
	 			do{
	 				%>
	 				<tr>
	 					<td> <%= rs.getInt("idx") %> </td>
	 					<td> <%= rs.getString("name") %> </td>
	 					<td> <%= rs.getString("email") %> </td>
	 					<td> <%= rs.getString("dept") %> </td>
	 				</tr>
	 				<%
	 			} while(rs.next());	 			
	 		} else {
	 			%>
	 			<tr>
	 				<td colspan="4"> 검색하신 사원은 없습니다 </td>
	 			</tr>
	 			<%		 			
	 		}
	 		
	 		rs.close();
	 		ps.close();
	 		
	 		conn.close();
	 		
	 	%>
	  </tbody>
	</table>
</article>

<%@ include file="footer.jsp" %>
</body>
</html>