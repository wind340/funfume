<%@page import="com.koreait.funfume.domain.NoteType"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<NoteType> noteTypeList = (List)request.getAttribute("noteTypeList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Funfume | notetype</title>
	
	<%@ include file="../../../admin_inc/head_link.jsp" %>
	
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <%@ include file="../../../admin_inc/navbar.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@ include file="../../../admin_inc/sidebar.jsp" %>  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0" >Note</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/main">Home</a></li>
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
        <div class="row" ralign="cente">
          <div class="col-6">
            <div class="card card-danger">
              <div class="card-header" >
                <h3 class="card-title center">타입 목록</h3>
               </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-hover" >
                  <tbody align="center">
                    <% for(NoteType noteType : noteTypeList){ %>
                    <tr data-widget="expandable-table" aria-expanded="true">
                   		<td onClick="location.href='/admin/note/type/detail?note_type_id=<%=noteType.getNote_type_id()%>'">
                   		<a href="#"><%=noteType.getNote_type_name() %></a>
					<%} %>
						</td>
                   </tbody> 
				<tfoot>
					<td align="center">
       					<button type="button" class="btn btn-warning" onClick="location.href='/admin/note/type/registForm';">노트 타입 등록</button>
       					<button type="button" class="btn btn-info" onClick="location.href='/admin/note/list';">노트 목록</button>
					</td>
				</tfoot>
				</table>
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
  
  <%@ include file="../../../admin_inc/footer.jsp" %>  
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@ include file="../../../admin_inc/bottom_link.jsp" %>

</body>
</html>
