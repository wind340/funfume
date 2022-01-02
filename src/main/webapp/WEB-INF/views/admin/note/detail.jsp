<%@page import="com.koreait.funfume.domain.NoteType"%>
<%@page import="com.koreait.funfume.domain.Note"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Note note = (Note)request.getAttribute("note");
	NoteType noteType = (NoteType)request.getAttribute("noteType");
%>

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
            <h1 class="m-0">NOTE</h1>
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
          <div class="col-9">
          
          
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">Detail</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form">
                <div class="card-body">
                  <div class="form-group">
                   	<input type="hidden" name="note_id" value="<%=note.getNote_id()%>">
	               	<input type="hidden" name="note_img" value="<%=note.getNote_img()%>">
               	
                   <%--  <input type="text" class="form-control" name="note_type_name" value="<%=note.getNoteType().getNote_type_name()%>" > --%>
                    <input type="text" class="form-control" name="note_name" value="<%= note.getNote_name() %>" >
                  </div>
                                   	  
                  <div class="form-group">
                  기존 이미지
                  <img src="/resources/data/<%=note.getNote_img() %>" width="200px">
                  <div id="preview">
                  선택이미지
                  </div>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" name="noteFile" value="#">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                
                  <button type="button" class="btn btn-warning" id="bt_edit">수정</button>
                  <button type="button" class="btn btn-warning" id="bt_del">삭제</button>
                  <button type="button" class="btn btn-warning" onClick="location.href='/admin/note/list';">목록</button>
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


<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<script>

 $(function () {
    //이미지 미리보기 버튼 이벤트
  $("input[name='noteFile']").change(function(){
    	preview(this);
    });  

    $("#bt_edit").click(function(){
    	edit();
    });
    $("#bt_del").click(function(){
    	del();
    });
  })

function preview(obj){
	  
		  var reader = new FileReader();
		  reader.onload=function(e){
			  
			  $("#preview").append($("<img src='"+e.target.result+"' width='400px'>"));
			  
		  }
		  reader.readAsDataURL(obj.files[0]);
	  
  }


function edit(){
	if(confirm("수정하시겠습니까?")){
		form.action="/admin/note/update";
		form.method="post";
		form.encoding="multipart/form-data";
		form.submit();
	}
}
 
function del(){
	if(confirm("삭제하시겠습니까?")){
		location.href="/admin/note/delete?note_id=<%=note.getNote_id()%>";
	}	
}

</script>

</body>
</html>
