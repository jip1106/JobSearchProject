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
    height: 52px;
    padding-top: 14px;
    font-size: 17px;
    background: #5e87f1;
    color: white;
    padding-left: 27px;
    font-weight: 500;
    text-decoration: none;
    
}
a.list-group-item:hover{
	 background: #3454a5;
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
    font-weight: bold;
    margin-right: 3px;
}
h2.mt-4.mb-3 {
    font-size: 41px;
    color:#222;
    text-decoration: none;
}

.card.mb-4-bt-edit {
    padding: 26px 29px 16px 29px;
    margin-bottom: 5px;
}
#companymypageMain:hover{
	text-decoration: none;
}
#last-list{
	border-bottom-left-radius: .25em;
	border-bottom-right-radius: .25em;
}
.CateTitle {
    margin-bottom: 8px;
    margin-top: 80px;
}
span.Jobsearch {
    font-size: 35px;
    letter-spacing: -1px;
    font-weight: 500;
    color: #4876ef;
}
span.text_span1 {
    font-size: 42px;
    font-weight: 500;
    margin-left: 10px;
    color: black;
    letter-spacing: -1px;
}
span.text_span2 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span3 {
    font-size: 24px;
    margin-left: 3px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
a#list_final {
    border-radius: 0 0 4px 4px;
}
a.JT {
    color: #4876ef;
    text-decoration: none;
}
span.Jobsearch {
    font-family: 'Recipekorea';
    font-size: 32px;
    letter-spacing: -1px;
    /* font-weight: 500; */
    color: #4876ef;
    position: relative;
    top: -4px;
    margin-right: -7px;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
    
   <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <%-- <a id="companymypageMain" href="<c:url value='/company/companyMyAnnList.do'/>"><h2 class="mt-4 mb-3" style="font-weight: bold">기업 MyPage</h2></a> --%>
    <div class="CateTitle">
	     <span class="Jobsearch">
    		<a class="JT" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
	    </span>
	    <span class="text_span1">Mypage</span>
	   <!--  <span class="text_span2">검색창</span> -->
	    <span class="text_span3">입니다!</span>
    </div>

    <ol class="breadcrumb">
    <span id="member_type">기업회원</span>
   	  <li class="breadcrumb-item">
        <span id="name_text">${loginMember.memberName }</span><span> 님의 마이페이지입니다.</span>
      </li> 
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="<c:url value='/company/companyPwdChk.do'/>" class="list-group-item">기업정보수정</a>
          <a href="<c:url value='/company/companymypageannouncement.do'/>" class="list-group-item">공고등록</a>
          <a href="<c:url value='/company/companyMyAnnList.do'/>" class="list-group-item">공고관리</a>
          <a id="last-list" href="<c:url value='/company/companymyorderlist.do'/>" class="list-group-item">결제내역</a> 
      	 <a href="https://www.saramin.co.kr/" target="_blank" class="list-group-item-ad">
      	 	<img src="<c:url value='/resources/images/mypageBanner1.jpg'/>">
      	 </a>
      	 <a href="https://www.saramin.co.kr/" target="_blank" class="list-group-item-ad">
      	 	<img src="<c:url value='/resources/images/mypageBanner4.jpg'/>">
      	 </a>
        </div>
      </div>  
         <!-- Content Column -->
      <div class="col-lg-9 mb-4"> 
      <div class="card mb-4-bt-edit">