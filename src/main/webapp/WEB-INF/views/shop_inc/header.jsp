<%@page import="java.util.List"%>
<%@page import="com.koreait.funfume.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<% Member member = (Member)session.getAttribute("member"); %>

<header class="header-v4">
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
				<%if(member!=null) {%>
					<span id="helloMsg" style="display:"> FUNFUME :: <%=member.getMember_name()%>님 환영합니다</span>
				<%} %>
				</div>

				<div class="right-top-bar flex-w h-full">
					<a href="#" class="flex-c-m trans-04 p-lr-25">
						Help & FAQs
					</a>
				<%if(member==null){ %>
					<a href="/sign-in-form" class="flex-c-m trans-04 p-lr-25">
						Sign-in
					</a>
				<%}else{ %>
					<a href="/logout" id="logout" class="flex-c-m trans-04 p-lr-25">
						Log-out
					</a>
				<%} %>
				<%if(member!=null) {%>
					<a href="/myaccount" class="flex-c-m trans-04 p-lr-25">
						MY PAGE
					</a>
				<%} %>

					<!-- <a href="#" class="flex-c-m trans-04 p-lr-25">
						USD
					</a> -->
				</div>
			</div>
		</div>

		<div class="wrap-menu-desktop">
         <nav class="limiter-menu-desktop container">
            
            <!-- Logo desktop -->   
            <!-- 로고이미지랑 href 수정은 여기서!! -->   
            <a href="/" class="logo">
               <img src="/resources/images/FunFumeLogo1.jpg" alt="IMG-LOGO">
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
               <ul class="main-menu">
                  <li class="active-menu">
                     <a href="/">Home</a>
                  </li>
                  <li>
                     <a href="/shop">Shop</a>
                  </li>
                  <li>
                     <a href="/notice">Notice</a>
                  </li>

                  <li>
                     <a href="/about">About</a>
                  </li>

               </ul>
            </div>   

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
               <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                  <i class="zmdi zmdi-search"></i>
               </div>

               <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                  <i class="zmdi zmdi-favorite-outline"></i>
               </a>
            </div>
         </nav>
      </div>   
   </div>

   <!-- Header Mobile -->
   <div class="wrap-header-mobile">
      <!-- Logo moblie -->      
      <!-- 로고이미지랑 href 수정은 여기서!! -->
      <div class="logo-mobile">
         <a href="/"><img src="/resources/images/FunFumeLogo1.jpg"  alt="IMG-LOGO"></a>
      </div>

      <!-- Icon header -->
      <div class="wrap-icon-header flex-w flex-r-m m-r-15">
         <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
         </div>

         <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
            <i class="zmdi zmdi-favorite-outline"></i>
         </a>
      </div>

      <!-- Button show menu -->
      <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
         <span class="hamburger-box">
            <span class="hamburger-inner"></span>
         </span>
      </div>
   </div>


   <!-- Menu Mobile -->
   <div class="menu-mobile">
      <ul class="topbar-mobile">
         <li>
				<div class="left-top-bar">
				<%if(member!=null) {%>
					<span id="helloMsg" style="display:"> FUNFUME :: <%=member.getMember_name()%>님 환영합니다</span>
				<%} %>
				</div>

         </li>

         <li>
				<div class="right-top-bar flex-w h-full">
					<a href="#" class="flex-c-m trans-04 p-lr-25">
						Help & FAQs
					</a>
				<%if(member==null){ %>
					<a href="/sign-in-form" class="flex-c-m trans-04 p-lr-25">
						Sign-in
					</a>
				<%}else{ %>
					<a href="/logout" id="logout" class="flex-c-m trans-04 p-lr-25">
						Log-out
					</a>
				<%} %>
				<%if(member!=null) {%>
					<a href="/myaccount" class="flex-c-m trans-04 p-lr-25">
						MY PAGE
					</a>
				<%} %>

					<!-- <a href="#" class="flex-c-m trans-04 p-lr-25">
						USD
					</a> -->
				</div>
         </li>
      </ul>

      <ul class="main-menu-m">
         <li>
            <a href="/">Home</a>
            <!--<ul class="sub-menu-m">
                
               <li><a href="index.html">Homepage 1</a></li>
               <li><a href="home-02.html">Homepage 2</a></li>
               <li><a href="home-03.html">Homepage 3</a></li>
            </ul> -->
            <!--  사이드 바 홈버튼 오른쪽 화살표 지웁니당 
            <span class="arrow-main-menu-m">
               <i class="fa fa-angle-right" aria-hidden="true"></i>
            </span> -->
         </li>

         <li>
            <a href="/shop">Shop</a>
         </li>

         <li>
            <a href="/notice">Notice</a>
         </li>

         <li>
            <a href="/about">About</a>
         </li>
         <!--  
         <li>
            <a href="contact.html">Contact</a>
         </li> -->
      </ul>
   </div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="/resources/funfume/images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search" placeholder="Search...">
			</form>
		</div>
	</div>
</header>