<%@page import="com.koreait.funfume.domain.ProductImg"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<% Product product= (Product)request.getAttribute("product"); 
	int div=0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>AdminLTE 3 | Detail</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<%@ include file="../../admin_inc/head_link.jsp" %>
	
	<!-- CodeMirror -->
	<link rel="stylesheet" href="/resources/admin/plugins/codemirror/codemirror.css">
	<link rel="stylesheet" href="/resources/admin/plugins/codemirror/theme/monokai.css">	
	
	<!-- summernote -->
	<link rel="stylesheet" href="/resources/admin/plugins/summernote/summernote-bs4.min.css">
	
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
                <h3 class="card-title">상세 보기</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form1">
              	<div id="hiddenImg">
	              	<%for(int i=0;i<product.getProductImgs().size();i++){%>
	              	<%ProductImg productImg = (ProductImg)product.getProductImgs().get(i); div=i; %>
	              	<input type="hidden" id="hidden<%=i%>" name="imgFiles<%=i%>" value="<%=productImg.getImg()%>">
					<%}%>
				</div>      	
                <div class="card-body">
                <input type="hidden" name ="product_id" value= <%=product.getProduct_id() %>>
                  
                  <div class="form-group">
                    <input type="text" class="form-control"  value="<%=product.getProduct_name() %>" name="product_name">
                  </div>
                  
                  <div class="form-group">
                   		<input type="text" class="form-control"  value="<%=product.getPrice() %>" name="price">
                  </div>
                  <div class="form-group">
	                    	<select name ="brand_id">
	                    		<option ><%=product.getBrand_id() %></option>
	                    		<option value= "1">1</option>
	                    		<option value= "2">2</option>
	                    		<option value= "3">3</option>
	                    	</select>
                    </div>
                    <div class="form-group">
                    	<select>
                    		<option>노트</option>
                    		<option>1</option>
                    		<option>2</option>
                    		<option>3</option>
                    	</select>
                    </div>
                    <div class="form-group">
                    	<select>
                    		<option>향</option>
                    		<option>1</option>
                    		<option>2</option>
                    		<option>3</option>
                    	</select>
                    </div>
                    <div class="form-group">
                    	<select name ="gender_id">
                    		<option ><%=product.getGender_id() %></option>
                    		<option value= "1">male</option>
                    		<option value= "2">female</option>
                    		<option value= "3">unisex</option>
                    	</select>
                    </div>
                  
                  <div class="form-group">
                  	<textarea id="introduction" name="introduction"><%=product.getIntroduction() %></textarea>
               	  </div>
               	  
                  <div class="form-group">
					<div id="drop" style="border:1px solid black; width:800px; height:300px; padding:3px">
						여기로 drag & drop
					<div id="thumbnails">
	                  <%-- 	<%for(int i=0;i<product.getProductImgs().size();i++){
	                  		ProductImg productImg= (ProductImg)product.getProductImgs().get(i);%>
	                  		<div class="thumb">
		                  	<div class="close" data-idx="<%=i%>">X</div>	
		                  	<img src="/resources/data/<%=productImg.getImg() %>"  />
	                  		</div>
	                  	<%} %> --%>					
					</div>
					</div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="btnSubmit">수정</button>
                  <button type="button" class="btn btn-info" id="bt_del">삭제</button>
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
var uploadFiles = []; //전송할 File 객체배열 
var $drop = $("#drop");
var cnt =<%=div%>;
  $(function () {
    // Summernote
    $('#introduce').summernote()
    $('#detail').summernote()
    
    $("#bt_update").click(function(){
    	update();
    });
    $("#bt_del").click(function(){
    	del();
    });
    
   <%for(int i=0; i< product.getProductImgs().size();i++){
    	ProductImg productImg= (ProductImg)product.getProductImgs().get(i);
    %>
    
    onloadPreview('<%=productImg.getImg()%>','<%=i%>');
    <%}%>
});
  
//온로드 미리보기
//이미지명 가상폴더에서 가져온 뒤 뿌리고 e.target.result를 file객체로 만들어서 폼데이터 append  
//이벤트 없이 서버에서 이미지를 가져와서 동적 출력 
function onloadPreview(img,idx){
	var xhttp=new XMLHttpRequest();
	
	xhttp.open("GET", "/resources/data/"+img, true);
	
	xhttp.responseType="blob";
	
	xhttp.onload=function(){
		var reader = new FileReader();
		
		reader.onload=function(e){
			//불려진 파일 데이터를 이용하여 파일 객체 생성하기 왜??  서버에 전송하기 위해 (formData 추가하려고...)
			var file = new File([xhttp.response], img);
			
			uploadFiles.push(file);  // java list.add();
			console.log("uploadFiles is "+uploadFiles);
			
			
			console.log("e : ", e);
			var div="<div class='thumb'><div class='close' data-idx='"+idx+"' \">X</div><img src='"+e.target.result+"' ></div>";
			$("#thumbnails").append(div);
			console.log(idx);
		}
		reader.readAsDataURL(xhttp.response);
	}
	xhttp.send();
}

/* function removeImg(obj){
	//uploadFiles에서 객체삭제 
	uploadFiles.splice(obj , 1);
} */

//Drag n' Drop
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


//드래그 한 이미지 미리보기 
function preview(file, idx) {
	var reader = new FileReader();
	reader.onload = (function(f, idx) {
		return function(e) {
			var div = '<div class="thumb"> \
			<div class="close" id="close" data-idx="' + idx + '">X</div> \
			<img src="' + e.target.result + '" title="' + escape(f.name) + '"/> \
			</div>';
			$("#thumbnails").append(div);
			console.log(idx);
		};
	})(file, idx);
	reader.readAsDataURL(file);
}

//수정
$("#btnSubmit").on("click", function() {
	var formData = new FormData();
	$.each(uploadFiles, function(i, file) {
		if(file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
		formData.append('imgFiles', file, file.name);
	});
	
	formData.append('product_id', 	$("input[name='product_id']").val());
	formData.append('product_name', $("input[name='product_name']").val());
	formData.append('price', 		$("input[name='price']").val());
	formData.append('brand_id', 	$("select[name='brand_id']").val());
	formData.append('gender_id', 	$("select[name='gender_id']").val());
	formData.append('introduction', $("textarea[name='introduction']").val());	
	
	$.ajax({
		url: '/admin/product/update',
		data : formData,
		type : 'post',
		contentType : false,
		processData: false,
		success : function(result,status,xhr) {
			alert("수정 완료");
			location.href="/admin/product/detail?product_id="+<%=product.getProduct_id()%>;
		}
	});
});

//미리보기 삭제
$("#thumbnails").on("click", ".close", function(e) {
	var $target = $(e.target);
	var idx = $target.attr('data-idx');
	uploadFiles[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
	$target.parent().remove(); //프리뷰 삭제
});
/* 			 백업 $("#preview").append($("<img src='"+e.target.result+"' width='100px'>")); */


//삭제하기
function del(){
	if(confirm('삭제하시겠어요?')){
		$("form[name='form1']").attr({
			action: "/admin/product/delete",
			method: "get",
		});
		$("form[name='form1']").submit();	
	}
}  
</script>

</body>
</html>
