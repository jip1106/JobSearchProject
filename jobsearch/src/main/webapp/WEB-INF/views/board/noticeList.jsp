<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />
	
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
        <div class="card mb-4">
        	<c:forEach var="boardVo" items="${list }">
	          <div class="card-body">
	            <p class="card-text"><b>${boardVo.boardTitle }</b></p>
	          </div>
	          <div class="card-footer text-muted">
	            <small><fmt:formatDate value="${boardVo.regDate }" 
						pattern="yyyy-MM-dd"/></small>
	          </div>
	        </c:forEach>
        </div>        
		<hr>
        <!-- 페이징 처리 -->
        <!-- 이전블럭으로 이동 -->
		<c:if test="${pagingInfo.firstPage>1 }">	
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
			</a>
		</c:if>
		<!-- 페이지 번호 추가 -->
		<div class="pagenum">						
			<c:forEach var="i" begin="${pagingInfo.firstPage }" 
				end="${pagingInfo.lastPage }">		
				<c:if test="${i==pagingInfo.currentPage }">
					<span>${i}</span>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})">
						${i}</a>
				</c:if>
			</c:forEach>
		</div>
		<!--  페이지 번호 끝 -->
		
		<!-- 다음블럭으로 이동 -->
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">	
				<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
			</a>
		</c:if>	

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