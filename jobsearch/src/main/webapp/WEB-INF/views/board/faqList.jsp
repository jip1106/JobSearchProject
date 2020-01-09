<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />
	
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
	<form action="<c:url value='/board/list.do?boardType=1'/>" 
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