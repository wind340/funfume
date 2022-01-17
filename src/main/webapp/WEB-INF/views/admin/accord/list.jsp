<%@page import="com.koreait.funfume.domain.Accord"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.util.Pager"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Accord> accordList = (List)request.getAttribute("accordList");//상품목록
	Pager pager = (Pager)request.getAttribute("pager"); //페이징 처리객체
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Funfume | accord</title>
	
<%@ include file="../../admin_inc/head_link.jsp" %>
	
<script type="text/javascript">
$(function(){

})
function del(n){
	if(confirm("삭제하시겠습니까?")){
		location.href="/admin/accord/delete?accord_id="+n
	}
}
/* function modify(n){
	location.href="/admin/accord/detail?accord_id="+n
}  */

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
            <h1 class="m-0">향기 목록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item">상품관리</li>
              <li class="breadcrumb-item active">향기목록</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

<!-- 향 select -->
<!-- <section>
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">향기 검색</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          /.card-header
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Minimal</label>
                  <select class="form-control select2bs4" style="width: 100%;">
                    <option selected="selected">Alabama</option>
                    <option>Alaska</option>
                    <option>California</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                /.form-group
                <div class="form-group">
                  <label>Disabled</label>
                  <select class="form-control select2bs4" disabled="disabled" style="width: 100%;">
                    <option selected="selected">Alabama</option>
                    <option>Alaska</option>
                    <option>California</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                /.form-group
              </div>
              /.col
              <div class="col-md-6">
                <div class="form-group">
                  <label>Multiple</label>
                  <select class="select2bs4" multiple="multiple" data-placeholder="Select a State"
                          style="width: 100%;">
                    <option>Alabama</option>
                    <option>Alaska</option>
                    <option>California</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                /.form-group
                <div class="form-group">
                  <label>Disabled Result</label>
                  <select class="form-control select2bs4" style="width: 100%;">
                    <option selected="selected">Alabama</option>
                    <option>Alaska</option>
                    <option disabled="disabled">California (disabled)</option>
                    <option>Delaware</option>
                    <option>Tennessee</option>
                    <option>Texas</option>
                    <option>Washington</option>
                  </select>
                </div>
                /.form-group
              </div>
              /.col
            </div>
            /.row
          </div>
          /.card-body
          <div class="card-footer">
          </div>
        </div>
</section> -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">향기 목록 조회</h3>

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
                      <th>향</th>
                      <th>컬러</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                  	<%int curPos=pager.getCurPos(); %>
                  	<%int num=pager.getNum(); %>
                    <%for(int i=1;i<=pager.getPageSize() ;i++){ %>
                    <%if(num<1)break;%>
                    <%Accord accord = accordList.get(curPos++); %>
                    <tr>
                      <td><%=num--%></td>
                      <td><%=accord.getAccord_name() %></td>
                      <td><%=accord.getAccord_color() %></td>
                      <td>
                      	<button type="button" class="btn btn-info" id="bt_del<%=i%>" onClick="del(<%=accord.getAccord_id() %>)" style="width:50px; font-size:12px;">삭제</button>
                      	<button type="button" class="btn btn-info" id="bt_modify<%=i%>" 
                      	onClick="location.href='/admin/accord/updateForm?accord_id=<%=accord.getAccord_id() %>';" style="width:50px; font-size:12px;">수정</button>
                      </td>
                    </tr>
                    <%} %>
                    <tr>
                    	<td colspan="4">
                    		<button type="button" class="btn btn-info" onClick="location.href='/admin/accord/registForm';">향기 등록</button>
                    		
                    	</td>
                    </tr>
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
