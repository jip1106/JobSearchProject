﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../admin-include/admin-header.jsp"/>

  <body>


	<c:import url="../admin-include/admin-navi.jsp"/>

    <div class="page-content">
    	<div class="row">
    	
    	
		<c:import url="../admin-include/admin-left.jsp"/>
			
								<div class="col-md-6">
				<div class="content-box-large">
					<div class="panel-heading">
					<c:if test="${boardVo.boardType==1 }">					
		          		 <div class="panel-title"><i class="glyphicon glyphicon-info-sign"></i> 공지사항 수정</div>
		            </c:if>
		           	<c:if test="${boardVo.boardType==2 }">	
		          		 <div class="panel-title"><i class="glyphicon glyphicon-question-sign"></i> FAQ 수정</div>
		      		</c:if>
		      			<div class="panel-options">
							<a href="<c:url value='/admin/board/list.do?boardType=${boardVo.boardType }'/>"><i class="glyphicon glyphicon-align-justify"></i>목록으로</a>
						</div>  		
		       </div>
					<div class="panel-body">
						<form method="post" action="<c:url value='/admin/board/edit.do'/>">
							<fieldset>
								<div class="form-group">
									<input class="form-control" type="hidden" name="boardSeq" value="${boardVo.boardSeq }">
								</div>												
								<div class="form-group">
									<input class="form-control" type="hidden" name="boardType" value="${boardVo.boardType }">
								</div>												
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="boardTitle" type="text" value="${boardVo.boardTitle }">
								</div>						
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" name="boardContents" rows="20">${boardVo.boardContents }</textarea>
								</div>			
							</fieldset>
							<div>
								<button type="submit" class="btn btn-lg btn-block btn-warning">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
  


	<c:import url="../admin-include/admin-footer.jsp"/>
	
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
	
	<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
	<script>
			 var ckeditor_config = {
			  	 filebrowserImageUploadUrl : "/jobsearch/imageUpload.do"
			 };
			 
			 CKEDITOR.replace("boardContents", ckeditor_config);
	</script>
  </body>
</html>