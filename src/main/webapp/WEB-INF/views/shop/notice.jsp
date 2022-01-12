<%@page import="com.koreait.funfume.domain.Notice"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Notice</title>
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
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/Notice_bg.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Notice
		</h2>
	</section>	

<!-- Main content 게시판 폼-->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header" >
            	등록된 공지를 확인하세요
                <!--  <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>-->
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>등록일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody id="dataList"></tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    
    
	<!-- Content page 
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">-->
						<!-- item blog 
						<div class="p-b-63">
							<a href="#" class="hov-img0 how-pos5-parent">
								<img src="/resources/funfume/images/blog-04.jpg" alt="IMG-BLOG">

								<div class="flex-col-c-m size-123 bg9 how-pos5">
									<span class="ltext-107 cl2 txt-center">
										22
									</span>

									<span class="stext-109 cl3 txt-center">
										Jan 2018
									</span>
								</div>
							</a>

							<div class="p-t-32">
								<h4 class="p-b-15">
									<a href="/noticedetail" class="ltext-108 cl2 hov-cl1 trans-04">
										8 Inspiring Ways to Wear Dresses in the Winter
									</a>
								</h4>

								<p class="stext-117 cl6">
									Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius
								</p>

								<div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4">By</span>   
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											StreetStyle, Fashion, Couple  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											8 Comments
										</span>
									</span>

									<a href="blog-detail.html" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
										Continue Reading

										<i class="fa fa-long-arrow-right m-l-9"></i>
									</a>
								</div>
							</div>
						</div>-->

						<!-- item blog -->
						<!-- <div class="p-b-63">
							<a href="blog-detail.html" class="hov-img0 how-pos5-parent">
								<img src="/resources/funfume/images/blog-05.jpg" alt="IMG-BLOG">

								<div class="flex-col-c-m size-123 bg9 how-pos5">
									<span class="ltext-107 cl2 txt-center">
										18
									</span>

									<span class="stext-109 cl3 txt-center">
										Jan 2018
									</span>
								</div>
							</a>

							<div class="p-t-32">
								<h4 class="p-b-15">
									<a href="blog-detail.html" class="ltext-108 cl2 hov-cl1 trans-04">
										The Great Big List of Menâs Gifts for the Holidays 
									</a>
								</h4>

								<p class="stext-117 cl6">
									Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius
								</p>

								<div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4">By</span> Admin  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											StreetStyle, Fashion, Couple  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											8 Comments
										</span>
									</span>

									<a href="blog-detail.html" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
										Continue Reading

										<i class="fa fa-long-arrow-right m-l-9"></i>
									</a>
								</div>
							</div>
						</div> -->

						<!-- item blog -->
						<!-- <div class="p-b-63">
							<a href="blog-detail.html" class="hov-img0 how-pos5-parent">
								<img src="/resources/funfume/images/blog-06.jpg" alt="IMG-BLOG">

								<div class="flex-col-c-m size-123 bg9 how-pos5">
									<span class="ltext-107 cl2 txt-center">
										16
									</span>

									<span class="stext-109 cl3 txt-center">
										Jan 2018
									</span>
								</div>
							</a>

							<div class="p-t-32">
								<h4 class="p-b-15">
									<a href="blog-detail.html" class="ltext-108 cl2 hov-cl1 trans-04">
										5 Winter-to-Spring Fashion Trends to Try Now
									</a>
								</h4>

								<p class="stext-117 cl6">
									Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius
								</p>

								<div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4">By</span> Admin  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											StreetStyle, Fashion, Couple  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											8 Comments
										</span>
									</span>

									<a href="blog-detail.html" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
										Continue Reading

										<i class="fa fa-long-arrow-right m-l-9"></i>
									</a>
								</div>
							</div>
						</div> -->

						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
								1
							</a>

							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
								2
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								Categories
							</h4>

							<ul>
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Fashion
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Beauty
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Street Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Life Style
									</a>
								</li>

								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										DIY & Crafts
									</a>
								</li>
							</ul>
						</div>

						<div class="p-t-65">
							<h4 class="mtext-112 cl2 p-b-33">
								Featured Products
							</h4>

							<ul>
								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="/resources/funfume/images/product-min-01.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											White Shirt With Pleat Detail Back
										</a>

										<span class="stext-116 cl6 p-t-20">
											$19.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="/resources/funfume/images/product-min-02.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Converse All Star Hi Black Canvas
										</a>

										<span class="stext-116 cl6 p-t-20">
											$39.00
										</span>
									</div>
								</li>

								<li class="flex-w flex-t p-b-30">
									<a href="#" class="wrao-pic-w size-214 hov-ovelay1 m-r-20">
										<img src="/resources/funfume/images/product-min-03.jpg" alt="PRODUCT">
									</a>

									<div class="size-215 flex-col-t p-t-8">
										<a href="#" class="stext-116 cl8 hov-cl1 trans-04">
											Nixon Porter Leather Watch In Tan
										</a>

										<span class="stext-116 cl6 p-t-20">
											$17.00
										</span>
									</div>
								</li>
							</ul>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-20">
								Archive
							</h4>

							<ul>
								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											July 2018
										</span>

										<span>
											(9)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											June 2018
										</span>

										<span>
											(39)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											May 2018
										</span>

										<span>
											(29)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											April  2018
										</span>

										<span>
											(35)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											March 2018
										</span>

										<span>
											(22)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											February 2018
										</span>

										<span>
											(32)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											January 2018
										</span>

										<span>
											(21)
										</span>
									</a>
								</li>

								<li class="p-b-7">
									<a href="#" class="flex-w flex-sb-m stext-115 cl6 hov-cl1 trans-04 p-tb-2">
										<span>
											December 2017
										</span>

										<span>
											(26)
										</span>
									</a>
								</li>
							</ul>
						</div>

						<div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
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
		</div>
	</section>	
	
		
	<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp" %>
	<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp" %>
	<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp" %>

<script type="text/javascript">
$(function(){
	getList();
});

//서버에 비동기 요청으로 게시물 목록 가져오기(json배열로)
function getList(){
	$.ajax({
		url:"/admin/rest/notice",
		type:"get",
		success:function(result,status,xhr){
			//alert(result);
			//실제 데이터를 tr에 dom생성하면서 반영해보자
			var tag="";
			for( var i =0; i<result.length;i++){
				var json=result[i]; //배열에서 i번째 요소 꺼내기
				tag+="<tr>";
				tag +="<td></td>";
				tag +="<td>"+json.title+"</td>"; //rest아니게 넣어줘야 디테일에서 비동기처럼 돌아감+노티스에 디테일 참조
				tag +="<td>"+json.writer+"</td>";
				tag +="<td>"+json.regdate+"</td>";
				tag +="<td>"+json.hit+"</td>";
				tag+="</tr>";
			}
			$("#dataList").append(tag);
		}
	});
}
</script>

</body>
</html>