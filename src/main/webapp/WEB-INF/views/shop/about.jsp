<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>About</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<%@ include file="../shop_inc/head_link.jsp"%>	
</head>
<body class="animsition">
	
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>

	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>
		

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/funfume/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			About
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							Our Story
						</h3>

						<p class="stext-113 cl6 p-b-26">
							요즘에 많이 사용되는 편한 툴이 아닌 서블릿부터 차근차근 웹개발을 해보면서 많은 것을 배웠습니다. MVC패턴으로 엔터프라이즈 단위의 프로젝트를 기획하고 구현하였습니다.
							배포가 끝이 아닌 배운 것들을 앞으로 채워 넣을 생각입니다.
						</p>
						
						<p class="stext-113 cl6 p-b-26">
							궁금한 점이 있으시면 아래의 이메일와 깃허브를 통해 연락바랍니다.
						</p>

					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="/resources/funfume/images/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							Our Githubs
						</h3>


						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p class="stext-114 cl6 p-r-40 p-b-11" >
								<a href="https://github.com/easydong02" target=”_blank”>엉덩희</a>
							</p>

							<span class="stext-111 cl8">
								- 신동희(easydong02@gmail.com)
							</span>
						</div>
						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p class="stext-114 cl6 p-r-40 p-b-11" >
								<a href="https://github.com/wind340" target=”_blank”>wind340</a>
							</p>

							<span class="stext-111 cl8">
								- 김정철(allyace34@gmail.com)
							</span>
						</div>
						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p class="stext-114 cl6 p-r-40 p-b-11" >
								<a href="https://github.com/jjb7134" target=”_blank”>jjb7134</a>
							</p>

							<span class="stext-111 cl8">
								- 정종빈(jjb7134@gmail.com)
							</span>
						</div>
						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p class="stext-114 cl6 p-r-40 p-b-11" >
								<a href="https://github.com/HimNahyeon" target=”_blank”>HimNahyeon</a>
							</p>

							<span class="stext-111 cl8">
								- 임나현(strongnahyeon@gmail.com)
							</span>
						</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0">
							<img src="/resources/funfume/images/about-02.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
		

	<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp" %>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<%@ include file="../shop_inc/bottom_link.jsp" %>

<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
	
</body>
</html>