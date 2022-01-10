<%@page import="com.koreait.funfume.domain.ProductImg"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@page import="com.koreait.funfume.domain.OrderDetail"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<OrderDetail> orderDetailList = (List)request.getAttribute("orderDetailList");
%>
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
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/3.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Order Detail List
		</h2>
	</section>	
		     
		     
	<!--  My page "resources/images/slide-01.jpg"   -->
  <form class="bg0 p-t-75 p-b-85" name="form1">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto">
					<div class="m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="text-center">번호</th>
									<th class="text-center">상품명</th>
									<th class="text-center">상품금액</th>
									<th class="text-center">주문수량</th>
									<th class="text-center">상품 이미지</th>
								</tr>
								<%int i=1; %>
								<% for (OrderDetail orderDetail : orderDetailList){%>
								<% Product product = (Product)orderDetail.getProduct(); %>
								<tr class="table_row" align="center">
									<td><%=i++ %></td>
									<td ><%=product.getProduct_name() %></td>
									<td><%=product.getPrice() %></td>
									<td ><%=orderDetail.getEa() %></td>
									<%ProductImg productImg = (ProductImg)product.getProductImgs().get(0); %>
									<td><img src="/resources/data/<%=productImg.getImg() %>" style="width: 200px"></td>
								</tr>
								<% }%>
							</table>
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
</body>
</html>