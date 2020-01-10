<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../admin-include/admin-header.jsp"/>

  <body>


	<c:import url="../admin-include/admin-navi.jsp"/>

    <div class="page-content">
    	<!-- 페이징 처리 관련 form -->
			<form action="<c:url value='/admin/board/list.do?boardType=1'/>" 
				name="frmPage" method="post">
				<input type="hidden" name="searchCondition" 
					value="${param.searchCondition}">
				<input type="hidden" name="searchKeyword" 
					value="${param.searchKeyword}">
				<input type="hidden" name="currentPage" >
			</form>
			
    	<div class="row">
    	
    	
		<c:import url="../admin-include/admin-left.jsp"/>
			
		  <div class="col-md-10">
  			<div class="row">
  				<div class="col-md-6">
  					<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">공지사항 목록</div>
							
							<div class="panel-options">
								<a href="<c:url value='/admin/board/write.do?boardType=1'/>"><i class="glyphicon glyphicon-upload"></i>등록</a>
								<a href="#"><i class="glyphicon glyphicon-trash"></i>삭제</a>
							</div>														
						</div>
		  				<div class="panel-body">
		  					<table class="table table-bordered">
				              <thead>
				                <tr>
				                  <th>선택</th>
				                  <th>번호</th>
				                  <th>제목</th>
				                  <th>작성자</th>
				                  <th>등록일</th>
				                  <th>조회수</th>
				                </tr>
				              </thead>
				              <tbody>
				              	<c:forEach var="boardVo" items="${list }">
					                <tr>
					                  <td><input type="checkbox" name="chkdel" value="${boardVo.boardSeq }"></td>
					                  <td>${boardVo.boardSeq }</td>
					                  <td>${boardVo.boardTitle }</td>
					                  <td>${boardVo.memberId }</td>
					                  <td><fmt:formatDate value="${boardVo.regDate }" 
										pattern="yyyy-MM-dd"/></td>
					                  <td>${boardVo.hits }</td>
					                </tr>
				                </c:forEach>
				              </tbody>
				            </table>
		  				</div>
		  			</div>
  				</div>  	
			</div>
			
			<!-- 페이징 처리 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="dataTables_paginate paging_bootstrap">
									
								<ul class="pagination">
									<!-- 이전블록으로 이동 -->
									<c:if test="${pagingInfo.firstPage>1 }">
										<li class="prev"><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">← Previous</a></li>
									</c:if>
								
									<c:forEach var="i" begin="${pagingInfo.firstPage }"  end="${pagingInfo.lastPage }">
										<c:if test="${i==pagingInfo.currentPage }">
											<c:set var="activeIndex" value="active"/>
										</c:if>
										<c:if test="${i!=pagingInfo.currentPage }">
											<c:set var="activeIndex" value=""/>
										</c:if>
											
										<li class="${activeIndex }"><a href="#" onclick="pageFunc('${i}')">${i }</a></li>
									</c:forEach>
									
									<!-- 다음블록으로 이동 -->
									<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
										<li class="next"><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">Next → </a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<!-- 페이징처리 끝-->
    	</div>
   </div>
</div>

	 <c:import url="../admin-include/admin-footer.jsp"/>
	 
	 <script type="text/javascript">
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
	</script>

	 
  </body>
</html>