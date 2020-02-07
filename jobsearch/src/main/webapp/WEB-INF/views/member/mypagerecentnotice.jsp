<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">
<script type="text/javascript">
function button_event(viewSeq){
	  if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		 location.href= "<c:url value='/member/mypagerecentnoticeListDel.do?viewSeq="+viewSeq+"'/>"; 
	  }else{   //취소
	      return;
	  }
}
</script>

<style type="text/css">
.span_title_resume {
    list-style: telugu;
    color: #222;
    font-size: 29px;
    font-weight: bold;
    margin-bottom: 8px;
    margin-top: 22px;
}
ul.resume_notice {
    margin-left: -16px;
    margin-bottom: -28px;
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
    margin: 30px 0 0 19px;
}
.point_color{
	color: #4876ef;
	margin-right: 9px;
}

.point_color_comp{
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
    margin-right: 7px;
}
span.point_color_date {
    margin-right: 9px;
}
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
    z-index:10;
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
    top: -7px;
    left: 39.5em;
    z-index: 10;
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
    margin-bottom: 27px;
}

strong.attach_count {
    width: 132px;
    position: relative;
    top: -53px;
    left: 18em;
    font-size: 32px;
}
.point_color_gongchae {
    color: #ff521b;
    font-size: 17px;
    margin-top: -2px;
    letter-spacing: 0px;
}
.info_recentnotice .tit {
display: inline-block;
    padding-right: 5px;
    color: #FF5722;
    font-size: 18px;
    line-height: 30px;
    vertical-align: top;
    box-sizing: border-box;
    margin: 30px 0 53px 8px;
}

span#remain_time {
    color: #ff521b;
    font-size: 31px;
    margin-top: -2px;
    font-weight: bold;
    position: relative;
    left: 20.5em;
    top: -22px;
}
span.day_span {
    position: relative;
    left: 39.7em;
    top: -25px;
    color: #afafaf;
}


</style>

<script type="text/javascript">
	function annView(annSeq){
		window.open("<c:url value='/ann/detail.do?annSeq='/>"+annSeq, annSeq+"번 공고 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
</script>

<!-- head end -->
<c:import url="/WEB-INF/views/include/headend.jsp" />
<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/mypagenavitop.jsp" />
<!-- section start -->
	<div class="span_title_resume">최근본 공고</div>
	<ul class="resume_notice">
		<li>최근 내가 본 공고 입니다.</li>
		<li>공고를 누르시면 더 자세한 정보를 볼수 있습니다.</li>
	</ul> 
	
	<!-- 이력서 등록하기 -->
		<!-- <div class="col-lg-4"><a href="#" class="btn btn-primary" onclick="resume_apply">이력서등록하기</a></div> -->
			<strong class="attach_count">총 <span class="count_span">${count }</span>건</strong>
			
	<!-- 반복문 사용해서 통째로 뿌려주기 
	if문 사용해서 뿌려리기-->
	
	<a href="http://www.saramin.co.kr" target="_blank"></a>
	<c:if test="${!empty list}">
		 <c:forEach var="item" items="${list}">
	 	<div class="card mb-4-bt">
	 		<div class="info_resume">
               <input type="hidden" name="res_idx" value="14137844" id="res_idx">
               <strong class="tit">
                 <a href="#" onclick="annView(${item['ANNSEQ']})">
                	 <span class="point_color">[${item['COMTYPE']}] </span>
                	 <span class="point_color_comp">${item['COMNAME']}</span>
                	 <div class="point_color_gongchae">${item['TITLE']}</div>
               	 </a>
               </strong>
            <div class="desc">
               <span class="career_small">${item['CAREER']}</span>|<span class="career_small2">${item['AGE']}세 이상</span>|<span class="career_small2">${item['SALARY']}이상</span>                        
            </div>

            <span class="txt_date">
            <fmt:formatDate value="${item['REGDATE']}" pattern="yyyy.MM.dd" />
            </span>
            <button type="button" class="btn_edit_complete" onclick="annView(${item['ANNSEQ']})">지원하기</button>
            <div class="wrap_manage_btn">
           			<span id=remain_time>${item.TIME}</span> <span class=day_span>일</span>
            	<button type="button" class="btn_delete" data-action="delete" data-track_event="resume_manage|button|delete"
            	onclick="button_event(${item.VIEW_SEQ})">
            	<!-- <button type="button" onclick="button_event();">삭제하기</button> -->
            <%-- 	onclick="location.href = '<c:url value="/member/mypagerecentnoticeListDel.do?viewSeq=${item.VIEW_SEQ}"/>'"> --%>
            		<span class="X">X</span>
           		</button>
            </div>
           </div>
           
		</div>
		</c:forEach>
		</c:if>
	
	<!-- 이력서 목록이 없을 때  -->
	<a href="http://www.saramin.co.kr" target="_blank"></a>
	<c:if test="${empty list }">
	 	<div class="card mb-4-bt">
	 		<div class="info_recentnotice">
               <input type="hidden" name="res_idx" value="14137844" id="res_idx">
               <strong class="tit">
               		관심공고를 선택해주세요!
               </strong>
            <div class="desc">
            </div>
           </div>
		</div>
	</c:if>
	
      
  
  
<!-- section end -->
<c:import url="/WEB-INF/views/include/mypagenavibottom.jsp" />
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
