<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
	
<script type="text/javascript">
$(function(){
	$("button.btn.btn-primary_write").click(function(){
		if($("input#input_2").val().length<1){
			alert("제목을 입력해주세요!");
			$("input#input_2").focus();
			event.preventDefault();
		}else if($("textarea#input_3").val().length<1){
			alert("내용을 입력해주세요!");
			$("textarea#input_3").focus();
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
	height: 44em;
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
    margin-top: 7px;
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
button.btn.btn-primary_write {/*  */
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 650px;
    width: 71px;
}
div.btn.btn-primary_list {/*  */
    height: 42px;
    background-color: #5e87f1;
    border-color: #5e87f1;
    margin-top: 0px;
    color: white;
    position: relative;
    left: 494px;
    width: 71px;
    padding: 8px 0px;
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
#write_menu_div2 {/*  */
    background-color: #5e87f1;
    width: 124px;
    height: 42px;
    text-align: center;
    float: left;
    padding: 9px 0;
    margin-right: 7px;
}
input#input_1 {/*  */
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 7px;
    border-radius: 0;
}
div.write_menu_div11 {/*  */
    font-size: 16px;
    color: white;
}
.write_menu_div2 {/*  */
    background-color: #5e87f1;
    width: 183px;
    height: 51px;
    text-align: center;
    float: left;
    padding: 12px 0;
    margin-right: 14px;
}
input#input_2 {/*  */
    height: calc(1.5em + .75rem + 6px);
    width: 81.8%;
    margin-bottom: 7px;
    border-radius: 0;
}
div.write_menu_div22 {/*  */
    font-size: 16px;
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
textarea#input_3 {/*  */
    height: calc(1.5em + .75rem + 280px);
    width: 100%;
    margin-bottom: 11px;
    border-radius: 0;
}
div.write_menu_div33 {
    font-size: 18px;
    color: white;
    margin-top: 147px;
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
    margin: 0px 0 23px 0;
}
a.tag_a {
    color: white;
    text-decoration: none;
}

</style>
	
<c:import url="/WEB-INF/views/include/headend.jsp" />

<div class="container" id="container">
	<div class="FreeTitle">
	    <span class="Jobsearch">자유게시판</span>
	    <span class="text_span1">작성</span>
    </div>
     <hr class="title_hr">
	<form name="frmSearch" method="post"
		action="<c:url value='/board/write.do'/>">
		<fieldset>
			<div class="write_menu1">
				<div class="write_menu_div1">
					<div class="write_menu_div11">작성자</div>
				</div>
				<input type="text" id="input_1" class="form-control" name="memberName" value="${sessionScope.loginMember.memberName}" readonly placeholder="작성자"> 
				<div id="write_menu_div2">
					<div class="write_menu_div22">제목</div>
				</div>
				<input type="text" id="input_2" class="form-control" name="boardTitle" placeholder="제목">
				<textarea style="resize: none" id="input_3" class="form-control" name="boardContents" placeholder="내용"></textarea>
				<input type="hidden" id="input_3" class="form-control" name="boardType" value="3"> 
				<input type="hidden" id="input_4" class="form-control" name="refMemberseq" value="${loginMember.memberSeq }"> 
			</div>
		</fieldset>
		<button type="submit" class="btn btn-primary_write">등록</button>
		<%-- <button class="btn btn-primary_list" onclick="location.href = '<c:url value='/board/freelist.do'/>'">목록</button> --%>
		
		<a href="<c:url value='/board/list.do?boardType=3'/>" class="tag_a">	
			<div class="btn btn-primary_list">목록</div>
		</a>
	
	</form>

</div>


<c:import url="/WEB-INF/views/include/navi.jsp" />
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	
</body>

</html>