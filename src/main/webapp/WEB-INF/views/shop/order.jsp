<%@page import="com.koreait.funfume.domain.OrderSummary"%>
<%@page import="com.koreait.funfume.domain.ProductImg"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Product product = (Product)request.getAttribute("product");
	OrderSummary orderSummary = (OrderSummary)request.getAttribute("orderSummary");
%>


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
input[type="text"], [type="password"], [type="email"],[type="number"]{
   border: solid 1px #ced4da;
   -webkit-transition: 0.5s;
   transition: 0.5s;
   outline: none;
   border-radius: 5px;
}
.jb-container {
   padding: 100px;
   display: grid;
   grid-template-columns: 1fr 1fr;
   grid-gap: 10px;
}

input[type="text"]:focus {
   border: solid 1px #D2691E;
}
input[type="password"]:focus {
   border: solid 1px #D2691E;
}
input[type="email"]:focus {
   border: solid 1px #D2691E;
}

</style>

<!--  Head Link -->
<%@ include file="../shop_inc/head_link.jsp"%>

</head>
<body class="animsition">

   <!-- Header -->
   <%@ include file="../shop_inc/header.jsp"%>
   <!-- Cart -->
   <%@ include file="../shop_inc/cart.jsp"%>


   <!-- Title page -->
   <section class="bg-img1 txt-center p-lr-15 p-tb-92"
      style="background-image: url('/resources/images/3.jpg');">
      <h2 class="ltext-105 cl0 txt-center">Order List</h2>
   </section>

   <!--  Order page  -->
   <form name="form1">
      <div class="jb-container" >
         <div class="alert" align="center">
            <h3 class="mtext-111 cl2 p-b-16">주문자 정보</h3>
            <input type="hidden" name="member_id"   value="<%=member.getMember_id()%>">
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">고객 이름</div>
                  <input type="text" placeholder="<%=member.getMember_name()%>">
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">email</div>
                  <input type="email" placeholder="<%=member.getEmail()%>">
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">주소</div>
                  <input type="text" placeholder="<%=member.getAddr1()%>">
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">상세주소</div>
                  <input type="text" placeholder="<%=member.getAddr2()%>">
               </div>
         </div>
         
            <div class="alert" align="center">
               <h3 class="mtext-111 cl2 p-b-16">주문 정보</h3>
               <input type="hidden" name="product_id" value="<%=product.getProduct_id()%>">
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">상품명</div>
                  <input type="text" name="product_name" value="<%=product.getProduct_name()%>" readonly>
               </div>
               <p class="cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">브랜드명</div>
                  <input type="text" name="brand_id" value="<%=product.getBrand_id()%>" readonly>
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10 ">상품 가격</div>
                  <input type="text" id="price" name="price" value="<%=product.getPrice()%>" readonly>
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10 ">수량</div>
                  <input type="number" id="ea" name="ea" value="<%=orderSummary.getEa()%>">
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">총 결제 금액</div>
                  <input type="text" id="totalpay" name="totalpay" value="" readonly>
               </div>
               <p class="stext-113 cl6 p-b-26">
               <div class="row">
                  <div class="col-4 p-t-10">결제수단</div>
                  <select name="paymethod_id">
                     <option value="1">신용카드</option>
                     <option value="2">온라인 입금</option>
                     <option value="3">핸드폰</option>
                  </select>
               </div>
            </div>
            <div align="right"><button type="button" id="buy" class="btn btn-dark ">결제하기</button></div>
            <div><button type="button" onClick="history.back()" class="btn btn-light">돌아가기</button></div>
      </div>
   </form>

   <!-- Footer -->
<%@ include file="../shop_inc/footer.jsp"%>
   <!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp"%>
   <!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp"%>

<script type="text/javascript">
   function culc() {
      var price = document.getElementById("price").value;
      var ea = document.getElementById("ea").value;
      var multi = price * ea;
      $("#totalpay").val(multi);
   }

   $(function() {
      $("#buy").click(function() {
         buy();
      });
      $("input[name='ea']").change(function() {
         culc();
      });
      culc();
   })
   function buy() {
      if(confirm("결제하시겠습니까?")){
         $("form[name='form1']").attr({
            action : "/ordered",
            method : "post"
         });
         $("form[name='form1']").submit();
      }else{
         alert("주문을 취소하였습니다");            
      }
   }
</script>
</body>
</html>