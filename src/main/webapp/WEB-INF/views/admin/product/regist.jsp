<%@ page contentType="text/html;charset=UTF-8"%>
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
            <h1 class="m-0">Dashboard</h1>
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
                <h3 class="card-title">Quick Example</h3>
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
	                    		<option value= "1">1</option>
	                    		<option value= "2">2</option>
	                    		<option value= "3">3</option>
	                    	</select>
                    </div>
                    <div class="form-group">
                    	<select name ="note_id">
                    		<option>노트</option>
                    		<option>1</option>
                    		<option>2</option>
                    		<option>3</option>
                    	</select>
                    </div>
                    <div class="form-group">
                    	<select name ="accord_id">
                    		<option>향</option>
                    		<option>1</option>
                    		<option>2</option>
                    		<option>3</option>
                    	</select>
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

  
function regist(){
	 $("form[name='form1']").attr({
		action: "/admin/product/regist",
		method: "post",
		enctype: "multipart/form-data"
	 });
	 $("form[name='form1']").submit();
  }
  
//제이쿼리로도 처리해본다
function preview2(obj){
	  for(var i=0; i<obj.files.length;i++){
		  var reader = new FileReader();
		  reader.onload=function(e){
			  
			  $("#preview").append($("<img src='"+e.target.result+"' width='100px'>"));
		  }
		  reader.readAsDataURL(obj.files[i]);
	  }
  }
 
//자바스크립트도 stream이 지원된다..
function preview(obj){
	console.log("이벤트를 발생시킨 컴포넌트는,",obj);
	console.log("obj.files는", obj.files);
	
	for(var i=0;i<obj.files.length;i++){
		//파일에 대한 접근 방법을 알았으니, 지금부터는 실제 파일을 읽어와보자!! 그러기 위해서는 스트림이 필요하다
		var reader = new FileReader();
		reader.onload=function(e){
		 console.log("읽어들인 정보는: ",e);
		 
		 //div에 동적으로 img 돔을 생성하여 그 돔의 src속성에 e.target.result
		 var img = document.createElement("img");
		 img.src=e.target.result;
		 img.style.width=100+"px";
		 document.getElementById("preview").appendChild(img);//동적으로 이미지 돔을 div에 넣기!!
		};//파일을 다 읽어들이면, 익명함수 호출...
		
		reader.readAsDataURL(obj.files[i]); //파일 읽어들이기...
	}
  }
  
var uploadFiles = [];
var $drop = $("#drop");

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
	
	
	formData.append('product_name', $("input[name='product_name']").val());
	formData.append('price', 		$("input[name='price']").val());
	formData.append('brand_id', 	$("select[name='brand_id']").val());
	formData.append('gender_id', 	$("select[name='gender_id']").val());
	formData.append('introduction', $("textarea[name='introduction']").val());
	
	
 	$.ajax({
		url: '/admin/product/regist',
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
