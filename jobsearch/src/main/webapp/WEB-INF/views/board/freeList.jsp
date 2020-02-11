<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
	
<style type="text/css">
.unfold{
	float: right;
	cursor: pointer;
}
.answer{
	display: none;
}
.pagenum {
    text-align: center;
    padding: 0.5em;
}
/*새로 추가   */
.form-control {
    float: left;
    width: 200px;
    margin-left: 58%;
    margin-right: 0;
    height: calc(1.5em + .75rem + 2px);
}
.breadcrumb {
	clear: both;
}
ol.breadcrumb {
	margin-top: 17px;
}
div#container {
	max-width: 800px;
}
.FreeTitle {
    margin-bottom: 8px;
    margin-top: 120px;
}
span.Jobsearch {
    font-size: 32px;
    letter-spacing: -1px;
    font-weight: 500;
    color: #4876ef;
    font-weight: bold;
    letter-spacing: -2px;
}
span.text_span1 {
    font-size: 26px;
    margin-left: 8px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span2 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span3 {
    font-size: 26px;
    margin-left: 1px;
    color: #8e8e8e;
}
hr.title_hr {
    border: 1px solid white;
    margin: 0px 0 -78px 0;
}

button.btn.btn-primary {
    width: 53px;
    height: 38px;
    background-color: #4876ef;
    border-color: #4876ef;
}

h1#list_title {
    margin-top: 7px;
    position: relative;
    top: 47px;
    font-size: 30px;
    font-weight: bold;
    letter-spacing: -1px;
}

.faqlist {
    margin-top: 37px;
    margin-bottom: -16px;
}
h5.mb-0 {
    font-size: 17px;
    font-weight: 500;
    color: black;
}
.card-body {
    background: #f3f3f3;
}
hr.hr_bottom {
    border: 1.5px solid #5e87f1;;
}
img.open_down {
    background-color: #5e87f1;
    resize: both;
    width: 16px;
    height: 15px;
}
table.box2 {
    width: 100%;
}
th {
    color: #7b7b7b;
}
div#freelist_part {
	border-top: 2px solid #4876ef;
	border-bottom: 2px solid #4876ef;
    padding: 11px 40px;
}
div#freelist_part2 {
    border-bottom: 1.3px solid #d0d0d0;
    padding: 12px 48px;
}
span.num {
    margin-right: 165px;
    font-weight: 600;
    color: #7b7a91;
}
span.title {
    margin-right: 157px;
    font-weight: 600;
    color: #7b7a91;
}
span.member {
    margin-right: 75px;
    font-weight: 600;
    color: #7b7a91;
}
span.regdate {
    margin-right: 64px;
    font-weight: 600;
    color: #7b7a91;
    
}
span.hits {
	font-weight: 600;
    color: #7b7a91;
}
td.num2 {
    font-weight: 600;
    color:#5e87f1;
    position: relative;
    text-align: center;
    /* left: 12px; */ 
}
td.title2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 89px; 
}
td.member2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 134px;
    text-align: center;
}
td.regdate2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 192px;
    text-align: center;
     
}
td.hits2 {
	font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 257px;
    text-align: center;
}
div#card-header {
    border-bottom: 0.5px solid #bdbdbd;
    padding: 16px 0px;
}
button.btn.btn-primary_write {
    margin-top: 12px;
    color: white;
    position: relative;
    left: 700px;
    top: -69px;
    background-color: #4876ef;
    border-color: #4876ef;
    width: 71px;
    height: 42px;
    letter-spacing: -1px;
}
h5.mb-0 {
    font-size: 17px;
    font-weight: 500;
    color: #7b7a91;
}
ul.pagination.justify-content-center {
    margin-top: 31px;
}
form#frmSearch {
    position: relative;
    top: -25px;
    left: 65px;
}
img#searchimg {
    resize: both;
    height: 28px;
    /* width: 29px; */
    position: relative;
    top: -3px;
    left: -7px;
}
img.bannerpicture {
    position: relative;
    left: -17px;
}
.bottom_banner {
    margin-top: -68px;
    margin-bottom: 17px;
}
nav.nav_side {
    position: fixed;
    top: 36px;
    height: 100%;
}
</style>
	
