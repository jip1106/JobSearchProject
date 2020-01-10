<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	
	<c:import url="/WEB-INF/views/include/headend.jsp" />

<body>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${boardVo.boardTitle } </h1>
    

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">공지사항</li>
    </ol>

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

       
        
        <!-- Date/Time -->
        <p><small>등록일 : <fmt:formatDate value="${boardVo.regDate }" pattern="yyyy-MM-dd"/>
						 &nbsp;&nbsp;&nbsp;조회수: ${boardVo.hits }</small></p>

        <hr>

        <!-- Post Content -->
       
        <p>${boardVo.boardContents }</p>
        <hr>
    	<div class="card-footer">
            <a href="<c:url value='/board/list.do?boardType=1'/>" class="btn btn-primary">목록으로</a>
        </div>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
	<c:import url="/WEB-INF/views/include/navi.jsp" />

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>
