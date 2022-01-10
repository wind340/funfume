<%@page import="com.koreait.funfume.domain.Paymethod"%>
<%@page import="com.koreait.funfume.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
List<OrderSummary> orderSummaryList = (List)request.getAttribute("orderSummaryList");
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
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/1.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			OrderSummaryList
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
									<th class="text-center">결제금액</th>
									<th class="text-center">결제수단</th>
									<th class="text-center">주문일</th>
									<th class="text-center">결제상세 보기</th>
	
								</tr>
								<%
								int i=1;
								%>
								<%
								for (OrderSummary ordersummary : orderSummaryList){
								%>
								<%Paymethod paymethod = (Paymethod)ordersummary.getPaymethod(); %>
								<tr class="table_row"  align="center">
									<td><%=i++%></td>
									<td><%=ordersummary.getTotalpay() %>원</td>
									<td><%= paymethod.getMethod() %></td>
									<td><%=ordersummary.getOrderdate() %></td>
									<td><button type="button" onClick="detail(<%=ordersummary.getOrder_summary_id()%>)" class="btn btn-outline-secondary" > view </button></td>
									<% } %>
								</tr>
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
<script>
function detail(n){
	location.href="/orderdetail?order_summary_id="+n;
}
</script>
</body>
</html>