<c:import url="/WEB-INF/views/include/headend.jsp" />
	
	 <!-- Page Content -->
  <div class="container" id="container">
	<div class="FreeTitle">
	    <span class="Jobsearch">자유게시판</span>
    </div>
    <hr class="title_hr">
	<form id="frmSearch" name="frmSearch" method="post" action="<c:url value='/board/list.do?boardType=3'/>">
     <input type="hidden" name="searchCondition" value="3">
     <input type="text" class="form-control" name="searchKeyword" placeholder="검색">
     <button type="submit" class="btn btn-primary"><img id="searchimg"src="<c:url value='/resources/images/search.png'/>"/></button>
    </form>	
  
    
     <!-- 페이징 처리 관련 form -->
	<form action="<c:url value='/board/list.do?boardType=3'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition}">
		<input type="hidden" name="searchKeyword" 
			value="${param.searchKeyword}">
		<input type="hidden" name="currentPage" >
	</form>

    <div class="faqlist">
    	<c:if test="${empty list }">
	    	<div id="list_part">
		        <div id="card-header" role="tab" id="headingOne">
		          <h5 class="mb-0">
		           		목록이 존재하지 않습니다.
		          </h5>
		        </div>
	   	 	</div>
	    </c:if> 
	    
	    
	      <div id="freelist_part">
		      	<span class="num">번호</span>
		      	<span class="title">제목</span>
		      	<span class="member">작성자</span>
		      	<span class="regdate">작성일</span>
		      	<span class="hits">조회수</span>
	      </div>
   		<c:if test="${!empty list }">
    	<c:forEach var="boardVo" items="${list }"> 
	      <div id="freelist_part2">
	      <table>
	      <colgroup>
			<col style="width:5%;" />
			<col style="width:55%;" />
			<col style="width:15%;" />
			<col style="width:20%;" />
			<col style="width:5%;" />		
		  </colgroup>
	      <thead><tr><th></th></tr></thead>
	      <tbody>
     		<tr>
	      	<td class="num2"> ${boardVo.RNUM }</td>
	      	<td class="title2"> 
	      		<a href="<c:url value='detail.do?boardType=3&boardSeq=${boardVo.boardSeq }'/>"> 
				 <c:if test="${fn:length(boardVo.boardTitle)>12}">
						${fn:substring(boardVo.boardTitle, 0, 12)}...
	     		</c:if>
				<c:if test="${fn:length(boardVo.boardTitle)<=12}">
					${boardVo.boardTitle}
				</c:if>
					
				</a>
			</td>
	      	<td class="member2"> ${boardVo.memberName }</td>
	      	<td class="regdate2"> 
	      		 <fmt:formatDate value="${boardVo.regDate }" pattern="yyyy.MM.dd" />
	      	</td>
	      	<td class="hits2"> ${boardVo.hits }</td>
	      	</tr>
      	  </tbody>
	      </table>
	      </div>
	      </c:forEach>
	      </c:if>
	      </div>
	       <!-- Pagination -->
	       <div>
		    <ul class="pagination justify-content-center">
			 <c:if test="${pagingInfo.firstPage>1 }">	
			      <li class="page-item">
			        <a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">
			          <span aria-hidden="true">&laquo;</span>
			          <span class="sr-only">Previous</span>
			        </a>
			      </li>
		      </c:if>
		      <c:forEach var="i" begin="${pagingInfo.firstPage }" 
				end="${pagingInfo.lastPage }">
				 <li class="page-item">
			        <a class="page-link" href="#" onclick="pageFunc(${i})">${i}</a>
			      </li>
			   </c:forEach>
		     <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				 <li class="page-item">
			        <a class="page-link" href="#" aria-label="Next" onclick="pageFunc(${pagingInfo.lastPage+1})">
			          <span aria-hidden="true">&raquo;</span>
			          <span class="sr-only">Next</span>
			        </a>
			      </li>
			 </c:if>
		    </ul>
	     
     <button class="btn btn-primary_write" 
     onclick="location.href = '<c:url value="/board/write.do?boardType=3"/>'">글쓰기</button>
     </div>
     
     <div class="bottom_banner">
 		<img  class="bannerpicture"src="<c:url value='/resources/images/picture6.jpg'/>">
 	</div>
   </div>
    
	<c:import url="/WEB-INF/views/include/sidenavi.jsp" />  
	<c:import url="/WEB-INF/views/include/navi.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script type="text/javascript">
		function pageFunc(curPage){
			document.frmPage.currentPage.value=curPage;
			
			document.frmPage.submit();
		}
	</script>
</body>

</html>