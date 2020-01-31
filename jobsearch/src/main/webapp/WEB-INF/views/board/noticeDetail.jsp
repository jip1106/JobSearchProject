<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<style type="text/css">
		.col-lg-8{
			max-width: none;
			flex: none;
		}
		
		#noticeContents{
			height: 500px;
 		    overflow: scroll;
		}
	</style>
	<c:import url="/WEB-INF/views/include/headend.jsp" />

<style type="text/css">
/* 잡서치디자인추가 */
div#noticeList_container {
    max-width: 800px;
}
.NoticeTitle {
    margin-bottom: 8px;
    margin-top: 120px;
}
span.Jobsearch {
    font-size: 38px;
    letter-spacing: -1px;
    font-weight: 500;
    color: #4876ef;
}
span.text_span1 {
    font-size: 26px;
    margin-left: 8px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span2 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
hr.title_hr {
    border: 1px solid white;
    margin: 0px 0 22px 0;
}
hr.middle_hr {
    border: 1px solid #4876ef;
    margin: 0px 0 22px 0px;
}
.detailLayout {
    position: relative;
    top: -24px;
    /* background-color: black; */
    height: 52px;
    padding: 11px 20px;
    border-bottom: 2px solid #4876ef;
    border-top: 2px solid #4876ef;
}
span.n_title {
    font-size: 16px;
    font-weight: 600;
    color: #969696;
}
span.notice_title {
    margin-left: 8px;
    font-size: 17px;
}
.content {
    position: relative;
    top: -24px;
    background-color: #f1f1f1;
    height: 300px;
    border-bottom: 2px solid #adadad;
    padding: 16px 24px;
}
div.btn.btn-primary_list {
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 700px;
    top: -12px;
    width: 71px;
    padding: 8px 0px;
}
span.top_regt {
    position: relative;
    left: 35.4em;
    top: -1.8em;
    font-size: 17px;
    color: #5e87f1;
    font-weight: bold;
}
span.top_reg {
    position: relative;
    left: 34em;
    top: -1.75em;
    font-size: 18px;
    font-weight: bold;
    color: #b9b9b9;
}
img.menu {
    resize: both;
    height: 28px;
    position: relative;
    top: -2px;
    width: 45px;
}
</style>
<body>

  <!-- Page Content -->
  <div class="container" id="noticeList_container">
  
   <div class="NoticeTitle">
	    <span class="Jobsearch">Jobsearch</span>
	    <span class="text_span1">에서</span>
	    <span class="text_span2">알려드립니다!</span>
    </div>
   <!--  <hr class="title_hr"> -->
	    <span class=top_regt>등록일:</span>
		<span class=top_reg>
			 <fmt:formatDate value="${boardVo.regDate }" pattern="yyyy.MM.dd" />
		</span>

    <div class="detailLayout">
    <span class="n_title">제목 : </span>
    <span class="notice_title">
		<c:if test="${fn:length(boardVo.boardTitle)>30}">
			${fn:substring(boardVo.boardTitle, 0, 30)}...
		</c:if>
		<c:if test="${fn:length(boardVo.boardTitle)<=30}">
			${boardVo.boardTitle}
		</c:if>
    </div>
  	<div class="content">
  		 <span class="content_span">${boardVo.boardContents }</span>
  	</div>
  	<a href="<c:url value='/board/list.do?boardType=1'/>" class="tag_a">	
				<div class="btn btn-primary_list">
					<img class="menu" src="<c:url value='/resources/images/menu.png'/>">
				</div>
	</a>
    
   </div>

	<c:import url="/WEB-INF/views/include/navi.jsp" />

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>
