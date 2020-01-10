<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
		.form-control {
   			 float: left;
   			 width: 20%;
   			 margin-left: 74.7%;
   		}
	</style>
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	 <!-- Page Content -->
  <div class="container">
	
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">FAQ</h1>
	<form name="frmSearch" method="post" action="<c:url value='/board/list.do?boardType=2'/>">
     <input type="hidden" name="searchCondition" value="2">
     <input type="text" class="form-control" name="searchKeyword" placeholder="검색">
     <button type="submit" class="btn btn-primary">검색</button>
    </form>		
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">FAQ</li>         
    </ol>
    
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
    	<c:forEach var="boardVo" items="${list }">
      <div class="card">
        <div class="card-header" role="tab" id="headingOne">
          <h5 class="mb-0">
           Q. ${boardVo.boardTitle }<span class="unfold"><img alt="펼치기" src="<c:url value='/resources/images/unfold.png'/>"></span>
          </h5>
        </div>

        <div class="answer">
          <div class="card-body">
            A. ${boardVo.boardContents }
          </div>
        </div>        
      </div> 
      </c:forEach>     
    </div>
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
  <!-- /.container -->
	
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