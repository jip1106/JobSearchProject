<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />


<script>

	var selectedList;
	var cnt = 0;
	
	function selectLocation2(locationSeq1,locationName1){
		$("#selectedArea").show();
	
		selectedList = new Array();
		cnt = 0;
		
		$("#selectedLoc1").html(locationName1);
		$("#selectedLoc2").html("");
		
		$("#locationSeq1").val(locationSeq1);
		$("#locationSeq2").val("");
		
		$.ajax({ 
			type:"POST", 
			url: '/jobsearch/loc/sublocList.do', 
			data:{"locationSeq1": locationSeq1 },
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				//console.log(resData);
				var addHtml = '';
				
				for(var i=0; i<resData.length; i++){
					var locationName2 = resData[i].locationName2;
					var locationSeq2 = resData[i].locationSeq2;
										
					addHtml += '<div class="col-lg-4 mb-2"><input name="locationName2" type="checkbox" value="' + locationSeq2 + '" id="loc2_' + i + '">';
					addHtml +=  '<label for="loc2_' + i + '" onclick="addSelectedArea(\'' + locationName2 + '\', \'' + i + '\')">' + locationName2 + '</label>';
					addHtml += '</div>';
					
					$("#subLocationName").html(addHtml);
					
				}
			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}
	
	function addSelectedArea(locationName2,idx){
				
		//console.log("실행");
		var str= "";
		var checkedId = "loc2_" + idx;
		
		if(!$("#"+checkedId).prop("checked")){	//체크 한 경우
			selectedList[cnt++] = locationName2;		
		}else{
			for(var i=0; i<selectedList.length; i++){
				if(selectedList[i] == locationName2){
					selectedList[i] = '';
				}
			}
		}
		
		for(var i=0; i<selectedList.length; i++){
			str += selectedList[i] + "  ";
		}
		
		$("#selectedLoc2").html(str);
		
	}
	
	//지역2 seq 계산
	function calLocSeq(){
		
		var str = "";
		
		$("input[name=locationName2]").each(function(){
			if($(this).prop("checked")){
				str += $(this).val() + ",";
			}
		})
		
		console.log(str);
		$("#locationSeq2").val(str);
	}
	
	function searchAnn(currentPage){
		
		if($("#locationSeq2").val() == ""){
			calLocSeq();
		}
		
		var locationSeq1 = $("#locationSeq1").val();
		var locationSeq2 = $("#locationSeq2").val();
		
		//console.log("locationSeq1 : " + locationSeq1);
		//console.log("locationSeq2 : " + locationSeq2);
		
		if(locationSeq1 == "" || locationSeq2 == ""){
			alert("지역별 검색 조건을 선택 해 주세요.");
			return false;
		}else{
			document.annSearchByLoc.currentPage.value=currentPage;
			document.annSearchByLoc.submit();	
		}
		
	}
	
	function annView(annSeq){
		window.open("<c:url value='/ann/detail.do?annSeq='/>"+annSeq, annSeq+"번 공고 상세보기", 
				"width=1200, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
	}
	
</script>
<style>
	.location{
		cursor:pointer;
		margin-top:3px;
	}
	.cursor{
		cursor: pointer;
	}
/* 잡서치디자인추가 */
div#Location_container {
    width: 960px;
 	margin-top: 86px;
	margin-bottom: 51px;
}
.CateTitle {
    margin-bottom: 8px;
}
span.Jobsearch {
    font-size: 38px;
    letter-spacing: -1px;
    font-weight: 500;
    color: #4876ef;
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
    letter-spacing: -1px;
}
hr.title_hr {
    border: 1px solid #4876ef;
    margin: 0px 0 22px 0;
}
.row.mb-4 {
    margin: auto;
}
.col-md-8 {
    padding: 21px 56px;
}
.col-md-4 {
    padding: 7px 1;
    padding: 3px 32px;
}
div#subLocationName {
    position: relative;
    left: -17px;
    color: #a7a7a7;
}
div#selectedArea {
    padding: 19px 0;
}
.resultArea {
    margin-top: -7%;
    margin-bottom: 5%;
    font-size: 16px;
    color: #fb4c4c;
    padding: 11px;
}
input.btn.btn-primary {
    width: 71px;
    height: 42px;
    position: relative;
    left: 20px;
    top: -9px;
    background-color: #4876ef;
    border-color: #4876ef;

}
.col-md-2 {
    padding: 19px 0;
}

div#row_result {
    top: -67px;
    left: 5px;
    position: relative;
    width: 100%;
    font-size: 16px;
    color: #fb4c4c;
    margin: auto;
}

</style>
<body>


