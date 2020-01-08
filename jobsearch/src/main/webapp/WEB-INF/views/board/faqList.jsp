<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	 <div class="container">

	
    <h1 class="mt-4 mb-3">FAQ</h1>
	<!-- FAQ목록 -->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/home.do'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">FAQ</li>
    </ol>

    <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
     	<c:forEach var="boardVo" items="${list }">
	      <div class="card">
	        <div class="card-header" role="tab" id="headingOne">
	          <h5 class="mb-0">
	            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Q.${boardVo.boardTitle }</a>
	          </h5>
	        </div>
	
	        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
	          <div class="card-body">
	             A.${boardVo.boardContents }
	          </div>
	        </div>
	      </div>      
       </c:forEach>
    </div>

  </div>
	
	<c:import url="/WEB-INF/views/include/navi.jsp" />

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>