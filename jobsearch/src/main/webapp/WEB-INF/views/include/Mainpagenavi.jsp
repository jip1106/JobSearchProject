<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
/* 잡서치디자인추가 */
.bg-dark {
	background-color: #4876ef !important;
}

nav.navbar.fixed-top.navbar-expand-lg.navbar-dark.bg-dark.fixed-top {
	height: 60px;
}


nav#top_navi {
	padding: 36px 0;
	position: relative;
	display: flex;
}

.top_banner {
    background-color: white;
    height: 103px;
    display: flex;
    padding: 0 285px;
}
.Jobsearch {
    padding: 52px 0;
    width: 57em;
}

body {
	padding-top: 0;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-8Heavy'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-8Heavy.woff') format('woff'); font-weight: normal; font-style: normal; }
a.navbar-brand {
font-family: 'Recipekorea';
/* font-family: 'S-CoreDream-8Heavy'; */
color:white;
font-size:22px;
}
li.nav-item {
    font-size: 19px;
    color: white;
}
a.navbar-brand {
    padding-top: 6px;
    padding-bottom: 0;
}
.navbar-dark .navbar-nav .nav-link {
    color: #f8f9fa;
}
span.Jtitle {
    font-family: 'Recipekorea';
    /* font-family: 'S-CoreDream-8Heavy'; */
    color: #4876ef;
    font-size: 33px;
    padding: -1px 0;
    position: relative;
    top: -3px;
    margin-right:-5px;
}
span.Jtitle2 {
    font-size: 23px;
    color: #4876ef;
}
span.Jtitle3 {
    font-size: 23px;
    color: #4876ef;
}
span.Jtitle4 {
    font-size: 23px;
    color: gray;
}
.swiper {
    width: 23em;
    padding: 16px 0;
}
/* 스위퍼 */
.swiper-container_m {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    list-style: none;
    padding: 0;
    z-index: 1;
}
.btns_m {
    text-align: center;
    position: relative;
    margin: -3.8em 0 0 -47em;
    z-index: 10;
    position: relative;
    left: 28em;
    top: 2px;
}
.swiper-button-next.swiper-button-disabled {
    display: none;
}
.swiper-button-prev.swiper-button-disabled {
    display: none;
}
a.stopbt {
    position: relative;
    top: -2px;
    left: -10px;
}
a.JT {
    color: #4876ef;
    text-decoration: none;
}

/* 스위퍼 */

</style>
    <!-- Navigation -->
   <div class="top_banner">
   		<div class="Jobsearch">
   			<span class="Jtitle">
		   		  <a class="JT" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
   			</span>
   			<span class="Jtitle2">는</span>
   			<span class="Jtitle3">구직자를</span>
   			<span class="Jtitle4">응원합니다!</span>
   		</div>
   		<div class="swiper">
 				<div class="swiper-container_m">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><a href="<c:url value='/loc/locationList.do'/>"><img src="<c:url value='/resources/images/maintop1.png'/>"></a></div>
		<div class="swiper-slide"><a href="<c:url value='/cate/categoryList.do'/>"><img src="<c:url value='/resources/images/maintop2.png'/>"></a></div>
		<div class="swiper-slide"><a href="<c:url value='/member/mypagebookmark.do'/>"><img src="<c:url value='/resources/images/maintop3.png'/>"></a></div>
		<div class="swiper-slide"><a href="<c:url value='/resume/searchResume.do'/>"><img src="<c:url value='/resources/images/maintop4.png'/>"></a></div>
		<div class="swiper-slide"><a href="<c:url value='/company/companyMyAnnList.do'/>"><img src="<c:url value='/resources/images/maintop5.png'/>"></a></div>
	</div>
	
	<!-- 네비게이션 버튼 -->
	   <!--  <div class="swiper-button-next"></div> --><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	    <!-- <div class="swiper-button-prev"></div> --><!-- 이전 버튼 -->
	
	<!-- 페이징 -->
	    <div class="swiper-pagination"></div>
	</div>

    <br>
	<!-- 시작, 멈춤버튼 -->
 <!--  	<div class="btns_m">
		<button class="start"><img src="img/play.png"></button>&nbsp;&nbsp;
		<button class="stop"><img src="img/stop.png"></button>
		시작버튼
		<a href="javascript:startAutoplay();"
			style="margin: 0 4px; width: 8px; height: 8px; background: #ffffff; display: inline-block;">
			<span style="border-color: transparent transparent transparent #949494; border-style: solid; border-width: 5px 0 5px 9px; float: left; height: 0; width: 0;"></span>
		</a> &nbsp;
		정지버튼
		<a class="stopbt" href="javascript:stopAutoplay();"
			style="margin: -3px 2px; width: 8px; height: 8px; background: #949494; display: inline-block;">
		</a>
	</div> -->
	
  <script type="text/javascript">
  var swiperbtn=new Swiper('.swiper-container_m', {
		pagination : { // 페이징 설정
			el : '.swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션 설정
			nextEl : '.swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
		},
		autoplay: {
	        delay: 4000,
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
   		</div>
   
   </div>
   <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" id="top_navi">
<!--    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top" id="top_navi"> -->
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