<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../admin-include/admin-header.jsp"/>

  <body>


	<c:import url="../admin-include/admin-navi.jsp"/>

    <div class="page-content">
    	<div class="row">
    	
    	
		<c:import url="../admin-include/admin-left.jsp"/>
			
		  <div class="col-md-10">
  			<div class="row">
  				<div class="col-md-6">
  					<div class="content-box-large">
		  				<div class="panel-heading">
							<div class="panel-title">FAQ 목록</div>
							
							<div class="panel-options">
								<a href="<c:url value='/admin/board/write.do?boardType=2'/>"><i class="glyphicon glyphicon-upload"></i>등록</a>
								<a href="#"><i class="glyphicon glyphicon-trash"></i>삭제</a>
							</div>
						</div>
		  				<div class="panel-body">
		  					<table class="table table-bordered">
				              <thead>
				                <tr>
				               	  <th>선택</th>
				                  <th>번호</th>
				                  <th>질문</th>				                
				                  <th>작성자</th>
				                  <th>등록일</th>
				                  <th>조회수</th>
				                </tr>
				              </thead>
				              	<c:forEach var="boardVo" items="${list }">
					                <tr>
					                  <td><input type="checkbox" name="chkdel" value="${boardVo.boardSeq }"></td>
					                  <td>${boardVo.boardSeq }</td>
					                  <td>${boardVo.boardTitle }</td>
					                  <td>${boardVo.memberId }</td>
					                  <td>${boardVo.regDate }</td>
					                  <td>${boardVo.hits }</td>
					                </tr>
				              	</c:forEach>			             
				              </tbody>
				            </table>
		  				</div>
		  			</div>
  				</div>  	
			</div>
    	</div>
   </div>
</div>

	 <c:import url="../admin-include/admin-footer.jsp"/>
	 
  </body>
</html>