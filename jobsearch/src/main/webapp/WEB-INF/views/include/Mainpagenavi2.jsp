<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 스위퍼 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 스위퍼 -->

<style>
/* 잡서치디자인추가 */

.bg-dark {
    background-color: #4876ef!important;
} 

nav.navbar.fixed-top.navbar-expand-lg.navbar-dark.bg-dark.fixed-top {
    height: 60px;
}
li.nav-item {
    font-size: 17px;
}
nav#top_navi {
    padding: 39px 0;
}
/* 스위퍼 */
.swiper-container {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
}
.btns {
    text-align: center;
    position: relative;
    margin: -3.8em 0 0 -47em;
    z-index: 10;
}
/* 스위퍼 */

</style>
    <!-- Navigation -->
 
  
 	<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="<c:url value='/resources/images/frozen.jpg'/>"></div>
		<div class="swiper-slide"><img src="img/frozen.jpg"></div>
		<div class="swiper-slide"><img src="img/frozen.jpg"></div>
		<div class="swiper-slide"><img src="img/frozen.jpg"></div>
	</div>
	
	<!-- 네비게이션 버튼 -->
	    <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	    <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	
	<!-- 페이징 -->
	    <div class="swiper-pagination"></div>
	</div>

    <br>
	<!-- 시작, 멈춤버튼 -->
  	<div class="btns">
		<!-- <button class="start"><img src="img/play.png"></button>&nbsp;&nbsp;
		<button class="stop"><img src="img/stop.png"></button> -->
		<!-- 시작버튼 -->
		<a href="javascript:startAutoplay();"
			style="margin: 0 4px; width: 8px; height: 8px; background: transparent; display: inline-block;">
			<span style="border-color: transparent transparent transparent #fff; border-style: solid; border-width: 6px 0 6px 10px; float: left; height: 0; width: 0;"></span>
		</a> &nbsp;
		<!-- 정지버튼 -->
		<a href="javascript:stopAutoplay();"
			style="margin: -3px 2px; width: 10px; height: 10px; background: #fff; display: inline-block;">
		</a>
	</div>
	
  <script type="text/javascript">
  var swiperbtn=new Swiper('.swiper-container', {
		pagination : { // 페이징 설정
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션 설정
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
		autoplay: {
	        delay: 2500,
	        disableOnInteraction: false,
	        /* 사용자가 슬라이드를 수동적으로 움직일때  aoutoplay가 준비 되지 않는 다는 것이다.(false)
	        (true)로 두게 되면 사용자가 움직이는 행위를 했을 때 aoutoplay가 멈추게 된다. */
        }
	});
  	/* 시작,정지기능 */
  	function startAutoplay(){
  		swiperbtn.autoplay.start();
  		return false;
  	} 
  
  	function stopAutoplay(){
  		swiperbtn.autoplay.stop();
  		return false;
  	}
  
	/* 시작 정지 기능  */  	
  	/* $('.start').on('click', function(){
  		swiperbtn.autoplay.start();
  		return false;
  	});
  	
  	$(".stop").on("click", function(){
  		swiperbtn.autoplay.stop();
  		return false;
  	}); */
  </script>


   <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" id="top_navi">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/loc/locationList.do'/>">지역별</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/cate/categoryList.do'/>">직업별</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	게시판
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="${pageContext.request.contextPath }/board/list.do?boardType=1">공지사항</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath }/board/list.do?boardType=2">FAQ</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath }/board/list.do?boardType=3">자유게시판</a>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/resume/searchResume.do">인재검색</a>
          </li>
          	 
	      <li class="nav-item dropdown">
	      	<%//로그인 X%>
	      	<c:if test="${empty sessionScope.loginMember }">
		  		<a class="nav-link dropdown-toggle" href="#" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	로그인
		        </a>
		        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		        	<a class="dropdown-item" href="${pageContext.request.contextPath }/member/login.do">로그인</a>
		            <a class="dropdown-item" href="${pageContext.request.contextPath }/member/register.do">회원가입</a>
				</div>
		            
			</c:if>
			
			<%//관리자 %>
			<c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.regType == 0}">
		  		<a class="nav-link dropdown-toggle" href="#" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	${sessionScope.loginMember.memberName}님
		        </a>
		        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		        	<a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
		            <a class="dropdown-item" href="${pageContext.request.contextPath }/admin/home.do">관리자페이지</a>
				</div>
		            
			</c:if>
			
			
			<%//일반회원 %>
	      	<c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.regType == 1}">
		  		<a class="nav-link dropdown-toggle" href="#" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	${sessionScope.loginMember.memberName}님
		        </a>
		        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		        	<a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
		            <a class="dropdown-item" href="${pageContext.request.contextPath }/member/mypagerecentnotice.do">마이페이지</a>
				</div>
		            
			</c:if>
			
	      	<c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.regType == 2}">
		  		<a class="nav-link dropdown-toggle" href="#" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	${sessionScope.loginMember.memberName}님
		        </a>
		        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		        	<a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
		            <a class="dropdown-item" href="${pageContext.request.contextPath }/company/companyMyAnnList.do">기업페이지</a>
				</div>
		            
			</c:if>		
				
						
	      </li>


        </ul>
      </div>
    </div>
  </nav>