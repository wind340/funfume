<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.koreait.funfume.domain.Brand"%>
<%@page import="java.util.List"%>
<%
	Brand brand = (Brand)request.getAttribute("brand");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Funfume | brand</title>

  <%@ include file="../../admin_inc/head_link.jsp" %>
  
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/admin/dist//img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <%@ include file="../../admin_inc/navbar.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
   <%@ include  file="../../admin_inc/sidebar.jsp"%>
	
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
         <div class="row" id="editForm">
          <div class="col-12">
            
     <!-- general form elements -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Brand</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name="form1" enctype="multipart/form-data">
              	<input type="hidden" name="brand_id" value="<%=brand.getBrand_id()%>">
                <div class="card-body">
                  <div class="form-group">
                    <input type="text" class="form-control"  value="<%=brand.getBrand_name() %>" name="brand_name">
                  </div>
                  <div class="form-group">
                  기존 이미지
                  <img src="/resources/data/<%=brand.getBrand_img() %>" width="200px">
					<div id="preview">
					선택이미지
					</div>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" multiple name="imgFiles">
                        <label class="custom-file-label" for="exampleInputFile" >Choose file</label>
                      </div>
                    </div>
                  </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="bt_edit">수 정</button>
                  <button type="button" class="btn btn-info" id="bt_del">삭 제</button>
                  <button type="button" class="btn btn-info" onClick="location.href='/admin/brand/list';">목록</button>
                </div>
              </form>
            </div>
            <!-- /.card -->
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

<!-- bs-custom-file-input  파일 컴포넌트커스터마이징-->
<script src="/resources/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>


<script>
$(function () {
  bsCustomFileInput.init();
});
</script>

<script>
	//이미지 미리보기 버튼 이벤트
	$(function () {
	$("input[name='imgFiles']").change(function(){
		  preview2(this);
	});
	/*document.querySelector("input[name='imgFiles']").addEventListener("change",function(){
		  preview(this);
	}); */
	
		
		$("#bt_edit").click(function(){
		   	edit();
		   });
		   $("#bt_del").click(function(){
		   	del();
		   });
		 })

//제이쿼리로도 해본다 짧고 좋다!!
function preview2(obj){
	for(var i=0;i<obj.files.length;i++){
		var reader = new FileReader();
		reader.onload=function(e){
		 $("#preview").append($("<img src='"+e.target.result+"'width='100px'>"));
		}
		reader.readAsDataURL(obj.files[i]);
	}
}

//자바스크립트도 stream 지원된다
function preview(obj){
	console.log("이벤트 발생기킨 ",obj);
	console.log("objfile is ",obj.files);
	
	for(var i=0;i<obj.files.length;i++ ){
		//파일에 대한 접근방법 알았으니 실제파일 읽어와보자 그럴라면 스트림객체 필요함
		var reader = new FileReader();
		
		reader.onload=function(e){
			console.log("읽어들인 e", e);
		
		//div에 동적을 ㅗimg 돔을 생성해서 그 돔의...
		var img=document.createElement("img");
		img.src=e.target.result;
		img.style.width=100+"px";
		
		document.getElementById("preview").appendChild(img); //동적으로 이밎 돔을 div에 넣기
	}; //파일을 다 읽어들이면 익명함수 호출됨
	reader.readAsDataURL(obj.files[i]); //파일 읽어들이기
  }
}

function edit(){
	if(confirm("수정하시겠습니까?")){
		form1.action="/admin/brand/update";
		form1.method="post";
		form1.encoding="multipart/form-data";
		form1.submit();
	}
}
 
function del(){
	if(confirm("삭제하시겠습니까?")){
		location.href="/admin/brand/delete?brand_id=<%=brand.getBrand_id()%>";
	}	
}
</script>

</body>
</html>
