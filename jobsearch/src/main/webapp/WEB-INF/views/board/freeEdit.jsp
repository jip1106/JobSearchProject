<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />

<script type=text/javascript>
$(function(){
	$("button.btn.btn-primary_edit").click(function(){
		if($("#input_5").val().length<1){
			alert("비밀번호를 입력해주세요!");
			$("#input_5").focus();
			event.preventDefault();
		}
	})
});

</script>
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
.breadcrumb {
	clear: both;
}
ol.breadcrumb {
	margin-top: 17px;
}
div#container {
	max-width: 750px;
}
button.btn.btn-primary {
    height: 44px;
    background-color: #5e87f1;
    border-color: #5e87f1;
}
button.btn.btn-primary_write {
    height: 44px;
    background-color: #5e87f1;
    border-color: #5e87f1;
}

h1#list_title {
    margin-top: -12px;
    position: relative;
    top: 47px;
    font-size: 30px;
    font-weight: bold;
    letter-spacing: -1px;
    margin-bottom: 61px;
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
img#searchimg {
    resize: both;
    height: 31px;
}
.card-body {
    background: #f3f3f3;
}
hr.hr_bottom {
    border: 1.5px solid #5e87f1;;
    margin-bottom: 32px;
}
span.Q {
    color: #5e87f1;
    font-size: 21px;
    margin-right: 11px;
}
span.A {
    color: #5e87f1;
    font-size: 21px;
    font-weight: 500;
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
	border-top: 3px solid #5e87f1;
	border-bottom: 3px solid #5e87f1;
    padding: 11px 11px;
}
div#freelist_part2 {
    border-bottom: 1.3px solid #d0d0d0;
    padding: 19px 11px;
}
span.num {
    margin-right: 35px;
    font-weight: 600;
    color: #7b7a91;
}
span.title {
    margin-right: 277px;
    font-weight: 600;
    color: #7b7a91;
}
span.member {
    margin-right: 88px;
    font-weight: 600;
    color: #7b7a91;
}
span.regdate {
    margin-right: 52px;
    font-weight: 600;
    color: #7b7a91;
}
span.hits {
	font-weight: 600;
    color: #7b7a91;
}
span.num2 {
    font-weight: 600;
    color:#5e87f1;
    position: relative;
    left: 12px;; 
}
span.title2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 62px; 
}
span.member2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 285px; 
}
span.regdate2 {
    font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 365px; 
     
}
span.hits2 {
	font-weight: 600;
    color: #7b7a91;
    position: relative;
    left: 416px;
}
div#card-header {
    border-bottom: 0.5px solid #bdbdbd;
    padding: 16px 0px;
}
button.btn.btn-primary_write {
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 574px;
    width: 71px;
}
button.btn.btn-primary_list {
	height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 336px;
    width: 71px;
}
button.btn.btn-primary_edit {
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    color: white;
    position: relative;
    left: 568px;
    width: 71px;
}
button.btn_delete {
    display: inline-block;
    margin-left: 4px;
    width: 23px;
    height: 23px;
    border: 1px solid #e8e8e8;
    border-radius: 50%;
    vertical-align: top;
    background: #f9f9f9;
    position: relative;
    top: -29px;
    left: 32.7em;
}

span.X {
    position: relative;
    top: -3px;
    left: -0.5px;
    font-weight: bold;
    color: #b3b3b3;
}
input#input_1 {/*  */
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 7px;
    border-radius: 0;
}
div.write_menu_div11 {
    font-size: 17px;
    color: white;
}
.write_menu_div2 {
    background-color: #5e87f1;
    width: 183px;
    height: 51px;
    text-align: center;
    float: left;
    padding: 12px 0;
    margin-right: 14px;
}
input#input_2 {
    height: calc(1.5em + .75rem + 6px);
    width: 81.7%;
    margin-bottom: 11px;
    border-radius: 0;
}
input#input_5 {
    height: calc(1.5em + .75rem + 6px);
    width: 81.7%;
    margin-bottom: 13px;
    border-radius: 0;
}
div.write_menu_div22 {
    font-size: 17px;
    color: white;
}

