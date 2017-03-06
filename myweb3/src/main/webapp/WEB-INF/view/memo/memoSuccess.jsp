<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 메모 작성 완료! </h2>
<h3>번호 : ${memoDTO.idx}</h3> <!-- 값을 자동으로 토스해주기때문에 클래스 명과 값을 적어주면 출력이 가능  -->
<h3>제목 : ${cmd.title}</h3> <!-- Controller에서 별칭을 지정해주면 별칭값을 이용해서도 가능함 ! -->
<h3>내용 : ${cmd.content}</h3>
</body>
</html>