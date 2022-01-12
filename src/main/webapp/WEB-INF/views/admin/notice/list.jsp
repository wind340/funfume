<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
	
	<%@ include file="../../admin_inc/head_link.jsp" %>

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
            <h1 class="m-0">공지 게시판</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
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
              <div class="card-header" >
            	등록된 공지를 확인하세요
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="button" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
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
                  		<button type="button" class="btn btn-info" onClick="location.href='/admin/notice/registForm';">공지등록</button>
              </div>
              <!-- /.card-body -->
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
				tag +="<td><a href='/admin/notice/detail?notice_id="+json.notice_id+"'>"+json.title+"</a></td>"; //rest아니게 넣어줘야 디테일에서 비동기처럼 돌아감 
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
