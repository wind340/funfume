<%@page import="com.koreait.funfume.domain.Member"%>
<%@page import="com.koreait.funfume.domain.OrderDetail"%>
<%@page import="com.koreait.funfume.domain.OrderSummary"%>
<%@page import="com.koreait.funfume.util.Pager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<OrderSummary> orderSummaryList = (List)request.getAttribute("orderSummaryList");//상품목록
	Pager pager = (Pager)request.getAttribute("pager"); //페이징 처리객체
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
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-12">
            <div class="card card-info">
              <div class="card-header" >
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
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>주문일자</th>
                      <th>결제금액</th>
                      <th>결제수단</th>
                      <th>결제회원이름</th>
                      <th>자세히 보기</th>                      
                    </tr>
                  </thead>
                  <tbody>
                  	<%int curPos=pager.getCurPos(); %>
                  	<%int num=pager.getNum(); %>
                    <%for(int i=1;i<=pager.getPageSize() ;i++){ %>
                    <%if(num<1)break;%>
                    <%OrderSummary summary = orderSummaryList.get(curPos++); %>
                    <tr href="/admin/order/detail?order_summary_id=<%=summary.getOrder_summary_id()%>">
                    	<td><%=num--%></td>
						<td><%=summary.getOrderdate() %></td>
						<td><%=summary.getTotalpay() %></td>
						<td><%=summary.getPaymethod().getMethod() %></td>
						<td><%=summary.getMember().getMember_name()%></td>
                    <td>
                    <button type="button" onClick="detail(<%=summary.getOrder_summary_id()%>)" class="btn btn-outline-secondary" > view </button></td>
                    <%} %>
                    </tr>
                  </tbody>
                   <tfoot>
                   		<td colspan="8" align="center">
							<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
								<%if(i>=pager.getTotalPage()+1)break;%>
								<a href="/admin/order/list?currentPage=<%=i%>" <%if(i==pager.getCurrentPage()){ %> class="pageNum" <%}%>>
									[<%=i%>]
								</a>
							<%}%>
             			</td>
					</tfoot>                  
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
<script>
function detail(n){
	location.href="/admin/order/detail?order_summary_id="+n;
}
</script>
</body>
</html>
