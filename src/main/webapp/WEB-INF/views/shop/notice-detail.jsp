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
<style>
div#notice1{
	text-align: center;
	margin: auto;
	border-radius: 25px;
	border: 1px solid #CCA63D;
	padding: auto;
	width: 80%;
	height: 40%;
}
div#grid{
	border-top: 1px solid #CCA63D;
}
div#grid2{
	border-right: 1px solid #CCA63D;
}
textarea#content {
            width: 100%;
            height: 200px;
			border-top: 1px solid #CCA63D;
			border-bottom: 1px solid #CCA63D;
            box-sizing: border-box;
            padding: 30px;
            font-size: 15px;
            resize: none;
 }
</style>
<%@ include file="../shop_inc/head_link.jsp"%>
</head>
<body class="animsition">

<!-- Header -->
<%@ include file="../shop_inc/header.jsp"%>

<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp"%>



	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/notice.jpg');">
		<h2 class="ltext-105 cl0 txt-center">Notice</h2>
	</section>


	<!--  My page "resources/images/slide-01.jpg"   -->
<div id="notice1" class="pt-100">
<form name="form1">
	<div class="form-row">
		<div class="col-md-6" id="grid2">
			<label>작성자</label>
			<p><%=notice.getWriter() %></p>
		</div>
	    <div class="col-md-6">
			<label>작성일</label>
			<% String Regdate=notice.getRegdate();%>
			<p><%=Regdate.substring(0,10)%></p>
	    </div>
		</div>
		<div id="grid" class="form-group">
			<label class="text-left p-l-30 p-t-10"><%=notice.getTitle() %></label>
			<textarea id="content" readonly><%=notice.getContent() %></textarea>
		</div>
  		<button type="button" class="btn btn-dark" onClick="history.back()">돌아가기</button>
	</form>
</div>
<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp"%>
<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp"%>
<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp"%>

</body>
</html>