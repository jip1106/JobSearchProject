<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="./include/header.jsp" />
<c:import url="./include/headend.jsp" />

<script type="text/javascript">
	function annView(annSeq){
		window.open("<c:url value='/ann/detail.do?annSeq='/>"+annSeq, annSeq+"번 공고 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
		
	function comView(comSeq){
		window.open("<c:url value='/company/companydetail.do?comSeq='/>"+comSeq, comSeq+" 회사 상세보기", 
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

.text_div {
    margin-top: 26px;
    margin-bottom: 4px;
}
.text_div_p {
    margin-top: 26px;
    margin-bottom: 4px;
}
.text_title {
    color: #4876ef;
    font-size: 22px;
    line-height: 21px;
    font-weight: 600;
    margin-right: 10px;
}
.text_title2 {
    color: #FF9800;
    font-size: 26px;
    line-height: 21px;
    font-weight: 600;
    margin-right: 4px;
}
.text_title3 {
    color: #8e8e8e;
    font-size: 18px;
    line-height: 21px;
    font-weight: 600;
}
.text_ptitle {
    color: #4876ef;
    font-size: 22px;
    line-height: 21px;
    font-weight: 600;
    margin-right: 10px;
}
.text_ptitle2 {
    color: #ff5b4f;
    font-size: 26px;
    line-height: 21px;
    font-weight: 600;
    margin-right: 4px;
}
.text_ptitle3 {
    color: #8e8e8e;
    font-size: 18px;
    line-height: 21px;
    font-weight: 600;
}
hr.bottom_hr {
    border-color: white;
    margin-bottom: 29px;
}

.card_inner {
    border-top: 4px solid #779bf9;
    border-bottom: 1px solid #779bf9;
    border-right: 1px solid #779bf9;
    border-left: 1px solid #779bf9;
    margin: 9px 9px;
    width: 282px;
    height: 200px;
    padding: 10px 21px;
}
/* 효과 */
.card_inner {
	-webkit-transform:scale(1);
	-moz-transform:scale(1);
	-ms-transform:scale(1);	
	-o-transform:scale(1);	
	transform:scale(1);
	-webkit-transition:.3s;
	-moz-transition:.3s;
	-ms-transition:.3s;
	-o-transition:.3s;
	transition:.3s;
}
.card_inner:hover  {
	-webkit-transform:scale(1.1);
	-moz-transform:scale(1.1);
	-ms-transform:scale(1.1);	
	-o-transform:scale(1.1);
	transform:scale(1.1);
}
.card_inner_p {
	-webkit-transform:scale(1);
	-moz-transform:scale(1);
	-ms-transform:scale(1);	
	-o-transform:scale(1);	
	transform:scale(1);
	-webkit-transition:.3s;
	-moz-transition:.3s;
	-ms-transition:.3s;
	-o-transition:.3s;
	transition:.3s;
}
.card_inner_p:hover  {
	-webkit-transform:scale(1.1);
	-moz-transform:scale(1.1);
	-ms-transform:scale(1.1);	
	-o-transform:scale(1.1);
	transform:scale(1.1);
}

.card_inner_p {
    border-top: 4px solid #779bf9;
    border-bottom: 1px solid #779bf9;
    border-right: 1px solid #779bf9;
    border-left: 1px solid #779bf9;
    margin: 9px 9px;
    width: 282px;
    height: 200px;
    padding: 10px 21px;
} 

.img_test {
    width: 230px;
    height: 70px;
    margin-bottom: 24px;
    margin-top: -1px;
    text-align: center;
}
.comName {
    font-size: 17px;
    font-weight: 600;
    color: #3a3a3a;
}

.annDday {
    font-size: 14px;
    color: #FF5722;
    text-align: right;
}
span.annDday {
    font-size: 14px;
    color: #FF5722;
    text-align: right;
    position: relative;
    left: 174px;
    top: -21px;
}
.annTitle {
    font-size: 18px;
    margin-bottom: 3px;
    letter-spacing: -1px;
}
div#row_premium {
    max-width: 900px;
}
/* .box_outer {
    width: 279px;
    height: 418px;
    position: relative;
    left: 891px;
    top: -427px;
    display: flex;
    flex-wrap: wrap;
} */
.box_outer {
    width: 279px;
    height: 418px;
    position: absolute;
    left: 1262px;
    top: 122px;
    display: flex;
    flex-wrap: wrap;
}
hr#line_hr {
    margin-top: 26px;
}
#welcome {
    border: 2px solid #b7b7b7;
    width: 279px;
    height: 90px;
    margin-bottom: 16px;
    padding: 13px 0;
}
#login {
    background-color: #4876ef;
    width: 134px;
    height: 90px;
    margin-left: 0px;
    margin-right: 11px;
    border-radius: 13px;
}
div#login:hover {
    border: 2px solid #3d4fb7;
} 
div#join:hover {
    border: 2px solid #3d4fb7;
}
#join {
    background-color: #4876ef;
    width: 134px;
    height: 90px;
    border-radius: 13px;
    margin-bottom: 11px;
}
.banner {
    width: 100%;
    height: 69px;
    background-color: #84b2da;
    margin-bottom: 13px;
}
.ann {
    width: 100%;
    height: 235px;
    border: 1px solid gainsboro;
}
img.img-login {
    resize: both;
    height: 73px;
    position: relative;
    top: 7px;
    left: 13px;
}
img.img-join {
    resize: both;
    height: 76px;
    position: relative;
    top: 5px;
    left: 8px;
}
.ann_div {
    border-bottom: 1px solid gainsboro;
    font-size: 16px;
    font-weight: 600;
    padding: 5px 12px;
    color: #989898;
    background-color: whitesmoke;
}
.ann_cont_div {
    padding: 17px 15px;
}
.board_title {
    margin-bottom: 9px;
    color: #4e4e4e;
}
img.best_img {
    resize: both;
    height: 65px;
   	width:53px;
    position: relative;
    top: -12px;
    left: 177px;
    z-index: 10;
}
span.more {
    font-size: 13px;
    margin-left: 151px;
    color: #9897b1;
}
a.ann_link {
    text-decoration: none;
}
a.boardTitle_a {
    color: #777777;
}
img.mark_img {
    resize: both;
    height: 17px;
    width: 16px;
    margin-right: 7px;
    opacity: 0.85;
}
.name_text {
    text-align: center;
}
.jobsearch_cont {
    text-align: center;
}
span#name_text {
    font-size: 17px;
    color: #E91E63;
    font-weight: 600;
}
span.name_text2 {
    font-size: 15px;
    color: #8a8a8a;
}
span.jobsearch2 {
    font-size: 23px;
    letter-spacing: 0px;
    font-weight: bold;
    color: #4876ef;
}
span.jobsearch {
    font-size: 15px;
    color: #8a8a8a;
}
img.card-img-top {
    max-width: 190px;
    max-height: 95px;
}
/* 190X95 */
</style>

