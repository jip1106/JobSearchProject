<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
	
<style type="text/css">
.unfold{
	float: right;
	cursor: pointer;
}
.answer{
	display: none;
}
.pagenum {
    text-align: center;
    padding: 0.5em;
}
/*새로 추가   */

.breadcrumb {
	clear: both;
}
ol.breadcrumb {
	margin-top: 17px;
}
div#container {
	height: 44em;
	max-width: 750px;
}
button.btn.btn-primary {
    height: 44px;
    background-color: #5e87f1;
    border-color: #5e87f1;
}
button.btn.btn-primary_write {
    height: 44px;
    background-color: #5e87f1;
    border-color: #5e87f1;
}

h1#list_title {
    margin-top: 7px;
    position: relative;
    top: 47px;
    font-size: 30px;
    font-weight: bold;
    letter-spacing: -1px;
    margin-bottom: 61px;
}

.faqlist {
    margin-top: 37px;
    margin-bottom: -16px;
}
h5.mb-0 {
    font-size: 17px;
    font-weight: 500;
    color: black;
}
img#searchimg {
    resize: both;
    height: 31px;
}
.card-body {
    background: #f3f3f3;
}
hr.hr_bottom {
    border: 1.5px solid #5e87f1;;
    margin-bottom: 32px;
}
span.Q {
    color: #5e87f1;
    font-size: 21px;
    margin-right: 11px;
}
span.A {
    color: #5e87f1;
    font-size: 21px;
    font-weight: 500;
}
img.open_down {
    background-color: #5e87f1;
    resize: both;
    width: 16px;
    height: 15px;
}
table.box2 {
    width: 100%;
}
th {
    color: #7b7b7b;
}
div#freelist_part {
	border-top: 3px solid #5e87f1;
	border-bottom: 3px solid #5e87f1;
    padding: 11px 11px;
}
div#freelist_part2 {
    border-bottom: 1.3px solid #d0d0d0;
    padding: 19px 11px;
}
span.num {
    margin-right: 35px;
    font-weight: 600;
    color: #7b7a91;
}
span.title {
    margin-right: 277px;
    font-weight: 600;
    color: #7b7a91;
}
span.member {
    margin-right: 88px;
    font-weight: 600;
    color: #7b7a91;
}
span.regdate {
    margin-right: 52px;
    font-weight: 600;
    color: #7b7a91;
}
span.hits {
	font-weight: 600;
    color: #7b7a91;
}
span.num2 {
    font-weight: 600;
    color:#5e87f1;
    position: relative;
    left: 12px;; 
}
span.title2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 62px; 
}
span.member2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 285px; 
}
span.regdate2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 365px; 
     
}
span.hits2 {
	font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 416px;
}
div#card-header {
    border-bottom: 0.5px solid #bdbdbd;
    padding: 16px 0px;
}
button.btn.btn-primary_write {
    height: 45px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 623px;
    width: 92px;
}
button.btn.btn-primary_list {
    height: 45px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 428px;
    width: 92px;
}
.write_menu_div1 {
    background-color: #5e87f1;
    width: 183px;
    height: 444px;
    float: left;
    text-align: center;
    padding: 15px 0;
    margin-right: 14px;
    border-radius: 4px;
}
input#input_1 {
    height: calc(1.5em + .75rem + 16px);
    width: 72%;
    margin-bottom: 11px;
}
div.write_menu_div11 {
    font-size: 18px;
    color: white;
}
.write_menu_div2 {
    background-color: #5e87f1;
    width: 183px;
    height: 51px;
    text-align: center;
    float: left;
    padding: 12px 0;
    margin-right: 14px;
}
input#input_2 {
    height: calc(1.5em + .75rem + 16px);
    width: 72%;
    margin-bottom: 11px;
}
div.write_menu_div22 {
    font-size: 18px;
    color: white;
    margin-top: 32px;
}

