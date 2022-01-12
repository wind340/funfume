<%@page import="com.koreait.funfume.domain.Brand"%>
<%@page import="com.koreait.funfume.domain.Accord"%>
<%@page import="com.koreait.funfume.domain.Note"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
List<Note> noteList = (List)request.getAttribute("noteList");
List<Accord> accordList = (List)request.getAttribute("accordList");
List<Brand> brandList = (List)request.getAttribute("brandList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>AdminLTE 3 | Dashboard</title>
	
	<%@ include file="../../admin_inc/head_link.jsp" %>
	
	<!-- CodeMirror -->
	<link rel="stylesheet" href="/resources/admin/plugins/codemirror/codemirror.css">
	<link rel="stylesheet" href="/resources/admin/plugins/codemirror/theme/monokai.css">	
	
	<!-- summernote -->
	<link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<style>
	.drag-over { background-color: #ff0; }
	.thumb { width:200px; padding:5px; float:left; }
	.thumb > img { width:100%; }
	.thumb > .close { position:absolute; background-color:red; cursor:pointer; }
	</style>


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
            <h1 class="m-0"></h1>
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
              <div class="card-header">
                <h3 class="card-title">제품 등록</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form1" id="form1">
                <div class="card-body">
                
                  
                  <div class="form-group">
                    <input type="text" class="form-control"  placeholder="상품명 입력.." name="product_name">
                  </div>
                  
                  <div class="form-group">
                   		<input type="text" class="form-control"  placeholder="가격 입력.." name="price">
                  </div>
                  <div class="form-group">
	                    	<select name ="brand_id">
	                    		<option >브랜드</option>
	                    		<%for(int i =0; i<brandList.size();i++){ %>
	                    		<%Brand brand = brandList.get(i); %>	                    		
	                    		<option value= "<%=brand.getBrand_id()%>"><%=brand.getBrand_name() %></option>
	                    		<%} %>
	                    	</select>
                    </div>
                    <div class="form-group">
						<p>탑 노트↓</p>
						<% for(int i =0;i<noteList.size();i++){ %>
						<% Note note = noteList.get(i); %>
							<label><input type="checkbox" name="top_note" value="<%=note.getNote_id()%>"> <%=note.getNote_name()%></label>
						<%} %>
						<p>미들 노트↓</p>
						<% for(int i =0;i<noteList.size();i++){ %>
						<% Note note = noteList.get(i); %>
							<label><input type="checkbox" name="middle_note" value="<%=note.getNote_id()%>"> <%=note.getNote_name()%></label>
						<%} %>
						<p>베이스 노트↓</p>
						<% for(int i =0;i<noteList.size();i++){ %>
						<% Note note = noteList.get(i); %>
							<label><input type="checkbox" name="base_note" value="<%=note.getNote_id()%>"> <%=note.getNote_name()%></label>
						<%} %>
						
                    </div>
                    <div class="form-group">
						<p>향↓</p>
						<% for(int i =0;i<accordList.size();i++){ %>
						<% Accord accord = accordList.get(i); %>
							<label><input type="checkbox" name="accord" value="<%=accord.getAccord_id()%>"> <%=accord.getAccord_name()%></label>
						<%} %>
                    </div>
                    <div class="form-group">
                    	<select name ="gender_id">
                    		<option >gender</option>
                    		<option value="1">male</option>
                    		<option value="2">female</option>
                    		<option value="3">unisex</option>
                    	</select>
                    </div>
                  
                  <div class="form-group">
                  	<textarea id="introduction" name="introduction">상품 소개</textarea>
               	  </div>
               	  
                  <div class="form-group">
					<div id="drop" style="border:1px solid black; width:800px; height:300px; padding:3px">
						여기로 drag & drop
					<div id="thumbnails">
					</div>
					<input type="hidden" id ="datas" name="datas" value="">
					</div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="bt_regist">등록</button>
                  <button type="button" class="btn btn-info" onClick="history.back()">목록</button>
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

<script src="/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>

<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
<script>
var uploadFiles = [];
var uploadTopNotes=[];
var uploadMiddleNotes=[];
var uploadBaseNotes=[];
var uploadAccords =[];
var $drop = $("#drop");

  $(function () {
    // Summernote
    $('#introduce').summernote()
    $('#detail').summernote()
    
    //이미지 미리보기 버튼 이벤트
  $("input[name='imgFiles']").change(function(){
    	preview2(this);
    });  
    /*
    document.querySelector("input[name='imgFiles']").addEventListener("change",function(){
    	preview(this);
    }); 
    */
/*     $("#bt_regist").click(function(){
    	regist();
    }); */
  })


  


$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
	$(this).addClass('drag-over');
}).on("dragleave", function(e) { //드래그 요소가 나갔을때
	$(this).removeClass('drag-over');
}).on("dragover", function(e) {
	e.stopPropagation();
	e.preventDefault();
}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
	e.preventDefault();
	$(this).removeClass('drag-over');
	var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
	for(var i = 0; i < files.length; i++) {
		var file = files[i];
		var size = uploadFiles.push(file); //업로드 목록에 추가
		preview(file, size - 1); //미리보기 만들기
	}
});
function preview(file, idx) {
	var reader = new FileReader();
	reader.onload = (function(f, idx) {
		return function(e) {
			var div = '<div class="thumb"> \
			<div class="close" data-idx="' + idx + '">X</div> \
			<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
			</div>';
			$("#thumbnails").append(div);
		};
	})(file, idx);
	reader.readAsDataURL(file);
}
	
$("#bt_regist").on("click", function() {
	var formData = new FormData(); //폼을 대체할 것ㄷ임 
	
	$.each(uploadFiles, function(i, file) {
		if(file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
		formData.append('imgFiles', file, file.name);
		console.log(file);
		console.log(file.name);
	});
	
	$("input[name='top_note']:checked").each(function(){
		var top_note = $(this).val();
		uploadTopNotes.push(top_note);
	});
	
	$("input[name='middle_note']:checked").each(function(){
		var middle_note = $(this).val();
		uploadMiddleNotes.push(middle_note);
	});
	$("input[name='base_note']:checked").each(function(){
		var base_note = $(this).val();
		uploadBaseNotes.push(base_note);
	});
	
	$("input[name='accord']:checked").each(function(){
		var accord = $(this).val();
		uploadAccords.push(accord);
	});
	
	
	formData.append('product_name', $("input[name='product_name']").val());
	formData.append('price', 		$("input[name='price']").val());
	formData.append('brand_id', 	$("select[name='brand_id']").val());
	
	formData.append('uploadTopNotes', uploadTopNotes);
	formData.append('uploadMiddleNotes',uploadMiddleNotes);
	formData.append('uploadBaseNotes', uploadBaseNotes);
	formData.append('uploadAccords', uploadAccords);
	
	formData.append('gender_id', 	$("select[name='gender_id']").val());
	formData.append('introduction', $("textarea[name='introduction']").val());
	
	
 	$.ajax({
		url: '/admin/product/regist2',
		data : formData,
		type : 'post',
		contentType : false,
		processData: false,
		success : function(ret) {
			alert("완료");
			location.href="/admin/product/list";
		}
	}); 
	
});
	$("#thumbnails").on("click", ".close", function(e) {
	var $target = $(e.target);
	var idx = $target.attr('data-idx');
	uploadFiles[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
	$target.parent().remove(); //프리뷰 삭제
	});  

</script>

</body>
</html>
