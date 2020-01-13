<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../admin-include/admin-header.jsp"/>

  <body>


	<c:import url="../admin-include/admin-navi.jsp"/>

    <div class="page-content">
    
    	<!-- 페이징 처리 관련 form -->
			<form action="<c:url value='/admin/board/list.do?boardType=2'/>" 
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
							<div class="panel-title">FAQ 목록</div>
							
							<div class="panel-options">
								 <form name="frmBoardDel" method="post" action="<c:url value='/admin/board/delete.do?boardType=2'/>">
							    	<input type="hidden" name="boardDelList" id="boardDelList" value="">					
							   	 </form>
								<a href="<c:url value='/admin/board/write.do?boardType=2'/>"><i class="glyphicon glyphicon-upload"></i>등록</a>
								<a onclick="boardDel()" style="cursor: pointer;"><i class="glyphicon glyphicon-trash"></i>삭제</a>
							</div>
						</div>
		  				<div class="panel-body">
		  					<table class="table table-bordered">
				              <thead>
				                <tr>
				               	  <th width="10%"><input type="checkbox" id="chkAll"> 선택</th>
				                  <th width="8%">번호</th>
				                  <th width="40%">질문</th>				                
				                  <th>작성자</th>
				                  <th>등록일</th>
				                  <th>조회수</th>
				                </tr>
				              </thead>
				              <tbody>
				              	<c:if test="${empty list }">				       
									<tr style="text-align: center">
										<td colspan="6">FAQ가 존재하지 않습니다.</td>
									</tr>
								</c:if>  
								<c:if test="${!empty list }">
					              	<c:forEach var="boardVo" items="${list }">
						                <tr>
						                  <td><input type="checkbox" name="chkdel" value="${boardVo.boardSeq }"></td>
						                  <td>${boardVo.boardSeq }</td>
						                  <td><a href="<c:url value='/admin/board/edit.do?boardSeq=${boardVo.boardSeq }'/>">
												<c:if test="${fn:length(boardVo.boardTitle)>30}">
													${fn:substring(boardVo.boardTitle, 0, 30)}...
												</c:if>
												<c:if test="${fn:length(boardVo.boardTitle)<=30}">
													${boardVo.boardTitle}
												</c:if>										
											</a></td>
						                  <td>${boardVo.memberId }</td>
						                  <td><fmt:formatDate value="${boardVo.regDate }" 
											pattern="yyyy-MM-dd"/></td>
						                  <td>${boardVo.hits }</td>
						                </tr>
					              	</c:forEach>
					             </c:if>			             
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
	 
	 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>  
	 
	 <script type="text/javascript">
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
		
		$(function(){
			$("#chkAll").click(function(){
				
				if($(this).is(":checked")){
					$("input[name=chkdel]").prop("checked", true);
				}else{
					$("input[name=chkdel]").prop("checked", false);
				}
			})
		});
		
		function boardDel(){
			var chkList="";
			
			$("input[name='chkdel']:checked").each(function(){
				chkList=chkList+$(this).val()+",";
			});

			chkList = chkList.substring(0, chkList.lastIndexOf(","));
			
			if(chkList == ""){
				alert("삭제할 목록을 선택하세요.");
				return false;
			}
			
			if(confirm("선택 항목을 삭제 하시겠습니까?")){
				document.getElementById("boardDelList").value=chkList;
				$("form[name='frmBoardDel']").submit();
			}
		}
	</script>
	 
  </body>
</html>