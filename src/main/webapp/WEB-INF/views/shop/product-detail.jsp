<%@page import="com.koreait.funfume.domain.Brand"%>
<%@page import="com.koreait.funfume.domain.ProductGender"%>
<%@page import="com.koreait.funfume.domain.ProductAccord"%>
<%@page import="com.koreait.funfume.domain.ProductNote"%>
<%@page import="com.koreait.funfume.domain.Gender"%>
<%@page import="com.koreait.funfume.domain.Accord"%>
<%@page import="com.koreait.funfume.domain.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.domain.ProductImg"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<% Product product= (Product)request.getAttribute("product");
	List<Product> productList = (List)request.getAttribute("productList");
	List<Note> noteList = (List)request.getAttribute("noteList");
	List<Accord> accordList = (List)request.getAttribute("accordList");
	List<Gender> genderList = (List)request.getAttribute("genderList");
	List<Brand> brandList = (List)request.getAttribute("brandList");
	List<ProductNote> productNoteList = (List)request.getAttribute("productNoteList");
	List<ProductAccord> productAccordList = (List)request.getAttribute("productAccordList");
	List<ProductGender> productGenderList = (List)request.getAttribute("productGenderList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product Detail</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../shop_inc/head_link.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="animsition">
	
	<!-- Header -->
	<header class="header-v4">
<%@ include file="../shop_inc/header.jsp"%>
	</header>

	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp"%>
	


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				Men
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Lightweight Jacket
			</span>
		</div>
	</div>
		

	<!-- Product Detail -->
	
	<section class="sec-product-detail bg0 p-t-65 p-b-60" id="section1" >
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<%for(int i=0;i<product.getProductImgs().size();i++){ %>
								<%ProductImg productImg = (ProductImg)product.getProductImgs().get(i); %>
									<div class="item-slick<%=product.getProductImgs().size() %>" data-thumb="/resources/data/<%=productImg.getImg() %>">
										<div class="wrap-pic-w pos-relative">
											<img src="/resources/data/<%=productImg.getImg() %>" alt="IMG-PRODUCT">
	
											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/resources/data/<%=productImg.getImg() %>">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								<%} %>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-5 p-b-30">
				<form name="bigForm">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<input type="hidden" value="<%=product.getProduct_id()%>" name= "product_id">
						<input type="hidden" value="<%=product.getProduct_name()%>" name= "product_name">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							<%=product.getProduct_name() %>
						</h4>

						
							<%for(int i=0; i<brandList.size();i++){ %>
							<%Brand brand = brandList.get(i); %>
							<%if(brand.getBrand_id() == product.getBrand_id()){ %>
							<img src="resources/data/<%=brand.getBrand_img() %>" width="120">
							<%}} %>
						
						<span class="mtext-106 cl2">
							<br><br>
							<%=product.getPrice() %>원
						</span>

						<p class="stext-102 cl3 p-t-23">
							<%=product.getIntroduction() %>
						</p>
						
						<!--  -->
						<div class="p-t-33">

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="ea" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
									<button type ="button" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" id="bt_purchase">
										Purchase
									</button>
								</div>
							</div>	
						</div>
						
						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</form>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">Accords</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">Notes</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<!-- Accord -->
								<p class="stext-102 cl6">
									<%for(int i =0; i<accordList.size();i++){ %>
									<%Accord accord = accordList.get(i); %>
									<%for(int j=0; j<productAccordList.size();j++){ %>
									<%ProductAccord productAccord = productAccordList.get(j); %>
									<%if(accord.getAccord_id() == productAccord.getAccord_id() && product.getProduct_id() == productAccord.getProduct_id()){ %>
									<%=accord.getAccord_name() %>&nbsp;
									<%}}} %>
								</p>
							</div>
						</div>

						<!-- Notes -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Top note
											</span>

											<span class="stext-102 cl6 size-206">
												<%for(int i =0; i<noteList.size();i++){ %>
												<%Note note = noteList.get(i); %>
												<%for(int j=0; j<productNoteList.size();j++){ %>
												<%ProductNote productNote = productNoteList.get(j); %>
												<%if(note.getNote_id() == productNote.getNote_id() && product.getProduct_id() == productNote.getProduct_id() && productNote.getNote_place().equals("top")){ %>
												<%=note.getNote_name() %>&nbsp;
												<%}}} %>												
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Middle note
											</span>

											<span class="stext-102 cl6 size-206">
												<%for(int i =0; i<noteList.size();i++){ %>
												<%Note note = noteList.get(i); %>
												<%for(int j=0; j<productNoteList.size();j++){ %>
												<%ProductNote productNote = productNoteList.get(j); %>
												<%if(note.getNote_id() == productNote.getNote_id() && product.getProduct_id() == productNote.getProduct_id() && productNote.getNote_place().equals("middle")){ %>
												<%=note.getNote_name() %>&nbsp;
												<%}}} %>	
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Base note
											</span>

											<span class="stext-102 cl6 size-206">
												<%for(int i =0; i<noteList.size();i++){ %>
												<%Note note = noteList.get(i); %>
												<%for(int j=0; j<productNoteList.size();j++){ %>
												<%ProductNote productNote = productNoteList.get(j); %>
												<%if(note.getNote_id() == productNote.getNote_id() && product.getProduct_id() == productNote.getProduct_id() && productNote.getNote_place().equals("base")){ %>
												<%=note.getNote_name() %>&nbsp;
												<%}}} %>	
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto" >
									<div class="p-b-30 m-lr-15-sm" >
										<!-- Review -->
										
									 	<div class="flex-w flex-t p-b-68" id ="review-list">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="/resources/funfume/images/avatar-01.jpg" alt="AVATAR">
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														Ariana Grande
													</span>

													<span class="fs-18 cl11">
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star-half"></i>
													</span>
												</div>

												<p class="stext-102 cl6">
													Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
												</p>
											</div>
										</div>
										<!-- Add review -->
										<form class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>

											<p class="stext-102 cl6">
												Your email address will not be published. Required fields are marked *
											</p>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													Your Rating
												</span>

												<span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
												</div>
											</div>

											<button type="button" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" id="bt_regist">
												Submit
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				SKU: Per - <%=product.getProduct_id() %>
			</span>

			<span class="stext-107 cl6 p-lr-25">
				Categories: Perfume
			</span>
		</div>
	</section>
	


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					<%for(int i=0; i<brandList.size();i++){ %>
					<%Brand brand = brandList.get(i); %>
					<%if(brand.getBrand_id() == product.getBrand_id()){ %>
					<%=brand.getBrand_name() %> &nbsp;Products
					<%}} %>
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
				
					<!-- Related Products Begin -->
					<%for(int i =0; i<productList.size();i++){ %>
					<%Product products = productList.get(i);%>
					<%if(product.getBrand_id() == products.getBrand_id() && product.getProduct_id() != products.getProduct_id() ){ %>
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<%ProductImg productsImg= (ProductImg)products.getProductImgs().get(0); %>
								<img src="/resources/data/<%=productsImg.getImg() %>" alt="IMG-PRODUCT">

							<!-- 	<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View
								</a> -->
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="/product-detail?product_id=<%=products.getProduct_id() %>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										<%=products.getProduct_name() %>
									</a>

									<span class="stext-105 cl3">
										<%=product.getPrice() %>원
									</span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04" src="/resources/funfume/images/icons/icon-heart-01.png" alt="ICON">
										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="/resources/funfume/images/icons/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>
						</div>
					</div>
				<%}} %>
				<!-- Related Products End-->
				</div>
			</div>
		</div>
	</section>
		

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Categories
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Women
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Men
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Shoes
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Watches
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Help
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Track Order
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Returns 
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Shipping
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								FAQs
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						GET IN TOUCH
					</h4>

					<p class="stext-107 cl7 size-201">
						Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>

					<form>
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
							<div class="focus-input1 trans-04"></div>
						</div>

						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form>
				</div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="/resources/funfume/images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/resources/funfume/images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/resources/funfume/images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/resources/funfume/images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="/resources/funfume/images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="/resources/funfume/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/funfume/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/funfume/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/slick/slick.min.js"></script>
	<script src="/resources/funfume/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/funfume/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>

<!--===============================================================================================-->
	<script src="/resources/funfume/js/main.js"></script>

<!-- 비동기 댓글 입력 -->
<script>
$(function(){
	//리뷰 등록
	$("#bt_regist").click(function(){
		 //비동기 요청을 시도할 때, XMLHttpRequest를 직접 사용하면 코드량이 너무 많다.. 따라서 j쿼리가 지원하는 jquery ajax 사용!
		 $.ajax({
			 url:"/review-regist",
			 type:"POST",
			 //주의: 이것은 기존의 form을 이용하는게 아니라 ,자체적인 파라미터명을 지정해서 전송하는 방법
			 data:{
				 "product_id":$("input[name='product_id']").val(),
				 "name" : $("input[name='name']").val(),
				 "email": $("input[name='email']").val(),
				 "rating": $("input[name='rating']").val(),
				 "review": $("textarea[name='review']").val()
			 },
			 success: function(result){ // xhr은 XMLHttpReqeuest
				 console.log(result.msg);
			 
			 	if(result.code !=0){
			 		 getReviewList(); 
			 		
			 	} 
			 	//입력 폼 초기화
				$("input[name='name']").val("");
				$("input[name='email']").val("");
				$("input[name='rating']").val("");
				$("textarea[name='review']").val("");
			 },
			 error:function(xhr,status,error){
				 
			 }
		 });
	});
	
	//상품구매
	$("#bt_purchase").click(function(){
		$("form[name='bigForm']").attr({
				action: "/order",
				method: "post",
				data: {
					product_id:$("input[name='product_id']").val(),
					ea:$("input[name='ea']").val()
				}
			 });
		$("form[name='bigForm']").submit();		
	});
	 getReviewList(); 
});

function getReviewList(){
	
	//비동기방식으로 댓글 목록 가져오기
	$.ajax({
		url:"/review-list?product_id="+<%=product.getProduct_id()%>,
		type:"get",
		success:function(result,status,xhttp){
			//console.log(result); //현재로서는 json이 아닌 String .. 따라서 parsing 필요
			var json =result.list; //문자열을 json 객체로 변환
			
			//테이블 출력
			printTable(json);
		}
		
	});
}

function printTable(json){
	//누구를, 어떻게?
	var tag ="";
	for(var i=0;i<json.length;i++){
		
		var obj = json[i]; //json 배열에서 객체를 1개 꺼낸다.
		tag +="<div class='wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6 m-b-18'>";
		tag +="<img src='/resources/funfume/images/anony.jpg' alt='AVATAR'>";
		tag +="</div>";
		tag +="<div class='size-207'>";
		tag+="<div class='flex-w flex-sb-m p-b-17'>";
		tag+="<span class='mtext-107 cl2 p-r-20'>";
		tag+=obj.name;
		tag+="</span>";
		tag+="<span class='fs-18 cl11'>";
		for(var j =0;j<obj.rating;j++){
			tag+="<i class='zmdi zmdi-star'></i>";
		}
		tag+="</span>";
		tag+="</div>";
		tag+="<p class='stext-102 cl6'>";
		tag+=obj.review;
		tag+="</p>";
		tag+="</div>";
		
		
	}
		$("#review-list").html(tag);
	

	
}
</script>


</body>
</html>