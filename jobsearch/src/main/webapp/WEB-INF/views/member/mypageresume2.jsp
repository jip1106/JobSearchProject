<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">
<script></script>

<style type="text/css">
.span_title_resume {
    /* text-align: center; */
    list-style: telugu;
    color: #222;
    font-size: 29px;
    font-weight: bold;
    margin-bottom: 8px;
    margin-top: 22px;
}
ul.resume_notice {
    margin-left: -16px;
}
a.btn.btn-primary {
    color: #ffffff;
    background-color: #5e87f1;
    border-color: #5e87f1;
    padding: 12px 11px;
    position: relative;
    left: 35.3em;
    top: -89px;
    margin-bottom: -60px;
    font-size: 17px;
}
.card.mb-4-bt {
    padding: 28px 0px 16px 9px;
    margin-bottom: 16px;
}
.count_span {
    color: #ff662f;
    font-weight: bold;
}
.txt_date
{
    position: absolute;
    top: 20px;
    left: 30px;
    color: #888;
    font-size: 13px;
    line-height: 17px;
    letter-spacing: 0;

}
.info_resume .tit {
    display: inline-block;
    padding-right: 5px;
    color: #222;
    font-size: 18px;
    line-height: 30px;
    vertical-align: top;
    letter-spacing: -2px;
    box-sizing: border-box;
    margin: 30px 0 0 8px;
}
.point_color{
	color: #4876ef;
	margin-right: 9px;
}

.point_color_date{
	color: black;
}
.list_manage_resume .info_resume .desc {
    padding-top: 7px;
    font-size: 15px;
    line-height: 20px;
    letter-spacing: 0;
}
.desc{
	font-size: 15px;
    margin: 9px 0 0 20px;
}
span.career_small {
    margin-right: 7px;
}
span.career_small2 {
    margin-left: 7px;
}
span.point_color_date {
    margin-right: 9px;
}
/* button.btn_edit_complete{
    border-color: #4876ef;
    color: #fff;
    background: #4876ef;
    border: none;
} */
button.btn_edit_complete {
    color: #ffffff;
    background-color: #5e87f1;
    border-color: #5e87f1;
    padding: 12px 11px;
    position: relative;
    left: 37.3em;
    top: -52px;
    height: 49px;
    margin-bottom: -60px;
    font-size: 17px;
    border: none;
    border-radius: 5px;
}
button.btn_delete {
    display: inline-block;
    margin-left: 4px;
    width: 21px;
    height: 21px;
    border: 1px solid #e8e8e8;
    border-radius: 50%;
    vertical-align: top;
    background: #f9f9f9;
    position: relative;
    top: -13px;
    left: 43.5em;
}

span.X {
    position: relative;
    top: -4px;
    left: -1px;
    color: #ccc3c3;
}

.card.mb-4-bt {
    padding: 28px 0 0px 9px;
    margin-bottom: 16px;
}
.wrap_manage_btn {
    position: relative;
    top: -7em;
}
.info_resume {
    height: 121px;
}
</style>



<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/mypagenavitop.jsp" />
	<script>
		function insertResume(resumeSeq){
			document.getElementById("frm").resumeSeq.value=resumeSeq;
			document.getElementById("frm").submit();
		}
	</script>

	<form name="frm" id="frm" method="post" action="/jobsearch/resume/resumeView.do">
		<input type="hidden" name="resumeSeq" value="" id="resumeSeq" >
	</form>
	
	<div class="span_title_resume">이력서현황</div>
	<ul class="resume_notice">
		<!-- <li>이력서는 최대 10개까지 작성하여 등록 가능합니다.</li> -->
		<li>이력서 지원은 1개의 이력서만 가능합니다.</li>
		<li>미완성 이력서는 이력서 등록이 완료되지 않은 상태에서 저장된 이력서입니다.</li>
	</ul>
	
	<!-- 이력서 등록하기 -->
		<div class="col-lg-4"><a href="/jobsearch/resume/resumeView.do"  class="btn btn-primary" >이력서등록하기</a></div>
			<strong class="attach_count">총 <span class="count_span">${resumeCount }</span>건</strong>
			
	
	<c:if test="${!empty resumeList }">	
		<c:forEach var="resumeVo" items="${resumeList }">
			<div class="card mb-4-bt">
		 		<div class="info_resume">
	               <input type="hidden" name="res_idx" value="14137844" id="res_idx">
	               <strong class="tit">
	                 <a href="#">
	                	 <span class="point_color">
	                	 	<c:if test="${resumeVo.resumeStatus==1 }">[미완성]</c:if>
	                	 	<c:if test="${resumeVo.resumeStatus==2 }">[완성]</c:if>
	                	 </span>
	                	 
	                	 <span class="point_color_date">${resumeVo.regDate }</span><span class="point_color_date">날 저장된 이력서 입니다.</span>
	               	 </a>
	               </strong>
		            <div class="desc">
		               <span class="career_small">신입</span>|<span class="career_small2">희망연봉란</span>                        
		            </div>
	           		<span class="txt_date">수정 2020.01.08</span>
	         	    <button type="button" class="btn_edit_complete" onclick="insertResume('${resumeVo.resumeSeq}')">완성하기</button>
		            <div class="wrap_manage_btn">
		            	<button type="button" class="btn_delete" data-action="delete" data-track_event="resume_manage|button|delete">
		            		<span class="X">X</span>
		           		</button>
		            </div>
	          	 </div>
        	</div>
		</c:forEach>          
      </c:if>
          
      <c:if test="${empty resumeList }">
      	<div class="card mb-4-bt">
           	<div class="info_resume">
               
               <strong class="tit">
               		등록된 이력서가 없습니다. 이력서를 등록 해 주세요.
               </strong>

          	 </div>
		</div>          	 
      </c:if>
		
	
    
    
	
	
      
  
  
<!-- section end -->
	<c:import url="/WEB-INF/views/include/mypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
