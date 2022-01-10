<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	input {
		width: 60%;
		padding: 10px 20px;
		margin: 1px 0;
		box-sizing: border-box;
	}
	input[type="text"], [type="password"]{
		border: solid 1px #FFE4B5;
		-webkit-transition: 0.5s;
		transition: 0.5s;
		outline: none;
	}
input[type="text"]:focus { border: solid 1px #D2691E; }
input[type="password"]:focus { border: solid 1px #D2691E; }

</style>

	<!--  Head Link -->
<%@ include file="../shop_inc/head_link.jsp"%>	

</head>
<body class="animsition">
	
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>
	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/3.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			My Page
		</h2>
	</section>	

	<!--  My page  -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-t-50 p-b-50">
				<div class="col-lg-8">
					<div class="p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							My account
						</h3>
						<form>
						<input type="hidden" id="member_id" value="고유member_id">
 						<p class="stext-113 cl6 p-b-26">
							<div class="row g-0">
								<div class="col-6 col-md-4"> E - Mail</div>
  								<input type="text" placeholder="abcde@gmail.com" value="">
  								
							</div>  
						</p> 
 						<p class="cl6 p-b-26">
							<div class="row g-0">
								<div class="col-6 col-md-4"> Name </div>
  								
  								<input type="text" placeholder="David" value="">
  								
							</div>  
						</p> 
 						<p class="stext-113 cl6 p-b-26">
							<div class="row g-0">
								<div class="col-6 col-md-4"> Password </div>
  								<input type="password" placeholder="●●●●●●" value="">
							</div>  
						</p> 
 						<p class="stext-113 cl6 p-b-26">
							<div class="row g-0">
								<div class="col-6 col-md-4"> Address </div>
  								<input type="text" placeholder="Seoul-si" value="">
							</div>  
						</p> 
 						<p class="stext-113 cl6 p-b-26">
							<div class="row g-0">
								<div class="col-6 col-md-4"> Address 2 </div>
  								<input type="text" placeholder="Yongsan-gu" value="" style="backgroud-color:black;">
							</div>  
						</p> 
						<p class="stext-113 cl6 p-b-26">
							<div align="center">
								<button type="button" class="btn btn-outline-secondary" >수정하기</button>
								<button type="button" class="btn btn-outline-secondary" >탈퇴하기</button>
							</div>  
						</p> 
						
					</div>
					</form>
				</div>
				
				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="/resources/funfume/images/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	

	<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp" %>
	<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp" %>
	<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp" %>

</body>
</html>