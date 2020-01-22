<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<!-- head start -->

<!-- 외부css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/resume.css'/>">


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
    margin: 30px 0 0 8px;
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
}
</style>
<script type="text/javascript">
	function deleteConfirm(annseq){
		 if (confirm("정말 삭제하시겠습니까?"))
		  {
			 location.href = "${pageContext.request.contextPath }/company/companyDeleteMyAnn.do?annSeq="+annseq;
		  } else {
		   alert("취소되었습니다");
		  }
			

	}
</script>

<c:import url="/WEB-INF/views/include/headend.jsp" />
<!-- head end -->

<body>
<c:import url="/WEB-INF/views/include/navi.jsp" />
<c:import url="/WEB-INF/views/include/companymypagenavitop.jsp" />

<!-- section start -->
	<div class="span_title_resume">공고 관리</div>
	<ul class="resume_notice">
		<li>공고 관리페이지입니다.</li>
		<li>공고를 누르시면 더 자세한 정보를 볼수 있습니다.</li>
	</ul> 
	<c:if test="${empty list}">
		<div class="card mb-4-bt">
	 		<div class="info_resume"> 
	 			<h3>등록된 공고가 없습니다.</h3>
	 			<a href="<c:url value='/company/companymypageannouncement.do'/>">지금 공고를 등록해보세요</a>   
	 		</div>
	 	</div>
	</c:if>
	<c:if test="${!empty list }">
	<c:forEach var="map" items="${list}">
	<a href="http://www.saramin.co.kr" target="_blank"/>
	 	<div class="card mb-4-bt">
	 		<div class="info_resume">               
               <strong class="tit">
                 <a href="#">
                	 <span class="point_color">${map['ANN_TITLE']} </span>
                	 <span class="point_color_comp">지원현황</span>
                	 <div class="point_color_gongchae">${map['ANN_TITLE']}</div>
               	 </a>
               </strong>
            <div class="desc">
               <span class="career_small">${map['CAREER_TYPE']}</span>|<span class="career_small2">${map['CAREER_DESC']}</span>|<span class="career_small2">${map['REF_LOCATIONSEQ1']}</span>                        
            </div>
            <span class="txt_date">${map['ANN_STDT']}</span>
            <c:if test="${empty map['REF_ANNOUNCEMENT'] }">
            <button type="button" class="btn_edit_complete" style=" margin-left: -208px;margin-top: 12px;"
            onclick="window.open('<c:url value="/company/companypay.do?annSeq=${map['ANN_SEQ']}"/>', 'payment', 'top=100px, left=100px, height=600px, width=600px')"
            >프리미엄으로 등록하기</button>
            </c:if>
            <button type="button" class="btn_edit_complete" onclick="location.href = '<c:url value="/company/companymypageannedit.do?annSeq=${map['ANN_SEQ']}"/>'">수정하기</button>
            <div class="wrap_manage_btn">
            	<button type="button" class="btn_delete" data-action="delete" data-track_event="resume_manage|button|delete" onclick = "deleteConfirm(${map['ANN_SEQ']})">
            		<span class="X">X</span>
           		</button>
            </div>
           </div>																																			

		</div>
    </a>
    </c:forEach>
    </c:if>
	
      
  
  
<!-- section end -->
<c:import url="/WEB-INF/views/include/companymypagenavibottom.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>
