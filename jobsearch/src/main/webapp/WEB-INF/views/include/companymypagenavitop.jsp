<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
a.list-group-item-ad {
    height: 312px;
    padding-top: 14px;
    font-size: 17px;
    color: white;
    font-weight: 500;
    margin-top: 7px;
    margin-bottom: 13px;
}
a.list-group-item {
    height: 55px;
    padding-top: 14px;
    font-size: 17px;
    background: #5e87f1;
    color: white;
    padding-left: 27px;
    font-weight: 500;
}
ol.breadcrumb {
    height: 57px;
    padding-left: 22px;
}
li.breadcrumb-item {
    padding-top: 4px;
    position: relative;
    left: 47em;
}
span#member_type {
    font-size: 18px;
    color: #46a556;
    font-weight: 530;
    margin-right: 3px;
    padding-top: 4px;
}
span#name_text {
    font-size: 18px;
    color: #46a556;
    font-weight: 530;
    margin-right: 3px;
}
h2.mt-4.mb-3 {
    font-size: 41px;
}

.card.mb-4-bt-edit {
    padding: 26px 29px 16px 29px;
    margin-bottom: 5px;
}
</style>
    
   <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">Mypage</h2>

    <ol class="breadcrumb">
    <span id="member_type">기업회원</span>
   	  <li class="breadcrumb-item">
        <span id="name_text">홍길동</span><span> 님의 마이페이지입니다.</span>
      </li> 
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="<c:url value='/company/companymypageedit.do'/>" class="list-group-item">기업정보수정</a>
          <a href="#" class="list-group-item">공고관리</a>
          <a href="#" class="list-group-item">지원현황</a>
          <a href="<c:url value='/company/companymypagepayment.do'/>" class="list-group-item">결제관리</a> 
      	 <a href="https://www.saramin.co.kr/" target="_blank" class="list-group-item-ad">
      	 	<img src="<c:url value='/resources/images/mypage_banner.jpg'/>">
      	 </a>
      	 <a href="https://www.saramin.co.kr/" target="_blank" class="list-group-item-ad">
      	 	<img src="<c:url value='/resources/images/mypage_banner2.jpg'/>">
      	 </a>
        </div>
      </div>  
         <!-- Content Column -->
      <div class="col-lg-9 mb-4"> 
      <div class="card mb-4-bt-edit">