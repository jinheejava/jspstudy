<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	window.alert('${requestScope.msg}');
	location.href='loginForm.jin';
	
/* 내 코드
	window.alert('${requestScope.msg}');
	opener.location.href='goindex.jin';
	window.self.close();
*/
</script>