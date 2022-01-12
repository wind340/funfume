<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUNFUME | 마이페이지</title>
<%@ include file="../shop_inc/head_link.jsp"%>	
</head>
<body>
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>

	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>
<!-- Content page -->
<% Member myInfo = (Member)session.getAttribute("member");%>
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="margin:0 auto;">
					<form name="form1" method="post">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							회원정보 수정
						</h4>

						<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="hidden" name="member_id" value="<%=myInfo.getMember_id() %>" >
						<span>이름(수정불가)</span>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" readonly value="<%=myInfo.getMember_name() %>" >
						</div>
						<span>이메일(수정불가)</span>
						<div class="bor8 m-b-10 how-pos4-parent" >
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="email"  readonly  value="<%=myInfo.getEmail() %>" >
						</div>
						<span>비밀번호 변경</span>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="password"  name="pass" >
						</div>
						<span>주소</span>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name= "addr1" value="<%=myInfo.getAddr1() %>" >
						</div>
						<span>상세 주소</span>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name= "addr2" value="<%=myInfo.getAddr2() %>" >
						</div>
						<button  type="button" id="infoSave" class="flex-c-m m-b-10 stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							수정하기
						</button>
						<button  type="button" id="infoDel" onClick="del(<%=myInfo.getMember_id() %>)" class="flex-c-m m-b-10 stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							회원탈퇴
						</button>
						
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
$(function () {
 	$("#infoSave").click(function(){
		edit();
	}); 
})


function edit(){
	if(confirm("수정하시겠습니까?")){
		form1.action="/myinfoUpdate";
		form1.method="post";
		form1.submit();
		alert("회원정보가 수정되었습니다.");
	}
}

function del(n){
	if(confirm("정말로 탈퇴하시겠습니까?")){
		location.href="/infoDel?member_id="+n
	}
}


/*function passCheck(){
	$.ajax({
		url:"/passCheck",
		type:"POST",
		data:{
			pass:$("input[name='pass']").val()	
		},
		success:function(result,status,xhr){
			alert(result.msg);
			
			if(result.code==1){
				location.href="/mypage"
			}
		}
	}); 
}*/


</script>
</body>
</html>