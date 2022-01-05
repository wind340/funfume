<%@page import="com.koreait.funfume.domain.Admin"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<% 
	Admin admin =  (Admin)session.getAttribute("admin");
%>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="/resources/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/resources/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><%-- <%=admin.getName()%> --%>님 접속 중</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          
          <!-- 주메뉴 begin -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                상품관리
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            
            
            
            <!-- 자식메뉴 begin -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/category/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>브랜드</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/note/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>노트</p>
                </a>
              </li>
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/accord/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>향</p>
                </a>
              </li>
            </ul>
            <!-- 자식메뉴 end -->
              <!-- 자식메뉴 begin -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/product/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품</p>
                </a>
              </li>
            </ul>
            <!-- 자식메뉴 end -->
          
          </li>
          <!-- 주메뉴 end -->

          <!-- 주메뉴 begin -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                회원관리
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            
            
            <%for(int i=0;i<3;i++){%>
            <!-- 자식메뉴 begin -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/resources/admin/pages/layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
            </ul>
            <!-- 자식메뉴 end -->
            <%} %>
          </li>
          <!-- 주메뉴 end -->
          <!-- 주메뉴 begin -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                주문관리
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            
            
            <%for(int i=0;i<3;i++){%>
            <!-- 자식메뉴 begin -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/resources/admin/pages/layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
            </ul>
            <!-- 자식메뉴 end -->
            <%} %>
          </li>
          <!-- 주메뉴 end -->
          
          <!-- 주메뉴 begin -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                고객센터
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            
            
            <!-- 자식메뉴 begin -->
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/notice/list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지게시판</p>
                </a>
              </li>
            </ul>
            <!-- 자식메뉴 end -->
          </li>
          <!-- 주메뉴 end -->  
                  
        </ul>
        
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
