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
<style>
div#notice_wrapper{
 text-align: center;
 margin: auto;
}

th {
  display: table-cell;
  vertical-align: inherit;
  font-weight: bold;
  text-align: center;
}
</style>
</head>
<body class="animsition">

<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>


	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>
		


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/notice.jpg'); ">
		<h2 class="ltext-105 cl0 txt-center">
			Notice
		</h2>
	</section>	

<!-- Main content 게시판 폼-->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row" id="notice_wrapper">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header" >
            	등록된 공지를 확인하세요
                  </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead align="center">
                    <tr>
                      <th>No</th>
                      <th class="col-6">제목</th>
                      <th>작성자</th>
                      <th>조회수</th>
                      <th>등록일</th>
                    </tr>
                  </thead>
                  <tbody id="dataList"></tbody>
                </table>
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
				tag+="<tr class='text-center'>"
				tag+="<td>"+(i+1)+"</td>";
				tag+="<td class='col-6'><a href='/notice-detail?notice_id="+json.notice_id+"'>"+json.title+"</a></td>";
				tag+="<td>"+json.writer+"</td>";
				tag+="<td>"+json.hit+"</td>";
				var regdate=json.regdate;
				tag+="<td>"+regdate.substring(0,10)+"</td>";
				tag+="</tr>";

				
			}
			$("#dataList").append(tag);
		}
	});
}
</script>

</body>
</html>