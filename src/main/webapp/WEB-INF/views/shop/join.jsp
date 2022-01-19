<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<!--  Head Link -->
<%@ include file="../shop_inc/head_link.jsp"%>	
</head>
<body class="animsition">
	
	<!-- Header -->
<%@ include file="../shop_inc/header.jsp" %>
	<!-- Cart -->
<%@ include file="../shop_inc/cart.jsp" %>

     <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
       	
        
        <!-- Note Regist Form  begin-->
          <div class="col-9">
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">INPUT</h3>
              </div>
              <!-- /.card-header -->
              <form name ="form1">
                <div class="card-body">
                  <div class="form-group">
                    <input type="text" class="form-control"  placeholder="이름을 입력하세요" name="member_name">
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control"  placeholder="id는 email입니다" name="email">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control" id="pass1" placeholder="비밀번호를 입력하세요" name="pass">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control" id="pass2"  placeholder="비밀번호를 한번더 입력하세요" name="passCheck">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="주소를 입력하세요" name="addr1">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="상세주소를 입력하세요" name="addr2">
                  </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="button" class="btn btn-warning" onClick="regist()">등록</button>
                  <button type="button" class="btn btn-warning" onClick="history.back()">취소</button>
                </div>
              </form>
            </div>
            </div>
            <!-- /.card -->
          </div>
        </div>
        
        <!-- /.row (main row) -->
	    </section>
      </div>
      <!-- /.container-fluid -->
    <!-- /.content -->
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->


	<!-- Footer -->
<%@ include file="../shop_inc/footer.jsp" %>
	<!-- Back to top -->
<%@ include file="../shop_inc/back_to_top.jsp" %>
	<!-- Bottom_link -->
<%@ include file="../shop_inc/bottom_link.jsp" %>

<script>
function regist(){
	//유효성 체크 
	if($("input[name='member_name']").val()==""){
		alert("이름은 필수입니다");
		return;
	}
	if($("input[name='email']").val()==""){
		alert("이메일 입력은 필수입니다");
		return;	
	}
	if($("input[name='pass']").val()==""){
		alert("비밀번호 입력은 필수입니다");
		return;
	}
	if($("input[name='pass']").val()!=$("input[name='passCheck']").val()){
		alert("비밀번호가 일치하지 않습니다. 다시확인해주세요");
	}
	
	 $("form[name='form1']").attr({
		action: "/join",
		method: "post"
	 });
	 $("form[name='form1']").submit();
  }
</script>
</body>
</html>
