<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/headend.jsp" />

<script>
	function selectLocation2(locationSeq1){
		$.ajax({ 
			type:"POST", 
			url: '/jobsearch/loc/sublocList.do', 
			data:{"locationSeq1": locationSeq1 },
			dataType: "json", 
			cache : false, 
			success : function(resData){ 
				
				console.log(resData);
				
				var addHtml = '';
				
				for(var i=0; i<resData.length; i++){
					var locationName2 = resData[i].locationName2;
					var locationSeq2 = resData[i].locationSeq2;
										
					addHtml += '<div class="col-lg-4 mb-2"><input type="checkbox" value="' + locationSeq2 + '" id="loc2_' + i + '"></label></span>';
					addHtml +=  '<label for="loc2_' + i + '" onclick="addSelectedArea()">' + locationName2 + '</label>';
					addHtml += '</div>';
					
					$("#subLocationName").html(addHtml);
					
				}
			}, 
			error : function(xhr, status, e){ 
				console.log(status);
			} 
		});
	}
	
	function addSelectedArea(){
		
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
	  					<span onclick="selectLocation2('${locationVo.locationSeq1}')">${locationVo.locationName }</span>
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
