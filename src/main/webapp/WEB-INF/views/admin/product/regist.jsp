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
              <form name ="form1">
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
                    		<option >gender</option>
                    		<option value= "1">male</option>
                    		<option value= "2">female</option>
                    		<option value= "3">unisex</option>
                    	</select>
                    </div>
                  
                  <div class="form-group">
                  	<textarea id="introduction" name="introduction">
                  		상품 소개
              		</textarea>
               	  </div>
               	  
                  <div class="form-group">
                  <div id="preview"></div>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" multiple name="imgFiles">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
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
    $("#bt_regist").click(function(){
    	regist();
    });
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
</script>

</body>
</html>
