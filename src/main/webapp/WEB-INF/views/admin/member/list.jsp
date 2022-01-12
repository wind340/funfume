<%@page import="com.koreait.funfume.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.util.Pager"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Member> memberList = (List)request.getAttribute("memberList");//회원목록
	Pager pager = (Pager)request.getAttribute("pager"); //페이징 처리객체
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>FUNFUME | admin</title>
	
<%@ include file="../../admin_inc/head_link.jsp" %>
	
<script type="text/javascript">
$(function(){

})
function del(n){
	if(confirm("삭제하시겠습니까?")){
		location.href="/admin/member/delete?member_id="+n
	}
}

</script>
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
            <h1 class="m-0">회원 관리</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item">회원관리</li>
              <li class="breadcrumb-item active">회원정보</li>
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
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">회원정보조회</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>이름</th>
                      <th>이메일</th>
                      <th>주소</th>
                      <th>상세 주소</th>
                      <th>가입 일시</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<%int curPos=pager.getCurPos(); %>
                  	<%int num=pager.getNum(); %>
                    <%for(int i=1;i<=pager.getPageSize() ;i++){ %>
                    <%if(num<1)break;%>
                    <%Member member = memberList.get(curPos++); %>
                    <tr>
                      <td><%=num--%></td>
                      <td><%=member.getMember_name() %></td>
                      <td><%=member.getEmail() %></td>
                      <td><%=member.getAddr1() %></td>
                      <td><%=member.getAddr2() %></td>
                      <td><%=member.getReg_date() %></td>
                      <td>
                      	<button type="button" class="btn btn-info" id="bt_del<%=i%>" onClick="del(<%=member.getMember_id() %>)" style="width:50px; font-size:12px;">삭제</button>
                      	<button type="button" class="btn btn-info" id="bt_modify<%=i%>" 
                      	onClick="location.href='/admin/member/updateForm?member_id=<%=member.getMember_id() %>';" style="width:50px; font-size:12px;">수정</button>
                      </td>
                    </tr>
                    <%} %>
                  </tbody>
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

</div>
</div>



<%@ include file="../../admin_inc/footer.jsp" %>  
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->

<script>

</script>
<%@ include file="../../admin_inc/bottom_link.jsp" %>

</body>
</html>
