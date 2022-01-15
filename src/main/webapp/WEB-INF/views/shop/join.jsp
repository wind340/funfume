<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>FUNFUME | 회원가입</title>
<%@ include file="../shop_inc/head_link.jsp"%>	

</head>
<body class="animsition">
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>

	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>


<!-- Content page -->
<form name="form1">
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="margin:0 auto;">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							회원가입
						</h4>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="member_name" required placeholder="이름을 입력하세요">
						</div>
						<div class="bor8 m-b-10 how-pos4-parent" >
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="email" name="email" required placeholder="이메일을 입력하세요">
						</div>
 						<button type="button" id="mailCheck" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">이메일 중복검사</button>
						
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="password" name="pass" required placeholder="비밀번호를 입력하세요">
						</div>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="addr1" required placeholder="주소를 입력하세요">
						</div>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="addr2" required placeholder="상세 주소를 입력하세요">
						</div>
						<button  type="button" id="regist" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							가입하기
						</button>
				</div>
			</div>
		</div>
	</section>	
</form>



	<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp" %>
	<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp" %>
	<!-- Modal1 -->
	<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp" %>
	<!-- Bottom_link 2 -->
<%@ include file="../shop_inc/bottom_link2.jsp" %>

<script>
$(function () {
	$("#regist").click(function(){
		join();
	});

 	$("#mailCheck").click(function(){
		//alert("까꿍");
		checkMail();
	});
	
});


function join(){
	
	var name = $("input[name='member_name']").val();
	var email = $("input[name='email']").val();
	var pass = $("input[name='pass']").val();
	var addr1= $("input[name='addr1']").val();
	var addr2 = $("input[name='addr2']").val();

	if(name==""){
		alert("이름을 입력해주세요");
	}else if(email==""){
		alert("이메일을 입력해주세요");
	}else if(pass==""){
		alert("비밀번호를 입력해주세요");
	}else if(addr1==""){
		alert("주소를 입력해주세요");
	}else if(addr2==""){
		alert("상세 주소를 입력해주세요");
	}else{
	
		$("form[name='form1']").attr({
			action:"/join",
			method:"post",
		});
			
		$("form[name='form1']").submit();
		alert("회원가입이 완료되었습니다. 로그인해주세요");
	}
}

function checkMail(){
	var email = $("input[name='email']").val();
	
	$.ajax({
		url:"/emailCheck",
		type:"POST",
		data:{email:email},
		success:function(result){
			if(result!=0){
				alert("이미 등록된 이메일 입니다.");
			}else{
				alert("사용가능한 이메일 입니다.");
			}
		},
		error:function(){
			alert("에러입니다.");
		}
	});
}

</script>
</body>
</html>