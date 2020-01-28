<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	
<style type="text/css">
.card-body {
 			padding: 0.5rem;
 			margin-left: 20px;
}
.text-muted{
	padding: 0.2em;
   	text-align: right;
}
.pagenum {
    text-align: center;
    padding: 0.5em;
}

/* 잡서치디자인추가 */
div#noticeList_container {
    max-width: 800px;
}
/* h1#list_title {
    margin-top: 7px;
    position: relative;
    top: 47px;
    font-size: 30px;
    font-weight: bold;
    letter-spacing: -1px;
    margin-bottom: 81px;
} */
form.form_search {
    position: relative;
    left: 32em;
    top: 19px;
}
button.btn.btn-primary {
    position: relative;
    top: -38px;
    left: 200px;
}
.input-group {
    top: -153px;
    margin-bottom: -69px;
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
    border: 1px solid #4876ef;
    margin: 0px 0 22px 0;
}
div#notice_div {
    flex: none;
    max-width: none;
}
img#searchimg {
    resize: both;
    height: 28px;
    position: relative;
    top: -3px;
    left: -7px;
}
button.btn.btn-primary {
    width: 53px;
    height: 38px;
    background-color: #4876ef;
    border-color: #4876ef;
}
hr.margin_hr {
    margin-bottom: 59px;
    border-color: whilte;
    border-color: white;
}
</style>
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	<!-- Page Content -->
  	<div class="container" id="noticeList_container">

	 <div class="NoticeTitle">
	    <span class="Jobsearch">Jobsearch</span>
	    <span class="text_span1">에서</span>
	    <span class="text_span2">알려드립니다!</span>
    </div>
    <hr class="title_hr">
	 
            <div class="input-group">
              <form class="form_search" name="frmSearch" method="post" action="<c:url value='/board/list.do?boardType=1'/>">
	              <input type="hidden" name="searchCondition" value="1">
	              <input type="text" class="form-control" name="searchKeyword" placeholder="검색">
	              <button type="submit" class="btn btn-primary"><img id="searchimg"src="<c:url value='/resources/images/search.png'/>"/></button>
              </form>
            </div>

	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/board/list.do?boardType=1'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">
		<input type="hidden" name="currentPage" >
	</form>
    <div class="row">
    
    

      <!-- Post Content Column -->
      <div class="col-lg-8" id="notice_div">

        <!-- 공지사항 목록 반복 -->
        <c:if test="${empty list }">
        	<div class="card mb-4">
        		<div class="card-body">
	           		<p class="card-text">목록이 존재하지 않습니다.</p>
	         	 </div>
        	</div>     
        </c:if>
        <c:if test="${!empty list }">
	        <div class="card mb-4">
	        	<c:forEach var="boardVo" items="${list }">
		          <div class="card-body">
		            <p class="card-text"><a href="<c:url value='/board/detail.do?boardType=1&boardSeq=${boardVo.boardSeq }'/>"><b>
						<c:if test="${fn:length(boardVo.boardTitle)>30}">
							${fn:substring(boardVo.boardTitle, 0, 30)}...
						</c:if>
						<c:if test="${fn:length(boardVo.boardTitle)<=30}">
							${boardVo.boardTitle}
						</c:if>
					</b></a></p>
		          </div>
		          <div class="card-footer text-muted">
		            <small><fmt:formatDate value="${boardVo.regDate }" 
							pattern="yyyy-MM-dd"/></small>
		          </div>
		        </c:forEach>
	        </div> 
	    </c:if>       
		
     
        
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
 </div>
  
    </div>
    
 	<div class="bottom_banner">
 		<img src="<c:url value='/resources/images/bottom_sample1.jpg'/>">
 	</div>
 	<hr class="margin_hr">

  </div>
	<%-- <c:import url="/WEB-INF/views/include/sidenavi.jsp" />  --%>
	<c:import url="/WEB-INF/views/include/navi.jsp" />
	
	<%-- <c:import url="/WEB-INF/views/include/banner.jsp" /> --%>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	<script type="text/javascript">
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
	</script>
</body>

</html>