<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../admin-include/admin-header.jsp"/>

  <body>
  
	<script>
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
	</script>
  
  	<c:import url="../admin-include/admin-navi.jsp"/>

	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/admin/memberList.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="currentPage">
	</form>
	<!-- 페이징 처리 관련 form -->

    <div class="page-content">
    	<div class="row">
		  <c:import url="../admin-include/admin-left.jsp"/>
		  
		  <div class="col-md-10">
  			<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title">회원 리스트</div>
				</div>
				
				<div class="row form-group" style="margin-top:3%;">
					<form name="frmSearch" method="post" action='<c:url value="/admin/memberList.do"/>'>
						<div class="col-md-2 lg-2">
							<select class="form-control" name="searchCondition">
								<option value="">선택</option>
								<option value="member_name" <c:if test="${param.searchCondition=='member_name' }">selected="selected"</c:if>>이름</option>
								<option value="member_id" <c:if test="${param.searchCondition=='member_id' }">selected="selected"</c:if>>아이디</option>
								<option value="phone" <c:if test="${param.searchCondition=='phone' }">selected="selected"</c:if>>전화번호</option>
							</select>
						</div>
						<div class="col-md-4">
							<input class="form-control" type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}">
						</div>
						
						<div class="col-md-2">
							<input class="btn btn-primary btn-sm" type="submit" value="검색">
						</div>
						
					</form>
				</div>
				
				
				


  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>번호<input type="checkbox" name="chkAll"></th>
								<th>아이디</th>
								<th>회원이름</th>
								<th>전화번호</th>
								<th>회원유형</th>
								<th>삭제일</th>
								<th>삭제여부</th>
								<th>성별</th>
								<th>등록일</th>
								
							</tr>
						</thead>
						 
						<tbody>
							<c:forEach var="memberVo" items="${memberList }">
								<tr class="odd gradeX">
									<td>${memberVo.memberSeq} <input type="checkbox" name="chk" value="${memberVo.memberSeq }"></td>
									<td>${memberVo.memberId }</td>
									<td>${memberVo.memberName }</td>
									<td>${memberVo.phone }</td>
									<td>
										<c:if test="${memberVo.regType == 1 }">일반회원 </c:if>
										<c:if test="${memberVo.regType == 2 }">기업회원 </c:if>
									</td>
									<td>${memberVo.delDate }</td>
									<td>${memberVo.delFlag }</td>
									<td class="center"> 남자</td>
									<td class="center">
										${memberVo.regDate }
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- 페이징 처리 -->
					<div class="row">
						<div class="col-xs-12">
							<div class="dataTables_paginate paging_bootstrap">
									
								<ul class="pagination">
									<!-- 이전블록으로 이동 -->
									<c:if test="${pagingInfo.firstPage>1 }">
										<li class="prev disabled"><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">← Previous</a></li>
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
										<li class="next disabled"><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">Next → </a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<!-- 페이징처리 끝-->
  				</div>
  				

  				
  			</div>
		  </div>
		  
		</div>
    </div>

    <footer>
         <div class="container">
         
            <div class="copy text-center">
               Copyright 2014 <a href='#'>JobSearch</a>
            </div>
            
         </div>
      </footer>

      

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/vendors/datatables/dataTables.bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/tables.js"></script>
  </body>
</html>