<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<c:import url="../admin-include/admin-header.jsp"/>

  <body>
  	<c:import url="../admin-include/admin-navi.jsp"/>

	<!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/admin/memberList.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="searchCondition" value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="regType" value="${param.regType}">
		<input type="hidden" name="delFlag" value="${param.delFlag }">
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
		
				<form name="frmSearch" method="post" >
					<div class="row" style="margin-top:3%;">
						<div class="col-md-2">검색 결과</div>
						<div class="col-md-2">${totalRecord }개</div>		
					</div>
					<div class="row form-group" style="margin-top:3%;">
							<div class="col-md-2">검색조건</div>
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
								<input class="btn btn-primary btn-sm" type="button" value="검색" onclick="searchMember()">
							</div>
					</div>
					
					<div class="row">
						<div class="col-md-2">회원분류</div>
						<div class="col-md-2">
							<select class="form-control" name="regType" onchange="searchMember()">
								<option value="">전체회원</option>
								<option value="1" <c:if test="${param.regType=='1' }">selected="selected"</c:if>>일반회원</option>
								<option value="2" <c:if test="${param.regType=='2' }">selected="selected"</c:if>>기업회원</option>
							</select>						
						</div>
						
						<div class="col-md-2">
							<select class="form-control" name="delFlag" onchange="searchMember()">
								<option value="">전체회원</option>
								<option value="N" <c:if test="${param.delFlag=='N' }">selected="selected"</c:if>>이용회원</option>
								<option value="Y" <c:if test="${param.delFlag=='Y' }">selected="selected"</c:if>>삭제회원</option>
							</select>						
						</div>						
						
						<div class="col-md-2">
							회원삭제: 
							<button class="btn btn-danger btn-sm" type="button" onclick="memberDel('Y')">삭제</button>			
							<button class="btn btn-success btn-sm" type="button" onclick="memberDel('N')">삭제취소</button>			
						</div>
						
					</div>
				</form>
				
				
				
			

  				<div class="panel-body">
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>번호<input type="checkbox" name="chkAll" id="chkAll"></th>
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
							<c:if test="${!empty memberList }">
								<c:forEach var="memberVo" items="${memberList }">
									<tr class="odd gradeX">
										<td>${memberVo.memberSeq} <input type="checkbox" name="chkbox" value="${memberVo.memberSeq }"></td>
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
							</c:if>
							<c:if test="${empty memberList }">
								<tr class="odd gradeX">
									<td colspan="9">조회된 데이터가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					
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
		  
		</div>
    </div>
    
    <form name="delUserForm" method="post" action="/jobsearch/admin/memberDel.do">
    	<input type="hidden" name="memberSeq" id="memberSeq">
    	<input type="hidden" name="type" id="type">
    </form>

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
    

	<script>
								
		$(function(){
			$("#chkAll").click(function(){
				
				if($(this).is(":checked")){
					$("input[name=chkbox]").prop("checked",true);
				}else{
					$("input[name=chkbox]").prop("checked",false);
				}
			})
		})
				
		function memberDel(type){
			
			var obj = document.delUserForm;
			
			var cnt = 0;
			var length = $("input[name=chkbox]").is(":checked").length;
			var memberSeq = "";
			
			$("input[name=chkbox]").each(function(){
				if($(this).is(":checked")){
					cnt++;
					memberSeq += $(this).val() + ",";
				}
			})
			
			
			obj.memberSeq.value = memberSeq;
			obj.type.value = type;
			
			
			if(cnt == 0){
				alert("삭제 여부를 변경할 회원을 선택 해 주세요.");
				return false;
			}else{
				if( confirm("삭제 여부를 변경 하시겠습니까?") ){
					obj.action.value = "/jobsearch/admin/memberDel.do";
					obj.submit();
				}else{
					return false;
				}
			}
		}
		

		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
		
		function searchMember(selected){
			var obj = document.frmSearch;
			
			obj.submit();
		}
		
	</script>


  </body>
</html>