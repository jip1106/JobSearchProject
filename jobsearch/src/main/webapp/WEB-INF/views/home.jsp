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
		window.open("<c:url value='/company/detail.do?comSeq='/>"+comSeq, comSeq+"번 회사정보 상세보기", 
		"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		event.stopPropagation();
		event.preventDefault();
	}
	
	function login_onmouseover(){
		login.innerText="로그인";
		login.style.color="gray";
	}
	
	function login_onmouseout(){
		login.innerText="마우스를 여기에 위치해보세요.";
		login.style.color="Black";
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
.card_inner_p {
	/* -webkit-transform:scale(1.1); */
	/* -moz-transform:scale(1.1); */
	/* -ms-transform:scale(1.1);	 */
	/* -o-transform:scale(1.1);	
	transform:scale(1.1);  */
	/* -webkit-transition:.3s;
	-moz-transition:.3s;
	-ms-transition:.3s;
	-o-transition:.3s;
	transition:.3s; */
} 
.card_inner_p:hover {
    border: 2px solid #fe5b4e;
}

.img_test {
    margin: auto;
    width: 230px;
    height: 70px;
    margin-bottom: 18px;
    margin-top: 6px;
}
.comName {
    font-size: 16px;
    font-weight: 600;
    color: #3a3a3a;
}

.annDday {
    font-size: 14px;
    color: #FF5722;
    text-align: right;
}
.annTitle {
    font-size: 18px;
    margin-bottom: 3px;
    letter-spacing: -1px;
}
div#row_premium {
    max-width: 900px;
}
.box_outer {
    width: 279px;
    height: 418px;
    position: relative;
    left: 891px;
    top: -427px;
    display: flex;
    flex-wrap: wrap;
}
hr#line_hr {
    margin-top: -395px;
}
#login {
    background-color: #4876ef;
    width: 134px;
    height: 90px;
    margin-left: 0px;
    margin-right: 11px;
    border-radius: 13px;
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
    height: 72px;
    background-color: #84b2da;
    margin-bottom: 10px;
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
</style>

<body>
<c:import url="./include/navi.jsp"/>
  

  <!-- Page Content -->
  <div class="container" id="main_home">


    <!-- Portfolio Section -->
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
			          <a href="#"><img class="card-img-top" src="<c:url value='/resources/upload_images/${announceMentVo.comRenameimage }'/>" alt="${announceMentVo.comName } 로고"></a>
			            <h4 class="card-title">
			              <a href="#" onclick="comView(${announceMentVo.comSeq})">${announceMentVo.comName }</a>
			            </h4>
			            <p class="card-text">${announceMentVo.annTitle }</p>			   	         
		          </div>
			        </div>
     		</c:forEach>
		 </c:if>  
		 </div>
		 <div class="box_outer">
		 	<div id="login" onmouseover=login_onmouseover() onmouseout=login_onmouseout()>
		 		<a href="#"><img class="img-login" src="<c:url value='/resources/images/login.png'/>"></a>
		 	</div>
		 	<div id="join" onmouseover=join_onmouseover()>
		 		<a href="#"><img class="img-join" src="<c:url value='/resources/images/join.png'/>"></a>
		 	</div>
		 	<div class="banner">
		 	</div>
		 	<div class="ann">
		 	</div>
		 </div>
    </div>

    <!-- /.row -->

    <hr id="line_hr">
    
    <div class="text_div">
   		
   		 <span class="text_title2">최근 올라온</span>
   		 <span class="text_title3">공고입니다!</span>
  	</div>
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
			      <div class="card_layout">
			        <div  class="card_inner" onclick="annView(${announceMentVo.annSeq})" style="cursor: pointer;">
					<div class="img_test"> 
						<a href="#"><img class="card-img-top" src="<c:url value='/resources/upload_images/${announceMentVo.comRenameimage }'/>" alt="${announceMentVo.comName } 로고"></a>
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
