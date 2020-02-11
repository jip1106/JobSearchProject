<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 출처: https://titis.tistory.com/111 [프로그래밍으로 안되는건 없다. ] -->
<style>
/* 잡서치디자인추가 */
nav.nav_side {
    position: fixed;
    top: 36px;
    height: 100%;
}
div#menu {
    margin: auto;
    max-width: 100%;
    padding: 0;
}
div#floatMenu {
    border-radius: 0;
    border:none;
}
ul#menu_ul {
    padding: 7px 15px;
}
.menubox1 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 50px;
    padding: 11px 19px;
    background-color: #ffffff;
}
.menubox2 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 150px;
    padding: 21px 19px;
}
.menubox3 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 150px;
    padding: 21px 19px;
}
.menubox4 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 150px;
    padding: 21px 19px;
}
.menubox4_B {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 150px;
    padding: 58px 19px;
    text-align: center;
     background: url("${pageContext.request.contextPath}/resources/images/pattern.png") center no-repeat; 
}
.menubox4_admin {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 150px;
    padding: 58px 19px;
    text-align: center;
    background: url("${pageContext.request.contextPath}/resources/images/pattern.png") center no-repeat; 
}
span.menu_title_B {
    font-size: 21px;
    color: #3F51B5;
    font-weight: 600;
    background-color: white;
}
span.menu_title_admin {
     font-size: 21px;
    color: #3F51B5;
    font-weight: 600;
    background-color: white;
}
span.menu_title {
    font-size: 17px;
    font-weight: 600;
    color: #333333;
}
span.menu_logo {
	font-family: 'Recipekorea';
    font-size: 18px;
    font-weight: 600;
    color: #4876ef;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
a.JT {
    color: #4876ef;
    text-decoration: none;
}
a.JTL {
    color: #4876ef;
    text-decoration: none;
}
.menu_banner {
    background-color: black;
    height: 520px;
}
a.link {
    color: #737373;
}

<style>

.topFixBanner {
    text-align: left;
    background-color: #ffffff;
    padding: 20px 0px 20px 20px;
    width: 100%;
	border-bottom:#666666 solid 2px;
}
.topFixBannerFixed {

       position: fixed;

       top: 0px;

	text-align:left;

	padding-left:20px;

     }

</style> 

<script type="text/javascript">
var bannerOffset = $( '.topFixBanner' ).offset();

    $( window ).scroll( function() {  //window에 스크롤링이 발생하면

          if ( $( document ).scrollTop() > bannerOffset.top ) {   // 위치 및 사이즈를 파악하여 미리 정한 css class를 add 또는 remove 합니다.

            $( '.topFixBanner' ).addClass( 'topFixBannerFixed' );

          }

          else {

            $( '.topFixBanner' ).removeClass( 'topFixBannerFixed' );

          }

     });




</script>
<script type="text/javascript">
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		// 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();

});
</script>

    <!-- Navigation -->
  <nav class="nav_side">
	      <!--  왼쪽네비게이션 -->
        <div class="card my-4" id="floatMenu">
        <div class="menubox1">
        	<span class="menu_logo">
       			<a class="JTL" href="${pageContext.request.contextPath }/home.do">JobSearch</a>
        	</span>
       	</div>
        <div class="menubox2"><span class=menu_title>공고 검색</span>
        	<ul class="list-unstyled mb-0" id="menu_ul">
                  <li class="side_li">
                    <a class="link" href="<c:url value='/loc/locationList.do'/>">지역별검색</a>
                  </li>
                  <li class="side_li">
                    <a class="link" href="<c:url value='/cate/categoryList.do'/>">직업별검색</a>
                  </li>
    <!-- 기업만 보이게 수정  -->
                  <li class="side_li">
                    <a class="link" href="${pageContext.request.contextPath}/resume/searchResume.do">인재검색</a>
                  </li>
            </ul>
        </div>
        <div class="menubox3"><span class=menu_title>게시판</span>
        	<ul class="list-unstyled mb-0" id="menu_ul">
                  <li class="side_li">
                    <a class="link" href="${pageContext.request.contextPath }/board/list.do?boardType=1">공지사항</a>
                  </li>
                  <li class="side_li">
                    <a class="link" href="${pageContext.request.contextPath }/board/list.do?boardType=2">FAQ</a>
                  </li>
                  <li class="side_li">
                    <a class="link" href="${pageContext.request.contextPath }/board/list.do?boardType=3">자유게시판</a>
                  </li>
            </ul>
        </div>
        <!-- 관리자 -->
        <c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.regType == 0}">
	        <div class="menubox4_admin">
	        	<span class=menu_title_admin>관리자입니다.</span>
	        </div>
        </c:if>
        <!-- 일반회원 -->
        <c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.regType == 1}">
	        <div class="menubox4"><span class=menu_title>마이페이지</span>
	        		<ul class="list-unstyled mb-0" id="menu_ul">
	                  <li class="side_li">
	                    <a class="link" href="${pageContext.request.contextPath }/member/mypagerecentnotice.do">마이페이지</a>
	                  </li>
	                  <li class="side_li">
	                    <a class="link" href="${pageContext.request.contextPath }/member/mypageeditcheck.do">회원수정</a>
	                  </li>
	                  <li class="side_li">
	                    <a class="link" href="${pageContext.request.contextPath }/member/mypageresumeTest.do">이력서등록</a>
	                  </li>
	            </ul>
	        
	        </div>
        </c:if>
        <!-- 기업회원 -->
        <c:if test="${!empty sessionScope.loginMember && sessionScope.loginMember.regType == 2}">
	        <div class="menubox4"><span class=menu_title>마이페이지</span>
	        		<ul class="list-unstyled mb-0" id="menu_ul">
	                  <li class="side_li">
	                    <a class="link" href="<c:url value='/company/companyMyAnnList.do'/>">마이페이지</a>
	                  </li>
	                  <li class="side_li">
	                    <a class="link" href="<c:url value='/company/companyPwdChk.do'/>">기업수정</a>
	                  </li>
	                  <li class="side_li">
	                    <a class="link" href="<c:url value='/company/companymypageannouncement.do'/>">공고등록</a>
	                  </li>
	            </ul>
	        
	        </div>
        </c:if>
        <!-- 비회원 -->
        <c:if test="${empty sessionScope.loginMember}">
	        <div class="menubox4_B">
		        <span class=menu_title_B>비회원입니다.</span>
	        </div>
        </c:if>
       <div class="menu_banner">
        	<img src="<c:url value='/resources/images/picture8.jpg'/>"> 
        </div>    
        
       </div>
  </nav>