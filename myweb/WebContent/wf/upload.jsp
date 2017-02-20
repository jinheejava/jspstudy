<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="upload" action="upload_ok.jsp" method="post" enctype="multipart/form-data">
	<!-- method와 enctype 없이 name과 action만 설정할 경우 주소를 통해 파일을 업로드 하기때문에 용량의 제한이 생겨
		파일 업로드를 짤 경우엔 method와  enctype을  꼭 설정해주어야 한다 -->
		<fieldset>
			<legend> 파일 올리기</legend>
			 파일명 : <input type="file" name="upload">
			 <input type="submit" value="올리기">
		</fieldset>	
	</form>
</body>
</html>