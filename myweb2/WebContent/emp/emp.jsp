<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function empDel(){
		document.empAdd.action='empDel.jin';
		document.empAdd.submit();
	}
</script>
</head>

<body>
<h2> 사원관리 프로그램(MVC) </h2>
	<form name = "empAdd" action="empAdd.jin">
		<fieldset>
		<legend> 사원 등록</legend>
			<ul>
				<li> 사원 이름: <input type="text" name="name"> </li>
				<li> E-Mail: <input type="text" name="email"> </li>
				<li> 부서 : <input type="text" name="dept"> </li>
			</ul>
			<p>
				<input type="submit" value="사원등록">
				<input type="reset" value="다시작성">
			</p>
		</fieldset>
	
<!-- <form name="empDel" action="empDel.jin"> -->
		<fieldset>
			<legend> 사원 삭제 </legend>
			<ul>
				<li> 이름: <input type="text" name="delname"> </li>
			</ul>
			<input type="button" value="삭제하기" onclick="empDel()">			
		</fieldset>
<!-- </form> -->
</form>

<fieldset>
	<legend> 사원 목록 보기</legend>
	<h4><a href="empList.jin">사원 목록</a></h4>
</fieldset>

<form name="empFind" action="empFind.jin">
	<fieldset>
		<legend> 사원 검색 </legend>
		이름 : <input type="text" name="name">
		<input type="submit" value="사원 검색">
	</fieldset>	
</form>

<form name="empUpdate" action="empInfo.jin">
	<fieldset>
		<legend> 사원 정보 수정 </legend>
		사원 번호: <input type="text" name="idx_s">
		<input type="submit" value="조회하기">
	</fieldset>
</form>

</body>
</html>






























