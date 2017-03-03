<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	window.alert('${requestScope.msg}');
	opener.document.join.id.value='${requestScope.userid}';
	self.close();
</script>