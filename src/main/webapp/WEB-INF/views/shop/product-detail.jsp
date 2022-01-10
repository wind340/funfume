<%@page import="com.koreait.funfume.domain.ProductImg"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../shop_inc/head_link.jsp"%>

<!-- 임시 주문 -->
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>


</head>
<body class="animsition">
	<!-- Header -->
	<%@ include file="../shop_inc/header.jsp"%>
	<!-- Cart -->
	<%@ include file="../shop_inc/cart.jsp"%>


	<!-- 임시 하기 ㄱㄱ -->
	<form name="form1">
		<table>
			<tr>
				<th>상품명</th>
				<th>브랜드명</th>
				<th>상세설명</th>
				<th>가격</th>
				<th>이미지</th>
				<th>성향</th>
				<th>갯수</th>
			</tr>
			<tr>
				<input type="hidden" name="member_id" value="1">
				<input type="hidden" name="product_id" value="<%=product.getProduct_id()%>">
				<input type="hidden" name="paymethod_id" value="1">
				<td><input type="text" name="product_name" value="<%=product.getProduct_name()%>" readonly="readonly"></td>
				<td><input type="text" name="brand_id" value="<%=product.getBrand_id() %>" readonly="readonly"></td>
				<td><textarea type="text" name="Introduction" ><%=product.getIntroduction()%></textarea></td>
				<td><input type="text" name="price" value="<%=product.getPrice()%>" readonly="readonly"></td>
				<%
					ProductImg productImg = (ProductImg) product.getProductImgs().get(0);
				%>
				<td><img src="/resources/data/<%=productImg.getImg() %>" style="width:320px; height:380px;">
				<td><input type="text" value="<%=product.getGender_id()%>" readonly="readonly"></td>
				<td><select name="ea" >
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
  						</select>					
  				</td>
			</tr>
		</table>
		<button type="button" id="order">바로 구매</button>
	</form>
	
	
	<!-- Footer -->
	<%@ include file="../shop_inc/footer.jsp"%>
	<!-- Back to top -->
	<%@ include file="../shop_inc/back_to_top.jsp"%>
	<!-- Modal1 -->
	<%@ include file="../shop_inc/modal1.jsp"%>
	<!-- Bottom_link -->
	<%@ include file="../shop_inc/bottom_link.jsp"%>
	<!-- Bottom_link 2 -->
	<%@ include file="../shop_inc/bottom_link2.jsp"%>
<script type="text/javascript">

$(function () {
	$("#order").click(function(){
		order();
	});
})
function order(){
	 $("form[name='form1']").attr({
		action: "/order",
		method: "get"
	 });
	 $("form[name='form1']").submit();
 }
</script>
</body>
</html>