<%@page import="com.koreait.funfume.domain.Gender"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Product> product = (List)request.getAttribute("productList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../shop_inc/head_link.jsp"%>	
</head>
<body class="animsition">
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>

	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>
	

	<!-- Product -->
<section class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button onClick="productList()" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Products
					</button>

					<button onClick="getGenderList(2)" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women">
						Women
					</button>

					<button onClick="getGenderList(1)" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
						Men
					</button>

					<button onClick="getGenderList(3)" class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag">
						Unisex
					</button>
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
					</div>	
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Sort By
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Default
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Popularity
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Average rating
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Newness
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Price: Low to High
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Price: High to Low
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Price
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										All
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$0.00 - $50.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$50.00 - $100.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$100.00 - $150.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$150.00 - $200.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$200.00+
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Color
							</div>

							<ul>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Black
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Blue
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Grey
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Green
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Red
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										White
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Tags
							</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 상품 목록 가져오기 -->
			<div  class="row" id="dataList">
			
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


<script type="text/javascript">
$(function(){
	productList();
	var n= <%=product.get(0).getGender_id()%>;
	getGenderList(n);
});
//서버에 비동기 요청으로 게시물 목록 가져오기(json배열로)
function getGenderList(n){
	$.ajax({
		url:"/genderList?gender_id="+n,
		type:"get",
		success:function(result,status,xhr){
			console.log(result);
			var tag="";
			for(var i=0; i<result.length;i++){
				var json=result[i];
				tag+="<div class='col-sm-6 col-md-4 col-lg-3 p-b-35'>";
				tag+="<div class='block2'>";
				tag+="<div class='block2-pic hov-img0'>";
				tag+="<img src='/resources/data/"+json.productImgs[0].img+"' width='200' height='350'>";
				tag+="</div>";
				tag+="<div class='block2-txt flex-w flex-t p-t-14'>";
				tag+="<div class='block2-txt-child1 flex-col-l '>";
				tag+="<a href='/product-detail?product_id="+json.product_id+"' class='stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6'>";
				tag+=json.product_name+"</a>";
				tag+="<span class='stext-105 cl3'>";
				tag+="￦"+json.price;
				tag+="</span>";
				tag+="</div>";
				tag+="<div class='block2-txt-child2 flex-r p-t-3'>";
				tag+="<a href=''#' class='btn-addwish-b2 dis-block pos-relative js-addwish-b2'>";
				tag+="<img class='icon-heart1 dis-block trans-04' src='/resources/funfume/images/icons/icon-heart-01.png' alt='ICON'>";
				tag+="<img class='icon-heart2 dis-block trans-04 ab-t-l' src='/resources/funfume/images/icons/icon-heart-02.png' alt='ICON'>";
				tag+="</a>";
				tag+="</div>";
				tag+="</div>";
				tag+="</div>";
				tag+="</div>";

			}
			$("#dataList").html(tag);
		}
	});
}
function productList(){
	$.ajax({
		url:"/productList",
		type:"get",
		success:function(result,status,xhr){
			console.log(result);
			var tag="";
			for(var i=0; i<result.length;i++){
				var json=result[i];
				tag+="<div class='col-sm-6 col-md-4 col-lg-3 p-b-35'>";
				tag+="<div class='block2'>";
				tag+="<div class='block2-pic hov-img0'>";
				tag+="<img src='/resources/data/"+json.productImgs[0].img+"' width='200' height='350'>";
				tag+="</div>";
				tag+="<div class='block2-txt flex-w flex-t p-t-14'>";
				tag+="<div class='block2-txt-child1 flex-col-l '>";
				tag+="<a href='/product-detail?product_id="+json.product_id+"' class='stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6'>";
				tag+=json.product_name+"</a>";
				tag+="<span class='stext-105 cl3'>";
				tag+="￦"+json.price;
				tag+="</span>";
				tag+="</div>";
				tag+="<div class='block2-txt-child2 flex-r p-t-3'>";
				tag+="<a href=''#' class='btn-addwish-b2 dis-block pos-relative js-addwish-b2'>";
				tag+="<img class='icon-heart1 dis-block trans-04' src='/resources/funfume/images/icons/icon-heart-01.png' alt='ICON'>";
				tag+="<img class='icon-heart2 dis-block trans-04 ab-t-l' src='/resources/funfume/images/icons/icon-heart-02.png' alt='ICON'>";
				tag+="</a>";
				tag+="</div>";
				tag+="</div>";
				tag+="</div>";
				tag+="</div>";
			}
			$("#dataList").html(tag);
		}
	});
}
</script>
</body>
</html>