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
	    	검색조건 : 경력, 학력
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
