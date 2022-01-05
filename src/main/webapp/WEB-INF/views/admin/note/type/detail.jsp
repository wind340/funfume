<%@page import="com.koreait.funfume.domain.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.domain.NoteType"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	NoteType noteType = (NoteType)request.getAttribute("noteType");
	List<Note> selectType= (List)request.getAttribute("selectType");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
	
	<%@ include file="../../../admin_inc/head_link.jsp" %>
	
  <!-- CodeMirror -->
  <link rel="stylesheet" href="/resources/admin/plugins/codemirror/codemirror.css">
  <link rel="stylesheet" href="/resources/admin/plugins/codemirror/theme/monokai.css">	
  
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">

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
            <h1 class="m-0">NOTE TYPE</h1>
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
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">NOTE TYPE INPUT</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form">
                <div class="card-body">
                  <div class="form-group">
                 	<p>현재 <%=noteType.getNote_type_name()%>의 개수는 ' <%=selectType.size()%> '개 입니다 </p>
                 	<input type="hidden" id="type_num" value="<%=selectType.size()%>">
                    <input type="hidden" name="note_type_id" value="<%=noteType.getNote_type_id()%>" >
                    <input type="text" class="form-control" name="note_type_name" value="<%=noteType.getNote_type_name()%>" >
                 	<br>
                 	<p style="background-color:Tomato;">노트가 있는 경우 삭제 하실수 없습니다. 노트가 없을시 타입 삭제 가능합니다.<p>
                  </div>
                                   	  
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="button" class="btn btn-warning" onClick="edit()">수정</button>
                  <button type="button" class="btn btn-warning" onClick="del()">삭제</button>
                  <button type="button" class="btn btn-warning" onClick="location.href='/admin/note/type/list'">목록</button>
                  <button type="button" class="btn btn-warning" onClick="history.back()">돌아가기</button>
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
  
  <%@ include file="../../../admin_inc/footer.jsp" %>  
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@ include file="../../../admin_inc/bottom_link.jsp" %>

<script>
function edit(){
	if(confirm("수정하시겠습니까?")){
		form.action="/admin/note/type/update";
		form.method="post";
		form.submit();
	}
}

function del(){
	if($("#type_num").val()>0){
		alert("노트가 소속되어있어 삭제를 실패했습니다");
		return;
	} 
	if(confirm("삭제하시겠습니까?")){
		location.href="/admin/note/type/delete?note_type_id=<%=noteType.getNote_type_id()%>";
	}	
}
</script>

</body>
</html>
