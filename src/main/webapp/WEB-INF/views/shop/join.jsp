<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUNFUME | 회원가입</title>
<%@ include file="../shop_inc/head_link.jsp"%>	
</head>
<style>
.file-btn {
  display: inline-block;
  background-color: #cdd3d4;
  height: 22px;
  line-height: 22px;
  padding: 0 15px;
  color: #fff !important;
  cursor: pointer;
  *margin-left: 4px;
}

</style>
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
					<form name="form1" method="post">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							회원가입
						</h4>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="member_name" required placeholder="이름을 입력하세요">
						</div>
						<div class="bor8 m-b-10 how-pos4-parent" >
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="email" name="email" required placeholder="이메일을 입력하세요">
						</div>
 						<button type="button" id="mailCheck" class="flex-c-m stext-101 cl0 size-121 m-b-20 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">이메일 중복검사</button>
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="password" name="pass" required placeholder="비밀번호를 입력하세요">
						</div>
								<button type="button" onClick="goPopup()" class="flex-c-m stext-50 cl0 size-121 m-b-20 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">주소찾기</button>
						<div class="bor8 m-b-20 how-pos4-parent">
								<input class="stext-111 size-116 p-l-30 p-r-30" type="text"  id="addr1" name="addr1" required placeholder="주소찾기를 이용해 입력하세요" readonly="readonly">
						</div>
								<input type="hidden"  id="extraAddress" >
						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text"  id="addr2" name="addr2" required placeholder="상세 주소를 입력하세요">
						</div>
						<button  type="button" id="regist" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							가입하기
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
	<!-- daum 우편번호찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

function goPopup() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}


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
			method:"post"
		});
			
		$("form[name='form1']").submit();
		alert("회원가입이 완료되었습니다. 로그인해주세요");
	
	}
}

function checkMail(){
	var email = $("input[name='email']").val();
	
	$.ajax({
		url:'/emailCheck',
		type:'post',
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