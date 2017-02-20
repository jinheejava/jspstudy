<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
<!-- 등록 버튼을 눌렀을 때 새로운 화면을 보여주는게 아니라
	 등록 처리만 하면 되기 때문에 html을 사용하지 않음 -->
    
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");
	
	Connection conn =  jin.db.JinDB.getConn();
	/*
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//error가 나지 않는 이유 : 서비스 메소드..?에 theows 처리가 되어있기 때문에
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, user, pwd);
	*/
	
	String sql = "insert into employee values(employee_idx.nextval,?,?,?)";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, dept);
	
	int count = ps.executeUpdate();
	
 	ps.close();
	
	conn.close();

	if(count>0){
		%>
		<script>
		window.alert('사원이 등록 되었습니다');
		location.href='emp.jsp';
		</script>
		<%		
	} else {
		%>
		<script>
		window.alert('사원 등록에 실패하였습니다');
		location.href='emp.jsp';
		</script>
		<%
	}
 %>

	
    
