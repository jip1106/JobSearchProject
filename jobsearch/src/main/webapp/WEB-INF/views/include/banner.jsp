<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
/* 잡서치디자인추가 */

nav.nav_banner {
    width: 120px;
    position: absolute;
    /* left: 328px; */
    left: 1395px;
    top: 242px;
    /* top: 215px; */
}
.side_banner1 {
    margin-bottom: 15px;
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
  <nav class="nav_banner">
        <div class="side_banner1">
        	<img src="<c:url value='/resources/images/right_sample2.jpg'/>">
        </div>   
        <div class="side_banner2">
        	<img src="<c:url value='/resources/images/right_sample3.jpg'/>">
        </div>   
  </nav>