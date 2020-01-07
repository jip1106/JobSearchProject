<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />

<body>
 <!-- 네비게이션 -->
<c:import url="/WEB-INF/views/include/navi.jsp"/>
 
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">기업회원 
      <small>정보 조회/수정</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">홈으로</a>
      </li>
      <li class="breadcrumb-item active">About</li>
    </ol>

   
   <div class="row">  <!-- 로우가 사이드 하고 본문 위치 설정해줌 -->
      <!--사이드바 -->
   <c:import url="/WEB-INF/views/include/sidebar.jsp"/>
   
   <form name="frmComInfo" action="" method="post" enctype="multipart/form-data">
  
      <!-- 본문 -->
	 	<div class="col-lg-9 mb-4">
	 	
	 		
	    </div>
	 </form>
    </div>
    
  <!-- Footer --> 
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