<body>
<c:import url="./include/navi.jsp"/>
  

  <!-- Page Content -->
  <div class="container" id="main_home">

	<!-- 프리미엄 -->
    <div class="left_premium">
     <div class="text_div_p">

   		 <span class="text_ptitle2">프리미엄</span>
   		 <span class="text_ptitle3">공고입니다!</span>
  	</div>
    <div class="row" id="row_premium">
		<c:if test="${empty premiumAnnList }">
	    		<div class="card mb-4">
	        		<div class="card-body">
		           		<p class="card-text">목록이 존재하지 않습니다</p>
		         	 </div>
	        	</div>     
	    </c:if>
	    <c:if test="${!empty premiumAnnList }">
	    	<c:forEach var="announceMentVo" items="${premiumAnnList }">
			        <div class="card_layout_p" onclick="annView(${announceMentVo.annSeq})" style="cursor: pointer;">
		          <div class="card_inner_p">
			          <div class="img_test"> 
			         	 	<img class="card-img-top" src="<c:url value='/resources/upload_images/${announceMentVo.comRenameimage }'/>" alt="${announceMentVo.comName } 로고">
			          </div>	
			            <div class="comName">${announceMentVo.comName }</div>
		            	<div class="annTitle">
			          		<c:if test="${fn:length(announceMentVo.annTitle)>17}">
								${fn:substring(announceMentVo.annTitle, 0, 17)}...
			     			</c:if>
							<c:if test="${fn:length(announceMentVo.annTitle)<=17}">
			          			${announceMentVo.annTitle }
							</c:if>	
			          	</div>		
			          	<span class="annDday">D-${announceMentVo.annDday }</span>				   	         
			          	<img class="best_img" src="<c:url value='/resources/images/best.png'/>">
		          </div>
			        </div>
     		</c:forEach>
		 </c:if>  
		 </div>
		 
		 <!-- 로그인, 회원가입 버튼 -->
		 <div class="box_outer">
		 <c:if test="${empty sessionScope.loginMember }">
		 	<div id="login">
		 		<a href="${pageContext.request.contextPath }/member/login.do">
		 			<img class="img-login" title="로그인" src="<c:url value='/resources/images/login.png'/>">
	 			</a>
		 	</div>
		 	<div id="join">
		 		<a href="${pageContext.request.contextPath }/member/register.do">
		 			<img class="img-join" title="회원가입" src="<c:url value='/resources/images/join.png'/>">
	 			</a>
		 	</div>
	 	 </c:if>	 	
 	     <c:if test="${!empty sessionScope.loginMember }">
 	     	<div id="welcome">
 	     	<div class="name_text">
 	     		 <span id="name_text">${sessionScope.loginMember.memberName}</span>
 	     		 <span class="name_text2">님 환영합니다.</span>
 	     	</div>
 	     	<div class="jobsearch_cont">
 	     		 <span class="jobsearch">구직활동은 </span>
 	     		 <span class="jobsearch2">Jobsearch </span>
 	     		 <span class="jobsearch">에서! </span>
     		</div>
		 	</div>
 	     </c:if>
			<div class="banner">
		 	</div>
		 	<div class="ann">
		 		<div class="ann_div">Notice
				 	<a class="ann_link" href="${pageContext.request.contextPath }/board/list.do?boardType=1">
			 			<span class="more">더보기></span>
		 			</a>
		 		</div>
		 
		 <!-- 공지사항 -->
	 		<div class="ann_cont_div">
		 		<c:if test="${empty boardList }">
		 			<div class="board_span">목록이 존재하지 않습니다.</div>
		 		</c:if>
		 		<c:if test="${!empty boardList }">
		 			<c:forEach var="boardVo" items="${boardList }">
		 				<div class="board_title">
		 				<img class="mark_img" src="<c:url value='/resources/images/notice_mark.png'/>">
		 				<span class="boardTitle">
		 					<a class="boardTitle_a" href="<c:url value='/board/detail.do?boardType=1&boardSeq=${boardVo.boardSeq }'/>">
			 					<c:if test="${fn:length(boardVo.boardTitle)>15}">
									${fn:substring(boardVo.boardTitle, 0, 15)}...
				     			</c:if>
								<c:if test="${fn:length(boardVo.boardTitle)<=15}">
				          			${boardVo.boardTitle }
								</c:if>	
							</a>
		 				</span>
		 				</div>
		 			</c:forEach>
		 		</c:if>
		 		
		 		
		 		</div>
		 	
		 	</div>
		 </div>
    </div>


    <hr id="line_hr">
    
    	<!-- 최신 공고  -->
    <div class="text_div">
   		 <span class="text_title2">최근 올라온</span>
   		 <span class="text_title3">공고입니다!</span>
  	</div>
    <div class="row">
    	<c:if test="${empty newAnnList }">
    		<div class="card mb-4">
        		<div class="card-body">
	           		<p class="card-text">목록이 존재하지 않습니다.</p>
	         	 </div>
        	</div>     
        </c:if>
        <c:if test="${!empty newAnnList }">
        	<c:forEach var="announceMentVo" items="${newAnnList }">
			      <div class="card_layout">
			        <div  class="card_inner" onclick="annView(${announceMentVo.annSeq})" style="cursor: pointer;">
					 <div class="img_test"> 
			         	 	<img class="card-img-top" src="<c:url value='/resources/upload_images/${announceMentVo.comRenameimage }'/>" alt="${announceMentVo.comName } 로고">
			          </div>		
			            <div class="comName">
					            ${announceMentVo.comName }
			            </div>
			          	<div class="annTitle">
				          		<c:if test="${fn:length(announceMentVo.annTitle)>17}">
									${fn:substring(announceMentVo.annTitle, 0, 17)}...
				     			</c:if>
								<c:if test="${fn:length(announceMentVo.annTitle)<=17}">
				          			${announceMentVo.annTitle }
								</c:if>	
			          	</div>			
			          	<div class="annDday">D-${announceMentVo.annDday }</div>			
			          	        
			        </div>
			      </div>
		    </c:forEach>
		 </c:if>
    	
          
    </div>
    <hr class="bottom_hr">
  <!-- /.container -->

</div>
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
