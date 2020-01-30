<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->
<style>
	.resumeInfo{
		display:block;
	}
</style>

<script>
	function searchResume(){
		var obj = document.getElementById("frmSearch");
		obj.submit();
	}
	
	function resumeDetail(resumeSeq){
		window.open("<c:url value='/resume/detailResume.do?resumeSeq='/>"+resumeSeq, resumeSeq+"번 공고 상세보기", 
		"width=1050, height=1000, toolbar=no, menubar=no, scrollbars=no, resizable=no");
		event.stopPropagation();
		event.preventDefault();
		
	}
</script>
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
	    <form id="frmSearch" name="frmSearch" method="post" action="/jobsearch/resume/searchResume.do">
	    <div class="row">
			<!-- 성별, 학력사항, 경력, 근무형태-->
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<select class="form-control" name="genderType">
							<option value="">성별</option>
							<option value="M" <c:if test="${param.genderType== 'M' }"> selected </c:if>>남</option>
							<option value="W" <c:if test="${param.genderType== 'W' }"> selected </c:if>>여</option>
						</select>
					</div>
					<div class="col-md-3">
						<select class="form-control" name="eduType">
							<option value="">학력</option>
							<option value="1" <c:if test="${param.eduType == '1' }"> selected </c:if>>고등학교 </option>
							<option value="2" <c:if test="${param.eduType == '2' }"> selected </c:if>>대학교 </option>
							<option value="3" <c:if test="${param.eduType == '3' }"> selected </c:if>>대학원 </option>
						</select>
					</div>
					
					<div class="col-md-3">
						<select class="form-control" name="careerType">
							<option value="">경력여부</option>
							<option value="1" <c:if test="${param.careerType =='1' }"> selected </c:if>>신입</option>
							<option value="2" <c:if test="${param.careerType == '2' }"> selected </c:if>>경력</option>
						</select>
					</div>
					
					<div class="col-md-3">
						<select class="form-control" name="empType">
							<option value="">근무형태</option>
				        	<c:forEach var="map" items="${emp_list }"> 
				        		<option value="${map['EMP_TYPE']}" <c:if test="${map['EMP_TYPE'] == param.empType }">selected</c:if>>
				        			${map['EMP_NAME']}
				        		</option>
				        	</c:forEach>							

						</select>
					</div>	
				</div>
				<div class="row mt-4">
					<div class="col-md-3">
						<select class="form-control" name="cateSeq1">
							<option value="">직종</option>
							<c:forEach var="map" items="${cate_list }">
								<option value="${map['CATE_SEQ1'] }" <c:if test="${map['CATE_SEQ1'] == param.cateSeq1 }">selected</c:if>>
									${map['CATE_NAME1']}
								</option>
							</c:forEach>
						</select>
					</div>
										
					<div class="col-md-3">
						<select class="form-control" name="locationSeq1">
							<option value="">지역</option>
							<c:forEach var="map" items="${loca_list}">
								<option value="${map['LOCATION_SEQ1']}" <c:if test="${map['LOCATION_SEQ1'] == param.locationSeq1 }">selected</c:if>>
									${map['LOCATION_NAME']}
								</option>
							</c:forEach>
						</select>
					</div>	
				</div>				
			</div>
			
			<div class="col-md-4">
				<input type="button" value="검색" onclick="searchResume();" class="btn btn-primary">
			</div>
						
	    </div>
	    </form>
	    
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
					<c:if test="${resume_list.size() != 0 }">
						<c:forEach var="map" items="${resume_list }">
							<tr>
								<td>${map['MEMBER_NAME'] }</td>
								<td>
									<span>경력여부 : ${map['CAREER_TYPE']}</span>
									<span class="resumeInfo">이력서제목 : <strong><a href="#" onclick="resumeDetail('${map['RESUME_SEQ']}')">[${map['RESUME_TITLE'] }]</a></strong></span>
									<!--  
									<span>학력 : ${map['EDU_TYPE'] }</span>
									<span>성별 : ${map['GENDER_TYPE'] }</span>
									<span>메일 : ${map['MEMBER_ID'] }</span>
									<span class="resumeInfo">희망직종 : ${map['CATE_NAME1'] }</span>
									<span>희망지역 : ${map['LOCATION_NAME'] }</span>
									<span>희망연봉 : ${map['HOPE_SALARY'] }</span>
									<span>고용형태 : ${map['HOPE_EMPTYPE'] }</span>
									-->
								</td>
								<td>${map['RESUMEREGDATE'] }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${resume_list.size() == 0 }">
						<tr>
							<td colspan="3">해당 조건으로 검색된 이력서가 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<!-- ul class="pagination justify-content-center">
		
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
	    </ul-->		
	</div>  


<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
