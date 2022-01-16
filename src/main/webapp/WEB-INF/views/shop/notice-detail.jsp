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
div#notice{
 text-align: center;
 margin: auto;
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
	<form name="form1">
	<div class="row row-cols-1 row-cols-md-5" id="notice" align="center">
		<div class="card border-secondary mb-2" style="max-width: 18rem;">
 				<div class="card-header">작성일</div>
 				<div class="card-body text-secondary">
   					<h5 class="card-title"><%=notice.getRegdate()%></h5>
  				</div>
		</div>
		<div class="card border-secondary mb-2" style="max-width: 18rem;">
  				<div class="card-header">작성자</div>
  				<div class="card-body text-secondary">
   					<h5 class="card-title"><%=notice.getWriter() %></h5>
  				</div>
		</div>
	    	
	    	<%-- <input type="text" name="title" placeholder="<%=notice.getTitle() %>" readonly="readonly">
	    	<label> 작성자 </label>
	    	<input type="text" name="title" placeholder="<%=notice.getWriter() %>" readonly="readonly">
	    	<label> 작성일 </label>
	    	<input type="text" name="title" placeholder="<%=notice.getRegdate()%>" readonly="readonly">
	    	<label> 내용 </label>
	    	<textarea id="subject" name="subject" style="height:200px"><%=notice.getContent() %></textarea> --%>
	</div>
	</form>

<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp"%>
<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp"%>
<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp"%>

</body>
</html>