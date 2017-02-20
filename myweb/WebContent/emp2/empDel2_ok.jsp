<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="edto" class="jin.emp.EmpDTO"/>

<jsp:setProperty property="*" name="edto"/>

<jsp:useBean id="edao" class="jin.emp.EmpDAO"/>

<%
	int result = edao.empDel(edto);
	String msg = result>0? "사원 삭제 성공": "사원 삭제 실패..";
%>

<script>
	window.alert('<%=msg%>');
	location.href='emp2.jsp';
</script>