.write_menu2 {
    margin-bottom: 12px;
}
.write_menu_div3 {
    background-color: #5e87f1;
    width: 183px;
    height: 315px;
    text-align: center;
    float: left;
    padding: 136px 0;
    margin-right: 14px;
}
textarea#input_3 {
    height: calc(1.5em + .75rem + 280px);
    width: 100%;
    margin-bottom: 11px;
    border-radius: 0;
}
div.write_menu_div33 {
    font-size: 17px;
    color: white;
}
div.write_menu_div44 {
    font-size: 18px;
    color: white;
    margin-top: 168px;
}
hr.line1 {
    margin: 0;
    position: relative;
    top: 13px;
    color: white;
    border: 1px solid white;
}
hr.line2 {
    margin: 0;
    position: relative;
    top: 15px;
    color: white;
    border: 1px solid white;
}
hr.line3 {
    margin: 0;
    position: relative;
    top: 152px;
    color: white;
    border: 1px solid white;
}
.write_menu_div1 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
.write_menu_div2 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
.write_menu_div3 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    float: left;
    text-align: center;
    padding: 9px 0;
    margin-right: 7px;
}
span.top_regt {
    position: relative;
    left: 30.4em;
    top: -1.8em;
    font-size: 17px;
    color: #5e87f1;
    font-weight: bold;
}
span.top_reg {
    position: relative;
    left: 29em;
    top: -1.75em;
    font-size: 18px;
    font-weight: bold;
    color: #b9b9b9;
}
.button_group {
    margin-bottom: 23px;
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
    font-size: 23px;
    margin-left: 8px;
    color: #8e8e8e;
    letter-spacing: -1px;
}
span.text_span2 {
    font-size: 23px;
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
    border: 1px solid #4876ef;
    margin: 0px 0 -3px 0;
}
</style>
	
<c:import url="/WEB-INF/views/include/headend.jsp" />

<div class="container" id="container">
	<div class="FreeTitle">
	    <span class="Jobsearch">자유게시판</span>
	    <span class="text_span1">수정</span>
    </div>
     <hr class="title_hr">
	<span class=top_regt>등록일:</span>
	<span class=top_reg>
		 <fmt:formatDate value="${boardVo.regDate }" pattern="yyyy.MM.dd" />
	</span>
	<button type="button" class="btn_delete" data-action="delete" data-track_event="button_delete"
           	onclick="location.href = '<c:url value="/board/delete.do?boardSeq=${boardVo.boardSeq}"/>'">
  		<span class="X">X</span>
	</button>
	<form name="frmEdit" method="post" action="<c:url value='/board/edit.do'/>">
		<fieldset>
			<div class="write_menu1">
				<div class="write_menu_div1">
					<div class="write_menu_div11">작성자</div>
				</div>
				<input type="text" id="input_1" class="form-control" name="memberName" value="${boardVo.boardSeq }"
					readonly placeholder="작성자"> 
				<div class="write_menu_div2">
					<div class="write_menu_div22">제목</div>
				</div>
				<input type="text" id="input_2" class="form-control" name="boardTitle" value="${boardVo.boardTitle }" placeholder="제목">
				<textarea style="resize: none" id="input_3" class="form-control" name="boardContents" placeholder="내용">${boardVo.boardContents }</textarea>
				<div class="write_menu_div3">
					<div class="write_menu_div33">비밀번호</div>
				</div>
				<input type="password" id="input_5" class="form-control" name="memberPwd" placeholder="비밀번호확인">
				<input type="hidden" id="input_3" class="form-control" name="boardType" value="3"> 
				<input type="hidden" id="input_4" class="form-control" name="refMemberseq" value="${boardVo.refMemberseq }">
				<input type="hidden" id="input_6" class="form-control" name="boardSeq" value="${boardVo.boardSeq }">
			</div>
		</fieldset>
		<div class="button_group">
			<button type="submit" class="btn btn-primary_edit">수정</button>
			<button class="btn btn-primary_write">댓글</button>
			<button class="btn btn-primary_list" onclick="<c:url value='/board/list.do?boardType=3'/>">목록</button>
		</div>
	</form>

</div>


	<c:import url="/WEB-INF/views/include/navi.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
</body>

</html>