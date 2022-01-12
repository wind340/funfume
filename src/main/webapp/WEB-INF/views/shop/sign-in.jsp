<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FUNFUME | Sign-in</title>
<%@ include file="../shop_inc/head_link.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>

	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>


<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="margin:0 auto;">
					<form id=form1>
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							로그인
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="email" name="email" required placeholder="이메일을 입력하세요">
						</div>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="password" name="pass" required placeholder="비밀번호를 입력하세요">
						</div>
						<button type="button" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							로그인 
						</button>
						<div>
						<div class="mtext-30 cl2 txt-center p-b-30 p-t-30">
							<ul style="display:inline-block;  ">
								<li style="float:left;"><a href="#"  style="text-decoration: none; color: grey;">비밀번호 찾기</a></li>	
								<li style="float:left;"><a href="#" class="p-l-10" style="text-decoration: none; color: grey;">아이디 찾기</a></li>	
								<li style="float:left;"><a href="/memberForm"  class="p-l-10" style="text-decoration: none; color: grey;">회원가입</a></li>	
							</ul>
						</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>	
	
	
	
	
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
	$(function(){
		$("button").click(function(){
			signIn();
		});
	});
	
	//비동기 요청을 시도해보자
	function signIn(){
		$.ajax({
			url:"/signIn",
			type:"POST",
			data:{
				email:$("input[name='email']").val(),
				pass:$("input[name='pass']").val()				
			},
			success:function(result,status,xhr){ //200 요청에 대한 처리 메서드
				alert(result.msg); //메세지출력
				
				if(result.code==1){
					location.href="/";
				}
			}
		});
	}
</script>		
</body>
</html>