.write_menu2 {
    margin-bottom: 12px;
}
.write_menu_div3 {
    background-color: #5e87f1;
    width: 183px;
    height: 315px;
    text-align: center;
    float: left;
    padding: 136px 0;
    margin-right: 14px;
}
textarea#input_3 {
    height: calc(1.5em + .75rem + 280px);
    width: 72%;
    margin-bottom: 11px;
}
div.write_menu_div33 {
    font-size: 18px;
    color: white;
    margin-top: 147px;
}
hr.line1 {
    margin: 0;
    position: relative;
    top: 13px;
    color: white;
    border: 1px solid white;
}
hr.line2 {
    margin: 0;
    position: relative;
    top: 15px;
    color: white;
    border: 1px solid white;
}

</style>
	
<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	 <!-- Page Content -->
  <div class="container" id="container">
	
    <!-- Page Heading/Breadcrumbs -->
    <h1 id="list_title" >자유게시판작성</h1>
       <hr class="hr_bottom"> 
	<form name="frmSearch" method="post" action="<c:url value='/board/list.do?boardType=3'/>">
     <!-- <input type="hidden" name="searchCondition" value="2">
     <input type="text" class="form-control" name="searchKeyword" placeholder="검색"> -->
   <%--   <button type="submit" class="btn btn-primary"><img id="searchimg"src="<c:url value='/resources/images/search.png'/>"/></button> --%>
    
    <div class="write_menu1">
    	<div class="write_menu_div1">
    		<!-- <span class="write_menu_span1">작성자</span>
    		<span class="write_menu_span2">제목</span>
    		<span class="write_menu_span3">내용</span> -->
    		<div class="write_menu_div11">작성자</div>
    		<hr class="line1">
    		<div class="write_menu_div22">제목</div>
    		<hr class="line2">
    		<div class="write_menu_div33">내용</div>
   		</div>
    	 <input type="text" id="input_1" class="form-control" name="memberName" placeholder="작성자">
   	
    <!-- <div class="write_menu2"> -->
    	<!-- <div class="write_menu_div2"> -->
    		<!-- <span class="write_menu_span2">제목</span> -->
    	 <input type="text" id="input_2" class="form-control" name="boardTitle" placeholder="제목">
    <!-- <div class="write_menu3"> -->
    	<!-- <div class="write_menu_div3"> -->
    		<!-- <span class="write_menu_span3">내용</span> -->
    	 <textarea style="resize:none" id="input_3" class="form-control" name="boardContents" placeholder="내용"></textarea>
    </div>
    <button type="submit" class="btn btn-primary_write">등록</button> 
    <button class="btn btn-primary_list"
    onclick="location.href = '<c:url value='/board/freelist.do'/>'">목록</button>
    </form>		
   
   <%--  <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/home.do'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">FAQ</li>         
    </ol> --%>
    
    <!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/board/list.do?boardType=2'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">
		<input type="hidden" name="currentPage" >
	</form>

    <div class="faqlist">
    	<%-- <c:if test="${empty list }">
	    	<div id="list_part">
		        <div id="card-header" role="tab" id="headingOne">
		          <h5 class="mb-0">
		           		목록이 존재하지 않습니다.
		          </h5>
		        </div>
	   	 	</div>
	    </c:if> --%>
	    
	    
	   <%--  <c:if test="${!empty list }">
	    	<c:forEach var="boardVo" items="${list }"> --%>
	    <!--   <div id="freelist_part">
		      	<span class="num">번호</span>
		      	<span class="title">제목</span>
		      	<span class="member">작성자</span>
		      	<span class="regdate">작성일</span>
		      	<span class="hits">조회수</span>
	      </div>
	      <div id="freelist_part2">
		      	<span class="num2">1</span>
		      	<span class="title2">제목입니다.</span>
		      	<span class="member2">홍길동</span>
		      	<span class="regdate2">2020.01.01</span>
		      	<span class="hits2">25</span>
	      </div>
	     -->
     
   </div>
   <!-- <hr class="hr_bottom"> -->
   </div>
    

	
	<c:import url="/WEB-INF/views/include/navi.jsp" />

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
</body>

</html>