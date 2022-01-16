<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>


회원가입 폼
<form name="form1">
	<input type="text" name="id" placeholder="ID">
	<input type="email" name="email" placeholder="email">
	<input type="password" name="pass" placeholder="password">
	<input type="text" name="addr1" placeholder="addr1">
	<input type="text" name="addr2" placeholder="addr2">
	<button type="button" id="regist">가입하기</button>
	
</form>


<script>
$(function () {
	$("#regist").click(function(){
		join();
	});
	
});


function join(){
	form1.action="/join";
	form1.method="post";
	form1.submit();
}

</script>

</body>
</html>