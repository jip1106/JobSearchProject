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
	</style>
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	<!-- Page Content -->
  	<div class="container">

    <!-- Page Heading/Breadcrumbs -->  
    <h1 class="mt-4 mb-3">공지사항</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/home.do'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">notice</li>
    </ol>

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
      <div class="col-lg-8">

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
		<hr>
        
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

   	 <!-- Sidebar Widgets Column -->	
      <div class="col-md-4">

        <!-- 검색(전체) -->
        <div class="card mb-4">
          <h5 class="card-header">검색</h5>
          <div class="card-body">
            <div class="input-group">
              <form name="frmSearch" method="post" action="<c:url value='/board/list.do?boardType=1'/>">
	              <input type="hidden" name="searchCondition" value="1">
	              <input type="text" class="form-control" name="searchKeyword" placeholder="검색">
	              <button type="submit" class="btn btn-primary">검색</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
 

  </div>
	<c:import url="/WEB-INF/views/include/navi.jsp" />

	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
	<script type="text/javascript">
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
	</script>
</body>

</html>