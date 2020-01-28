<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<c:import url="./include/header.jsp" />
<c:import url="./include/headend.jsp" />

<script type="text/javascript">
	function annView(annSeq){
		window.open("<c:url value='/ann/detail.do?annSeq='/>"+annSeq, annSeq+"번 공고 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
	function comView(comSeq){
		window.open("<c:url value='/company/detail.do?comSeq='/>"+comSeq, comSeq+"번 회사정보 상세보기", 
		"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		event.stopPropagation();
		event.preventDefault();
	}
	
</script>

<style type="text/css">
.h-100{
	padding: 20px;
}
/* 잡서치 디자인 추가 */
div#comp_card {
    width: 300px;
    height: 200px;
    border-radius: 0;
    border-top: 3.5px solid #63a3f3;
}
div#main_home {
    max-width: 1200px;
}
</style>

<body>
<c:import url="./include/navi.jsp"/>
  
<!-- 캐러셀 주석처리 -->
  <!--  header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header-->

  <!-- Page Content -->
  <div class="container" id="main_home">


    <!-- Portfolio Section -->
    <h3>프리미엄 공고</h3>
    <div class="row">
		<c:if test="${empty premiumAnnList }">
	    		<div class="card mb-4">
	        		<div class="card-body">
		           		<p class="card-text">목록이 존재하지 않습니다.</p>
		         	 </div>
	        	</div>     
	    </c:if>
	    <c:if test="${!empty premiumAnnList }">
	    	<c:forEach var="announceMentVo" items="${premiumAnnList }">
			      <div class="col-lg-4 col-sm-6 portfolio-item">
			        <div class="card h-100" onclick="annView(${announceMentVo.annSeq})" style="cursor: pointer;">
			          <a href="#"><img class="card-img-top" src="../경로" alt="${announceMentVo.comName } 로고"></a>
			          <div class="card-body">
			            <h4 class="card-title">
			              <a href="#" onclick="comView(${announceMentVo.comSeq})">${announceMentVo.comName }</a>
			            </h4>
			            <p class="card-text">${announceMentVo.annTitle }</p>			   	         
			          </div>
			        </div>
			      </div>
     		</c:forEach>
		 </c:if>  
    </div>
    <!-- /.row -->

    <hr>
    <!-- Marketing Icons Section -->
    	 <h3 class="my-4">최근 올라온 공고</h3>
    <div class="row">
    	<!-- 최신 공고  -->
    	<c:if test="${empty newAnnList }">
    		<div class="card mb-4">
        		<div class="card-body">
	           		<p class="card-text">목록이 존재하지 않습니다.</p>
	         	 </div>
        	</div>     
        </c:if>
        <c:if test="${!empty newAnnList }">
        	<c:forEach var="announceMentVo" items="${newAnnList }">
			      <div class="col-lg-4 mb-4">
			        <div  class="card h-100" onclick="annView(${announceMentVo.annSeq})" style="cursor: pointer;">
			          <h4 >${announceMentVo.comName }</h4>
			          	<h5>${announceMentVo.annTitle }</h5>			        
			        </div>
			      </div>
		    </c:forEach>
		 </c:if>
    	
          
    </div>
    <hr>
  <!-- /.container -->

  <!-- Footer -->
  <!-- <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    /.container
  </footer> -->
</div>
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
