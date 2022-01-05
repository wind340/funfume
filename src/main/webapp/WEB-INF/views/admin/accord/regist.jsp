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
            <h1 class="m-0">향기 등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/accord/list">향기목록</a></li>
              <li class="breadcrumb-item active">향기 등록</li>
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
                <h3 class="card-title">향기 등록</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form name ="form1">
                <div class="card-body">
                
<!--                 <div class="form-group">
                    <input type="number" class="form-control"  placeholder="No." name="accord_id" min="1">
                  </div> -->
                  
                  <div class="form-group">
                    <input type="text" class="form-control name_input"  placeholder="향 입력.." name="accord_name">
                  </div>
                  <span class="name_input_re" style="color:red; font-size:14px; display:none;">이미 존재하는 향 입니다.</span>
                  <span class="name_input_re2" style="color:red; font-size:14px; display:none;">등록 가능한 향 입니다.</span>
                  
                  <div class="form-group">
                    <input type="text" class="form-control color_input"  placeholder="색상입력 ex) #ffff" name="accord_color">
                  </div>
                  <span class="color_input_re" style="color:red; font-size:14px; display:none;">이미 존재하는 색상입니다.</span>
                  <span class="color_input_re2" style="color:red; font-size:14px; display:none;">등록 가능한 색상입니다.</span>
                 
                <div class="card-footer">
                  <button type="button" class="btn btn-info" id="bt_regist">등록</button>
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

    $("#bt_regist").click(function(){
    	regist();
    });
  })
  
  function regist(){
   	 $("form[name='form1']").attr({
   		action: "/admin/accord/regist",
   		method: "post",
   	 });
   	 
   	 $("form[name='form1']").submit();
   }
  
  
  //이름중복검사
 /*  $('.name_input').on("propertychange change keyup paste input", function(){

	  var accord_name = $('.name_input').val(); // .name_input에 입력되는 값 받아오기
	  var data = {accord_name : accord_name} // 컨트롤에 넘길 데이터 이름 : 데이터(.name_input에 입력되는값)
  
	  $.ajax({
		  type : "post",
		  url :"/accord/accordCheck",
		  data:data,
		  success:function(result){
			if(result !='fail'){
				$('.name_input_re2').css("display"."inline-block");
				$('.name_input_re1').css("display"."none");
			}else{
				$('.name_input_re1').css("display"."inline-block");
				$('.name_input_re2').css("display"."none");
			}
		  }
	  });
  }); */
  
</script>

</body>
</html>
