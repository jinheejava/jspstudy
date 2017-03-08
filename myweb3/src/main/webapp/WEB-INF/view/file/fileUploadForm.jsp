<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 파일 업로드 테스트 </h2>
<!-- @RequestParam -->
<h3> @RequestParam 전달 방식</h3>
	<form name="upload1" action="fileUpload1.do" method="post" enctype="multipart/form-data">
		작성자: <input type="text" name="writer">
		올릴 파일: <input type="file" name="upload">
		<input type="submit" value="파일 올리기">
	</form>
<hr>
<!-- Multipart 객체 -->
<h3> MultipartHttpServletRequest 전달 방식</h3>
<!-- request객체 -->
	<form name="upload2" action="fileUpload2.do" method="post" enctype="multipart/form-data">
		작성자: <input type="text" name="writer">
		올릴 파일: <input type="file" name="upload">
		<input type="submit" value="파일 올리기">
	</form>
<hr>
<!-- Multipart를 포함하고 있는 DTO 제공 -->
<h3> DTO 객체로 전달하는 방식</h3>
	<form name="upload3" action="fileUpload3.do" method="post" enctype="multipart/form-data">
		작성자: <input type="text" name="writer">
		올릴 파일: <input type="file" name="upload">
		<input type="submit" value="파일 올리기">
	</form>

</body>
</html>