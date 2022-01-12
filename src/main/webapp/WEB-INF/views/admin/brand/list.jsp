<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.koreait.funfume.util.Pager"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.domain.Brand"%>
<%
	List<Brand> brandList = (List)request.getAttribute("brandList");
	Pager pager = (Pager)request.getAttribute("pager"); //페이징 처리객체
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Page</title>

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
              <li class="breadcrumb-item"><a href="/admin/main">Home</a></li>
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
                <h3 class="card-title">Brand Table</h3>

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
                      <th>브랜드</th>
                      <th>사진</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%int curPos=pager.getCurPos(); %>
                	<%int num=pager.getNum(); %>
                    <%for(int i=1;i<=pager.getPageSize();i++){ %>
                    <%if(num<1)break;%>
                    <%Brand brand = brandList.get(curPos++); %>
                    <tr>
                      <td><%=num-- %></td>
                      <td>
                        <!-- 링크걸어서 등록폼으로 넘어가자 -->
                      	<a href="/admin/brand/detail?brand_id=<%=brand.getBrand_id()%>"><%=brand.getBrand_name() %></a>
                      </td>
                      <td>
                      	<%if(brand.getBrand_img()!= null) {%>
                      		<img src="/resources/data/<%=brand.getBrand_img() %>" width="100px">
                      <%} %>
                      </td>
                    </tr>
                    <%} %>
                    <tr>
                    	<td colspan="4">
                    		<button type="button" class="btn btn-info" onClick="location.href='/admin/brand/registform';">브랜드 등록</button>
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


</body>
</html>
