<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />

	<div class="container">
	    <!-- Page Heading/Breadcrumbs -->
	    <h1 class="mt-4 mb-3">인재검색</h1>
	
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item">
	        	인재검색
	      </li>
	    </ol>
	    <div class="row">
			<!-- 성별, 학력사항, 경력, 근무형태-->
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">성별</option>
							<option value="M">남</option>
							<option value="W">여</option>
						</select>
					</div>
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">학력</option>
							<option value="1">고등학교</option>
							<option value="2">대학교</option>
							<option value="3">대학원</option>
						</select>
					</div>
					
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">경력여부</option>
							<option value="1">신입</option>
							<option value="2">경력</option>
						</select>
					</div>
					
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">근무형태</option>
							<option value="1">신입</option>
							<option value="2">경력</option>
						</select>
					</div>	
				</div>
				<div class="row mt-4">
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">지역</option>
							<option value="M">남</option>
							<option value="W">여</option>
						</select>
					</div>
										
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">직종</option>
							<option value="1">신입</option>
							<option value="2">경력</option>
						</select>
					</div>	
				</div>				
			</div>
			
			<div class="col-md-4">
				<input type="button" value="검색" onclick="searchAnn('1');" class="btn btn-primary">
			</div>
						
	    </div>
	    
		<div class="row" style="margin-top:5%; margin-bottom:5%;">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>이력서요약</th>
						<th>등록일</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>내용1</td>
						<td>내용2</td>
						<td>내용3</td>
					</tr>
					<tr>
						<td>내용1</td>
						<td>내용2</td>
						<td>내용3</td>
					</tr>
					<tr>
						<td>내용1</td>
						<td>내용2</td>
						<td>내용3</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<ul class="pagination justify-content-center">
		
		      <li class="page-item">
		        <a class="page-link" href="#" aria-label="Previous">
		          <span aria-hidden="true">«</span>
		          <span class="sr-only">Previous</span>
		        </a>
		      </li>
			  
			  <li class="page-item">
		        <a class="page-link" href="#">1</a>
		      </li>
		      
		      <li class="page-item">
		        <a class="page-link" href="#" aria-label="Next">
		          <span aria-hidden="true">»</span>
		          <span class="sr-only">Next</span>
		        </a>
		      </li>
	    
	    </ul>		
	</div>  


<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
