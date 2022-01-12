<%@ page contentType="text/html;charset=UTF-8"%>
<% Member nextval = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!--  Head Link -->
<%@ include file="../shop_inc/head_link.jsp"%>	
</head>
<body class="animsition">
	
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>
	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/slide-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			My Account
		</h2>
	</section>	
		     
	<!--  My page "resources/images/slide-01.jpg"   -->
	<form class="bg0 p-t-75 p-b-85" name="form1">
	  <div class="album py-3">
	    <div class="container" align="center">
	      <div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 g-3">
	        <div class="col" id="mypage">
	 			<div class="card" style="width: 80%">
				  <img src="resources/images/perfume_3.jpg" class="card-img-top" onClick="location.href='/mypage'">
				  <div class="card-body">
	  		    	 <ul class="list-group list-group-flush">
				    	<h3 class="card-title" align="right">My Info</h3>
					 </ul>
				</div>
	          </div>
	        </div>
	        <div class="col" id="orderlist">
	 			<div class="card" style="width: 80%">
					<img src="resources/images/perfume_2.jpg" class="card-img-top">
				  	<div class="card-body">
	  		    	<ul class="list-group list-group-flush">
				    	<h3 class="card-title" align="right">Order List</h3>
					</ul>
				</div>
	          </div>
	        </div>
      	  </div>
   	   </div>
  	 </div>
   </form>
   

	<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp" %>
	<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp" %>
	<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp" %>

<script type="text/javascript">
$(function(){
	$("#orderlist").click(function(){
		orderlist();
	});
	$("#mypage").click(function(){
		mypage();
	});
})
 
function mypage(){
	location.href="/mypage";
}
function orderlist(){
	location.href="/ordersummary?member_id="+<%=nextval.getMember_id()%>;

}

</script>
</body>
</html>