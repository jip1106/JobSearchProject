<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
/* 잡서치디자인추가 */
nav.nav_side {
    position: absolute;
    top: 36px;
    height: 1194px;
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
}
.menubox2 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 135px;
    padding: 11px 19px;
}
.menubox3 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 135px;
    padding: 11px 19px;
}
.menubox4 {
    border-bottom: 1px solid #dedede;
    border-right: 1px solid #dedede;
    height: 135px;
    padding: 11px 19px;
}
span.menu_title {
    font-size: 17px;
    font-weight: 600;
    color: #929292;
}
span.menu_logo {
    font-size: 18px;
    font-weight: 600;
    color: #4876ef;
}
    
/* 잡서치디자인추가 */

</style>
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
        <div class="menubox1"><span class=menu_logo>Jopsearch</span></div>
        <div class="menubox2"><span class=menu_title>공고 검색</span>
        	<ul class="list-unstyled mb-0" id="menu_ul">
                  <li class="side_li">
                    <a href="#span_notice_title">지역별검색</a>
                  </li>
                  <li class="side_li">
                    <a href="#">직업별검색</a>
                  </li>
    <!-- 기업만 보이게 수정  -->
                  <li class="side_li">
                    <a href="#">인재검색</a>
                  </li>
            </ul>
        </div>
        <div class="menubox3"><span class=menu_title>게시판</span>
        	<ul class="list-unstyled mb-0" id="menu_ul">
                  <li class="side_li">
                    <a href="#span_notice_title">공지사항</a>
                  </li>
                  <li class="side_li">
                    <a href="#">FAQ</a>
                  </li>
                  <li class="side_li">
                    <a href="#">자유게시판</a>
                  </li>
            </ul>
        </div>
        <div class="menubox4"><span class=menu_title>마이페이지</span>
        <!-- 기업일때 회원일때로 수정  -->
        		<ul class="list-unstyled mb-0" id="menu_ul">
                  <li class="side_li">
                    <a href="#span_notice_title">마이페이지메인</a>
                  </li>
                  <li class="side_li">
                    <a href="#">회원수정</a>
                  </li>
                  <li class="side_li">
                    <a href="#">이력서등록</a>
                  </li>
            </ul>
        
        </div>
       <div class="menu_banner">
        	<img src="<c:url value='/resources/images/left_sample3.jpg'/>"> 
        </div>    
        
       </div>
  </nav>