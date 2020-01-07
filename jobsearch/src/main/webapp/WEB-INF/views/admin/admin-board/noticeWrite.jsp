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
		       </div>
					<div class="panel-body">
						<form action="">
							<fieldset>
								<div class="form-group">
									<input class="form-control" type="hidden" value="게시판 타입">
								</div>	
								<div class="form-group">
									<input class="form-control" type="hidden" value="회원 시퀀스">
								</div>						
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" placeholder="제목을 입력하세요" type="text">
								</div>						
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" placeholder="내용을 입력하세요" rows="20"></textarea>
								</div>			
							</fieldset>
							<div>
								<div class="btn btn-info">
									<i class="glyphicon glyphicon-bullhorn"></i>
									등록
								</div>
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