<c:import url="/WEB-INF/views/include/navi.jsp" />

  <!-- Page Content -->
  <div class="container" id="Location_container">
  <!--   <h1 class="mt-4 mb-3">지역별
      <small>검색지역을 선택해주세요</small>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        	지역별 공고 리스트
      </li>
    </ol> -->
    <div class="CateTitle">
	    <span class="Jobsearch">Jobsearch</span>
	    <span class="text_span1">지역별</span>
	    <span class="text_span2">검색창</span>
	    <span class="text_span3">입니다!</span>
    </div>
    <hr class="title_hr">
    <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125);text-align:center;">
  		<div class="col-md-4" style="max-height:170px; overflow-y:scroll;">
  			<div class="row">
	  			<c:forEach var="locationVo" items="${locationList1 }">
	  				<div class="col-md-6 lg-6 sm-4 xs-4 location">
	  					<span onclick="selectLocation2('${locationVo.locationSeq1}','${locationVo.locationName }');">
	  						${locationVo.locationName }
	  					</span>
	  				</div>
	  			</c:forEach>
  			</div>
  		</div>  
  		<div class="col-md-8" style="border-left: 1px solid rgba(0,0,0,.125); max-height:170px; overflow-y:scroll;"> 
  			<div class="row" id="subLocationName">
  				← 지역을 먼저 선택 해 주세요.
  			</div>
  		</div>
    </div>
    
    <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125); text-align:center; height:67px;">
    	<div class="col-md-2"> 선택지역 :</div>
    	<div class="col-md-2">	 
    		<span id="selectedLoc1"></span>
    	</div>
    	<div class="col-md-8"> 
    		<span id="selectedLoc2"></span>
    	</div>
    </div>
    <div class="row">
    	<div class="col-md-4"></div>
    	<div class="col-md-4"></div>
    	<div class="col-md-4" style="text-align:right;">
    		<input type="button" value="검색" onclick = "searchAnn('1');" class="btn btn-primary">
    	</div> 
    </div>

	<form name="annSearchByLoc" action='<c:url value="/ann/getAnnListByLoc.do"/>' method="post">
		<input type="hidden" name="locationSeq1" id="locationSeq1" value="${param.locationSeq1 }">
		<input type="hidden" name="locationSeq2" id="locationSeq2" value="${param.locationSeq2 }">
		<input type="hidden" name="currentPage" id="currentPage" value="1">
	</form>

    <%//공고영역 %>
    <c:if test="${!empty annList }">
   		<div>검색 결과(갯수 - ${searchCount }): ${searchLocName }
   			
   			<c:if test="${!empty searchLocNameList }">
   				<c:forEach var="searchList" items="${searchLocNameList}">
   					${searchList['LOCATION_NAME2'] }
   				</c:forEach>
   			</c:if>
   		</div>
	    <div class="row mt-8" style="margin-top:5%;">
	   	 		<c:forEach var="mapData" items="${annList }">

				  <div class="col-lg-4 mb-4 cursor" onclick="annView('${mapData['ANN_SEQ']}')">
			        <div class="card h-100 text-center">
			        	<c:if test="${!empty mapData['COM_IMG']}">
			        		<img class="card-img-top" src="" alt="회사이미지">
			        	</c:if>
			        	<c:if test="${empty mapData['COM_IMG']}">
			        		<img class="card-img-top" src="/jobsearch/image/no_image.PNG" alt="회사이미지">
			        	</c:if>
			          
			          <div class="card-body">
			            <h4 class="card-title">${mapData['ANN_TITLE'] }</h4>
			            <h6 class="card-subtitle mb-2 text-muted">${mapData['COM_NAME'] }</h6>
			            <p class="card-text">${mapData['ANN_DESC'] }</p>
			          </div>
			          <div class="card-footer">
			          	<p>지원기간 : <fmt:formatDate value ="${mapData['ANN_STDT']}" pattern="yyyy-MM-dd"/>~<fmt:formatDate value ="${mapData['ANN_ENDT']}" pattern="yyyy-MM-dd"/></p>
			          </div>
			        </div>
			      </div>			      
			   </c:forEach>
	     </div>
	     

	     
		    		 
		<ul class="pagination justify-content-center">
			<c:if test="${pagingInfo.firstPage>1 }">
		      <li class="page-item">
		        <a class="page-link" href="#" onclick="searchAnn('${pagingInfo.firstPage-1}')" aria-label="Previous">
		          <span aria-hidden="true">«</span>
		          <span class="sr-only">Previous</span>
		        </a>
		      </li>
	     	</c:if>
				
				<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage }">			  			  	 
				  <li class="page-item">
			        <a class="page-link" href="#" onclick="searchAnn('${i}')" 
			        	<c:if test="${i==pagingInfo.currentPage }">style="background-color:#dee2e6;"</c:if>>${i }</a>
			      </li>
			    </c:forEach>
      
			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		      <li class="page-item">
		        <a class="page-link" href="#" aria-label="Next" onclick="searchAnn('${pagingInfo.lastPage+1}')">
		          <span aria-hidden="true">»</span>
		          <span class="sr-only">Next</span>
		        </a>
		      </li>
	      	</c:if>
	    </ul>
	</c:if>	
	
	
	<c:if test="${searchCount == 0 }">
		<div class="row" id="row_result" style="text-align:center;height:100px;">
			[
			${searchLocName }   			
   			<c:if test="${!empty searchLocNameList }">
   				<c:forEach var="searchList" items="${searchLocNameList}">
   					${searchList['LOCATION_NAME2'] }
   				</c:forEach>
   			</c:if>
   			] 
   			조건으로 등록된 공고가 존재하지 않습니다.
		</div>
	</c:if>  

  </div>
  <!-- /.container -->

	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>
