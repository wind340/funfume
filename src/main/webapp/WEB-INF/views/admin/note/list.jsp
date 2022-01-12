<%@page import="com.koreait.funfume.domain.NoteType"%>
<%@page import="com.koreait.funfume.domain.Note"%>
<%@page import="com.koreait.funfume.util.Pager"%>
<%@page import="com.koreait.funfume.domain.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Note> noteList = (List)request.getAttribute("noteList");//상품목록
	Pager pager = (Pager)request.getAttribute("pager"); //페이징 처리객체
	List<NoteType> noteTypeList = (List)request.getAttribute("noteTypeList");

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Funfume</title>
	
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
            <h1 class="m-0" >Note</h1>
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
        
   		<div class="col-3">
            <div class="card text-center card-danger">
              <div class="card-header">
                <h3 class="card-title">타입 목록</h3>
               </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-hover" >
                  <tbody align="center" >
                    <% for(NoteType noteType : noteTypeList){ %>
                    <tr data-widget="expandable-table" aria-expanded="true">
                   		<td colspan="2">
							<a href="/admin/note/type/detail?note_type_id=<%=noteType.getNote_type_id()%>">
							<%=noteType.getNote_type_name() %></a>
						<td><button type="button" class="btn" style="border:1px solid LightGray;" onClick="searchType(<%=noteType.getNote_type_id()%>)">검색</button></td>

					<%} %>
						</td>
                   </tbody> 
				<tfoot>
					<td colspan="3">
       					<button type="button" class="btn btn-danger" onClick="location.href='/admin/note/type/registForm';">등록</button>
				
       					<button type="button" class="btn btn-danger" onClick="location.href='/admin/note/type/list';">목록</button>
					</td>
				</tfoot>
				</table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        
        
          <div class="col-8" align="center">
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">노트 목록</h3>

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
                      <th>Type</th>
                      <th>상품명</th>
                      <th>이미지</th>
                    </tr>
                  </thead>
                  <tbody>
	                  	<%int curPos=pager.getCurPos(); %>
	                  	<%int num=pager.getNum(); %>
	                    <%for(int i=1;i<=pager.getPageSize();i++){ %>
	                    <%if(num<1)break;%>
	                    <%Note note = noteList.get(curPos++); %>
                    <tr>
                      <td><%=num--%></td>
                      <td><%=note.getNoteType().getNote_type_name() %></a></td>
                      <td><a href="/admin/note/detail?note_id=<%=note.getNote_id()%>"><%=note.getNote_name() %></a></td>
                      <td><a href="/admin/note/detail?note_id=<%=note.getNote_id()%>">
                      <%if(note.getNote_img()!= null) {%>
                      		<img src="/resources/data/<%=note.getNote_img() %>" width="100px">
                      <%} %>
                      </a></td>
	                    
	                    <%} %>
                    </tr>
                   </tbody> 
                   <tfoot>
                   		<td colspan="8" align="center">
						<%-- <% if(pager.getCurrentPage()-1>0){ %>
								<a href="/admin/note/list.jsp?currentPage=<%=pager.getFirstPage()-1%>">이전페이지</a>
							<%}else{ %>
								<a href="javascript:alert('첫페이지입니다')"> 이전페이지</a>
							<% } %> --%>
							<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
								<%if(i>=pager.getTotalPage()+1)break;%>
								<a href="/admin/note/list.jsp?currentPage=<%=i%>" <%if(i==pager.getCurrentPage()){ %> class="pageNum" <%}%>>
									[<%=i%>]
								</a>
							<%}%>
					     			<%-- <%if(pager.getLastPage()+1 > pager.getTotalPage()){ %>
					             				<a href="javascript:alert('다음페이지가 없습니다')"></a>
					             			<%} else{ %>
								<a href="/admin/note/list.jsp?currentPage=<%=pager.getLastPage()+1%>">다음페이지</a>
					             			<%} %> --%>
             			</td>
					</tfoot>
				</table>
          		<div align="center">
       				<button type="button" class="btn btn-warning" onClick="location.href='/admin/note/registForm';">노트등록</button>
				</div>
					
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

function searchType(n){
	location.href="/admin/note/selectType?note_type_id="+n;
}

</script>
</body>
</html>
