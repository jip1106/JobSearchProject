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
									<textarea class="form-control" placeholder="내용을 입력하세요" name="boardContents" rows="20"></textarea>
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
  


	<c:import url="../admin-include/admin-footer.jsp"/>


  </body>
</html>