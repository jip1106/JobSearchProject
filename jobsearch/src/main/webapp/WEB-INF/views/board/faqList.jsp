<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
.form-control {
    float: left;
    width: 200px;
    margin-left: 58%;
    margin-right: 0;
    height: calc(1.5em + .75rem + 2px);
}
.breadcrumb {
	clear: both;
}
ol.breadcrumb {
	margin-top: 17px;
}
div#container {
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

h1#list_title {
    margin-top: -6px;
    position: relative;
    top: 54px;
}
hr.title_hr {
    border: 1px solid #4876ef;
    margin: 0px 0 -77px 0;
}
.faqlist {
    margin-top: 37px;
    margin-bottom: -18px;
}
div#card-header {
    border-bottom: 2px solid #c1c1c1;
    padding: 17px 11px;
}

h5.mb-0 {
    font-size: 17px;
    font-weight: 500;
    color: black;
}

img#searchimg {
    resize: both;
    height: 28px;
    position: relative;
    top: -3px;
    left: -7px;
}
.card-body {
    background: #f3f3f3;
}
hr.hr_bottom {
    border: 1.5px solid #4876ef;
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
    background-color: #4876ef;
    resize: both;
    width: 16px;
    height: 15px;
}
form#frmSearch {
    position: relative;
    top: -35px;
    left: 65px;
}
button.btn.btn-primary {
    width: 53px;
    height: 38px;
    background-color: #4876ef;
    border-color: #4876ef;

}
hr.hr_bottom {
    border: 1px solid #5e87f1;
    z-index: 100;
}
.bottom_banner {
    margin-bottom: 37px;
    margin-top: -17px;
}

</style>
	
<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	 <!-- Page Content -->
  <div class="container" id="container">
	
	<div class="NoticeTitle">
	    <span class="Jobsearch">FAQ</span>
    </div>
    <hr class="title_hr">
    
    <!-- Page Heading/Breadcrumbs -->
	<form id="frmSearch" name="frmSearch" method="post" action="<c:url value='/board/list.do?boardType=2'/>">
     <input type="hidden" name="searchCondition" value="2">
     <input type="text" class="form-control" name="searchKeyword" placeholder="검색">
     <button type="submit" class="btn btn-primary"><img id="searchimg"src="<c:url value='/resources/images/search.png'/>"/></button>
    </form>		
    <!-- 페이징 처리 관련 form -->
	<form class="frm_aco" action="<c:url value='/board/list.do?boardType=2'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">
		<input type="hidden" name="currentPage" >
	</form>

    <div class="faqlist">
    	<c:if test="${empty list }">
	    	<div id="list_part">
		        <div id="card-header" role="tab" id="headingOne">
		          <h5 class="mb-0">
		           		목록이 존재하지 않습니다.
		          </h5>
		        </div>
	   	 	</div>
	    </c:if>
	    <c:if test="${!empty list }">
	    	<c:forEach var="boardVo" items="${list }">
		      <div id="list_part">
		        <div id="card-header" role="tab" id="headingOne">
		          <h5 class="mb-0">
		          <span class="Q">Q.</span>
		           <c:if test="${fn:length(boardVo.boardTitle)>40}">
						${fn:substring(boardVo.boardTitle, 0, 40)}...
					</c:if>
					<c:if test="${fn:length(boardVo.boardTitle)<=40}">
						${boardVo.boardTitle}
					</c:if>
		           <span class="unfold"><img class="open_down" alt="펼치기" src="<c:url value='/resources/images/open_down.png'/>"></span>
		          </h5>
		        </div>
		
		        <div class="answer">
		          <div class="card-body">
		          <span class="A">A.</span>
		            ${boardVo.boardContents }
		          </div>
		        </div>        
		      </div> 
	      </c:forEach>  
	    </c:if>   
	    
	
    </div>
   
    <hr class="hr_bottom">
     <!-- Pagination -->
		    <ul class="pagination justify-content-center">
			 <c:if test="${pagingInfo.firstPage>1 }">	
			      <li class="page-item">
			        <a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">
			          <span aria-hidden="true">&laquo;</span>
			          <span class="sr-only">Previous</span>
			        </a>
			      </li>
		      </c:if>
		      <c:forEach var="i" begin="${pagingInfo.firstPage }" 
				end="${pagingInfo.lastPage }">
				 <li class="page-item">
			        <a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a>
			      </li>
			   </c:forEach>
		     <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				 <li class="page-item">
			        <a class="page-link" href="#" aria-label="Next" onclick="pageFunc(${pagingInfo.lastPage+1})">
			          <span aria-hidden="true">&raquo;</span>
			          <span class="sr-only">Next</span>
			        </a>
			      </li>
			 </c:if>
		    </ul>
      <!-- Pagination -->
          <div class="bottom_banner">
 		<img src="<c:url value='/resources/images/picture5.jpg'/>">
 	</div>
  </div>
  <!-- /.container -->
	<c:import url="/WEB-INF/views/include/sidenavi.jsp" />  
	<c:import url="/WEB-INF/views/include/navi.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".unfold").click(function(){
				$(this).parent().parent().next().toggle();		
			});			
		});
	</script>
	
	<script type="text/javascript">
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		
		document.frmPage.submit();
	}
	</script>
</body>

</html>