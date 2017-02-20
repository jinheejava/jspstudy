<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="../css/mainLayout.css">
<style>
	<style>
		h2{
		text-align:center;
		}
		fieldset{
			width:350px;
			margin:0px auto;
		}
		table{
			margin:0px auto;
		}
		h3{
			text-align: center;
		}
	</style>
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

<section>
	<article>
	<h2> 사원관리프로그램(Beans) </h2>
		<form name="empAdd2" action="empAdd2_ok.jsp">
		<fieldset>
			<legend> 사원등록 </legend>
			<table>
				<tr>
					<th> 사원이름 </th>
					<td> <input type="text" name="name"> </td>
				</tr>
				<tr>
					<th> E-mail </th>
					<td> <input type="text" name="email"> </td>
				</tr>
				<tr>
					<th> 부서명</th>
					<td> <input type="text" name="dept"> </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						 <input type="submit" value="사원 등록">
						 <input type="reset" value="다시 작성"> </td>
				</tr>				
			</table>
		</fieldset>
		</form>
	</article>
	
	<article>
		<form name="empDel2" action="empDel2_ok.jsp">
		<fieldset>
			<legend> 사원 삭제 </legend>
			<table>
				<tr>
					<th> 사원 이름 : </th>
					<td colspan="2"> <input type="text" name="name">
						<input type="submit" value="삭제하기"> </td>
				</tr>
			</table>
		</fieldset>
		</form>
	</article>
	
	<article>
		<form name="empList2">
		<fieldset>
			<legend> 모든 사원 보기 </legend>
			<h3><a href="empList2.jsp"> 모든 사원 내역 보기 </a></h3>
		</fieldset>
		</form>
	</article>
	
	<article>
		<form name="empFind2" action="empFind2_ok.jsp">
		<fieldset>
			<legend> 사원 검색</legend>
			<table>
				<tr>
					<th> 이름 : </th>
					<td> <input type="text" name="name"> </td>
					<td> <input type="submit" value="검색하기"> </td>
				</tr>
			</table>
		</fieldset>
		</form>
	</article>
	
	<article>
		<form name="empUpdate2" action="empUpdate2_ok.jsp">
		<fieldset>
			<legend> 사원 수정</legend>
			<table>
				<tr>
					<th> 이름 : </th>
					<td> <input type="text" name="name">
						<input type="submit" value="조회하기"> </td>
				</tr>
			</table>
		</fieldset>
		</form>
	</article>
</section>

<%@ include file="../footer.jsp" %>
</body>
</html>