<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	window.alert('사용 가능한 ID입니다');
	opener.memberJoin.id.value='${id}';
	window.self.close();
</script>