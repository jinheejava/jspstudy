<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="css/mainLayout.css">
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
</head>
<body>
<%@ include file="header.jsp" %>

<section>
	<article>
		<h2> 사원 관리 프로그램 </h2>
		<form name="empAdd" action="empAdd_ok.jsp">
		<fieldset>
			<legend> 사원 등록 </legend>
			<table>
				<tr>
					<th> 사원 이름 </th>
					<td> <input type="text" name="name" required="required"> </td>
				</tr>
				<tr>
					<th> E-mail </th>
					<td> <input type="text" name="email" required="required"> </td>
				</tr>
				<tr>
					<th> 부서 정보 </th>
					<td> <input type="text" name="dept" required="required"> </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="사원 등록">
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>		
		</fieldset>
		</form>
		</article>
		
		<article>
		<form name="empDel" action="empDel_ok.jsp">
		<fieldset>
			<legend> 사원 삭제 </legend>
			<table>
			<tr>
				<th> 이름 : </th>
				<td> <input type="text" name="name"> </td>
				<td> <input type="submit" value="퇴사처리"> </td>
			</tr>
			</table>
    	</fieldset>
		</form>	
	</article>
	
	<article>
	<fieldset>
	<legend> 모든 사원 내역 보기</legend>
		<h3> <a href="empList.jsp"> 모든 사원 내역 보기 </a> </h3>
	</fieldset>
	</article>
	
	<article>
	<form name="empFind" action="empFind_ok.jsp">
	<fieldset>
		<legend> 사원 검색 </legend>
		<table>
		<tr>
			<th> 이름 : </th>
			<td> <input type="text" name="name"> </td>
			<td> <input type="submit" value="검색"> </td>
		</tr>
		</table>
	</fieldset>
	</form>
	</article>
	
	<article>
	<form name="empUpdateForm" action="empUpdate.jsp">
	<fieldset>
		<legend> 사원 정보 수정 </legend>
		<table>
		  <tr>
			<th> 사원 번호 : </th>
			<td> <input type="text" name="idx"> </td>
			<td> <input type="submit" value="조회" > </td>
		  </tr>			
		</table>
	</fieldset>
	</form>
	</article>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>