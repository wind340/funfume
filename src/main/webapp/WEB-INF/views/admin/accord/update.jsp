<%@page import="com.koreait.funfume.util.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.domain.Accord"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
	<%
	Accord accord = (Accord)request.getAttribute("accord");
	%>
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
            <h1 class="m-0">향기 등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">향기목록</a></li>
              <li class="breadcrumb-item active">향기 수정</li>
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
                <h3 class="card-title">향기 수정</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form1">
                <div class="card-body">
                
                <div class="form-group">
                    <input type="hidden" class="form-control" value="<%=accord.getAccord_id() %>" name="accord_id"  min="1">
                  </div>
                  
                  <div class="form-group">
                    <input type="text" class="form-control" value="<%=accord.getAccord_name() %>"   name="accord_name">
                  </div>
                  
                  <div class="form-group">
                    <input type="text" class="form-control"  value="<%=accord.getAccord_color() %>" name="accord_color">
                  </div>
                 

                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="bt_update">저장</button>
                  <button type="button" class="btn btn-info" onClick="history.back()">목록</button>
                </div>
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

<script>

$(function () {
    $("#bt_update").click(function(){
    	update();
    });
  })
  
function update(){
	if(confirm("수정하시겠습니까?")){
		form1.action="/admin/accord/update";
		form1.method="post";
		form1.submit();
	}
  }


</script>

</body>
</html>
