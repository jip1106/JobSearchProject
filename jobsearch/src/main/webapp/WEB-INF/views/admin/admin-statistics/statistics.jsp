<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../admin-include/admin-header.jsp"/>
  
<style>
div#statics {
    width: 65%;
    margin-left: 14em;
}
div#height {
    height: 40em;
}  
  
</style>
<body>  	

<c:import url="../admin-include/admin-navi.jsp"/>

<div class="page-content">
   	<div class="row">
	  
<c:import url="../admin-include/admin-left.jsp"/>
 
 <div class="col-md-10" id="adminLayout">
	 			  				
			<div class="row">
				<div class="col-md-6" id="statics">
					<div class="content-box-large" id="height">
  				<div class="panel-heading">
					<div class="panel-title">날짜별 지원자 통계</div>
				
				</div>
  				<div class="panel-body">
  					<div id="chart_div" style="height: 230px;"></div>
  				</div>
  			</div>
				</div>
			</div> 
			<div class="row">
				<div class="col-md-6" id="statics">
					<div class="content-box-large" id="height">
  				<div class="panel-heading">
					<div class="panel-title">분야별 등록된 공고</div>								
				</div>
  				<div class="panel-body">
  					<div id="chart_div2" style="width:100%;height:200px"></div>
	  				</div>
	  			</div>
 				</div>
 			</div>
			</div>		  			
  </div>
</div>

<c:import url="../admin-include/admin-footer.jsp"/>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/vendors/datatables/js/jquery.dataTables.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/vendors/datatables/dataTables.bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/tables.js"></script>
	
    
	<!-- 구글차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		google.charts.load('current', {packages:['corechart']});
	</script>
	<script>
		google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {				
		    
	        var jsonData = $.ajax({ 
	            url : "<c:url value='/applyStats.do'/>",
	            dataType : "json",
	            async : false
	        }).responseText;
	        
	        var jsonData2 = $.ajax({ 
	            url : "<c:url value='/announcementStats.do'/>",
	            dataType : "json",
	            async : false
	        }).responseText;
	        
	        
	        
	        //데이터테이블 생성
	        var data = new google.visualization.DataTable(jsonData);
	        var data2 = new google.visualization.DataTable(jsonData2);
	       
	        
	        
	          	        	        
	        
			// 그래프 옵션
			var options = {
				bar : {
					groupWidth : '15%' // 그래프 너비 설정 %
				},
				legend : {
					position : 'none' // 항목 표시 여부 (현재 설정은 안함)
				},
				'width':900,
                'height':400
			};
			var options2 = {
				    curveType: 'function',
				    'width':900,
	                'height':400
			};


			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
			var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
			chart.draw(data, options);
			chart2.draw(data2, options2);
		}
	</script>	

  </body>
</html>