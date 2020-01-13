<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />

<script>

	var selectedList;
	var cnt = 0;

	
	function selectLocation2(locationSeq1,locationName1){
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
	
	function searchAnn(){
		
		calLocSeq();
		
		var locationSeq1 = $("#locationSeq1").val();
		var locationSeq2 = $("#locationSeq2").val();
		
		console.log("locationSeq1 : " + locationSeq1);
		console.log("locationSeq2 : " + locationSeq2);
		
		if(locationSeq1 == "" || locationSeq2 == ""){
			alert("지역별 검색 조건을 선택 해 주세요.");
			return false;
		}else{
			
		}
		
	}
</script>
<body>


<c:import url="/WEB-INF/views/include/navi.jsp" />

  <!-- Page Content -->
  <div class="container">
    <h1 class="mt-4 mb-3">지역별
      <small>검색지역을 선택해주세요</small>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        	지역별 공고 리스트
      </li>
    </ol>
    
    <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125);text-align:center;">
  		<div class="col-md-4" style="max-height:170px; overflow-y:scroll;">
  			<div class="row">
	  			<c:forEach var="locationVo" items="${locationList1 }">
	  				<div class="col-md-6 lg-6 sm-4 xs-4">
	  					<span onclick="selectLocation2('${locationVo.locationSeq1}','${locationVo.locationName }');">
	  						${locationVo.locationName }
	  					</span>
	  				</div>
	  			</c:forEach>
  			</div>
  		</div>  
  		<div class="col-md-8" style="border-left: 1px solid rgba(0,0,0,.125); max-height:170px; overflow-y:scroll;"> 
  			<div class="row" id="subLocationName">
  				← 지역을 먼저 선택 해 주세요..
  			</div>
  		</div>
    </div>
    
    <div class="row mb-4" style="border: 1px solid rgba(0,0,0,.125); text-align:center; height:100px;">
    	<div class="col-md-2"> 선택지역 :</div>
    	<div class="col-md-2">	 
    		<span id="selectedLoc1"></span>
    	</div>
    	<div class="col-md-8"> 
    		<span id="selectedLoc2"></span>
    	</div>
    </div>
    <div class="row">
    	<input type="button" value="검색" onclick = "searchAnn();"> 
    </div>

	<form name="annSearchByLoc" action='<c:url value=""/>'>
		<input type="text" name="locationSeq1" id="locationSeq1">
		<input type="text" name="locationSeq2" id="locationSeq2">
	</form>

    
    <%//공고영역 %>
    <div class="row mt-8">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Card Title</h4>
          <div class="card-body">
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Learn More</a>
          </div>
        </div>
      </div>
     </div>    
    

  </div>
  <!-- /.container -->


	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>
