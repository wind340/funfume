<%@page import="com.koreait.funfume.domain.ProductImg"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@page import="com.koreait.funfume.domain.OrderDetail"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<OrderDetail> orderDetailList = (List)request.getAttribute("orderDetailList");
%>
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
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
              제품 목록
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
              <!-- card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table text-nowrap">
                    <tr class="table_head" align="center">
                      <th>No</th>
                      <th>상품명</th>
                      <th>상품금액</th>
                      <th>주문수량</th>
                      <th>주문상품</th>
                    </tr>
					<%int i=1; %>
					<% for (OrderDetail orderDetail : orderDetailList){%>
					<% Product product = (Product)orderDetail.getProduct(); %>
					<tr class="table_row" align="center">
					<td><%=i++ %></td>
					<td ><%=product.getProduct_name() %></td>
					<td><%=product.getPrice() %></td>
					<td ><%=orderDetail.getEa() %></td>
					<%ProductImg productImg = (ProductImg)product.getProductImgs().get(0); %>
					<td><img src="/resources/data/<%=productImg.getImg() %>" style="width: 200px"></td>
					</tr>
						<% }%>
                </table>
              </div>
            </div>
          </div>
        </div>
        
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