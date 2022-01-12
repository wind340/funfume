<%@page import="com.koreait.funfume.domain.Notice"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Noticeboard</title>
	
	<%@ include file="../../admin_inc/head_link.jsp" %>
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <%@ include file="../../admin_inc/navbar.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@ include file="../../admin_inc/sidebar.jsp" %>  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">공지사항 등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Noticeboard </li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">공지를 등록하세요</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name="form1">
              	<input type="hidden" name="_method" value="PUT">
              	<input type="hidden" name="notice_id" value="<%=notice.getNotice_id()%>">
                <div class="card-body">
                
                  <div class="form-group">
                    <input type="text" class="form-control" value="<%=notice.getTitle() %>" name="title">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" value="<%=notice.getWriter() %>" name="writer">
                  </div>
                  <div class="form-group">
                    <textarea class="form-control" name="content" ><%=notice.getContent() %></textarea>
                  </div>
     
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="bt_edit">글 수정</button>
                  <button type="button" class="btn btn-info" id="bt_del">글 삭제</button>
                  <button type="button" class="btn btn-info" onClick="location.href='/admin/notice/list';">목록</button>
                </div>
              </form>
            </div>
            
            <!-- /.card -->
          </div>
        </div>
        
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <%@ include file="../../admin_inc/footer.jsp" %>  
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@ include file="../../admin_inc/bottom_link.jsp" %>

<!-- Summernote -->
<script src="/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>

<!-- bs-custom-file-input 파일컴포넌트 커스터마이징 -->
<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
<script>
 $(function () {
	
	$("#bt_edit").click(function(){
		if(confirm("수정하시겠습니까?")) {
			edit();
		}
	});
	
	$("#bt_del").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			del();
		}
	});
	
})

function edit(){
	 //비동기방식으로 글수정 요청을 시도하자!!
	 $.ajax({
		 url:"/admin/rest/notice",
		 type:"post",
		 data:{
			 _method:$("input[name='_method']").val() ,  //post지만 put으로 가는 꼼수...
			 notice_id:$("input[name='notice_id']").val() ,
			 title:$("input[name='title']").val(),
			 writer:$("input[name='writer']").val(),
			 content:$("textarea[name='content']").val()
		 },
		 success:function(result,status,xhr){
			 alert(result.msg);
			 if(result.code==1){
			 location.href="/admin/notice/list";
			 }
		}
 	});
}

 function del(){
	 $.ajax({
		 url:"/admin/rest/notice/"+$("input[name='notice_id']").val(),
		 type:"POST",
		 data:{
			 _method:"DELETE"
		 },
		 success:function(result, status, xhr){
			alert(result.msg);
			if(result.code==1){
				location.href="/admin/notice/list";
			}
		 }		 
	 });	 
 }
</script>
</body>
</html>
