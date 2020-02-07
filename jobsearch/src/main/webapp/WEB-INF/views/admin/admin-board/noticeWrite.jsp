<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
		           <div class="panel-title"><i class="glyphicon glyphicon-info-sign"></i> 공지사항 등록</div>
		      			<div class="panel-options">
							<a href="<c:url value='/admin/board/list.do?boardType=1'/>"><i class="glyphicon glyphicon-align-justify"></i>목록으로</a>
						</div>  		
		       </div>
					<div class="panel-body">
						<form method="post" action="<c:url value='/admin/board/write.do'/>">
							<fieldset>
								<div class="form-group">
									<input class="form-control" type="hidden" name="boardType" value="1">
								</div>	
								<div class="form-group">
									<input class="form-control" type="hidden" name="refMemberseq" value="${loginMember.memberSeq }">
								</div>						
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" placeholder="제목을 입력하세요" name="boardTitle" type="text">
								</div>						
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" placeholder="내용을 입력하세요" id="boardContents" name="boardContents" rows="20"></textarea>
								</div>			
							</fieldset>
							<div>
								<button type="submit" class="btn btn-lg btn-block btn-info">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
    
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


	<c:import url="../admin-include/admin-footer.jsp"/>
	
	<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
	<script>
			 var ckeditor_config = {
			  	 filebrowserImageUploadUrl : "/jobsearch/imageUpload.do"
			 };
			 
			 CKEDITOR.replace("boardContents", ckeditor_config);
	</script>
  </body>
</html>