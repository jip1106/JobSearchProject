<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
footer#footer {
    background-color: #f8f8f8;
    border-top: 1px solid #dedede;
    padding: -24px 0;
    height: 141px;
    padding: 19px 0;
}
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
div#contain {
    max-width: 858px;
}
.layout {
    display: flex;
}
a.Logo {
	font-family: 'Recipekorea';
    font-size: 26px;
    text-decoration: none;
    color: #d8d8d8;
}
.Logobox {
    width: 200px;
    padding: 32px 0;
}
.comcont {
    font-size: 13px;
    color: #b1b1b1;
}
.comcont2 {
    font-size: 13px;
    color: #b1b1b1;
}

.Contbox {
    padding: 14px 0;
}
div#contain {
    max-width: 650px;
}
</style>

<!-- Footer -->
<!-- <footer class="py-5" id="footer"> -->
<footer id="footer">
  <div class="container" id="contain">
  	<div class="layout">
  		<div class="Logobox">
			<a class="Logo" href="${pageContext.request.contextPath }/home.do">JobSearch</a>  			
  		</div>
  		<div class="Contbox">
  			<div class="comcont">
  				Jobsearch 고객센터 02-1234-56789 (평일09:00~18:30, 주말공휴일 휴무)
  			</div>
			<div class="comcont">
  				이메일: Jobsearch@jobsearch.co.kr, Fax:02-1234-56789
  			</div>
  			<div class="comcont">
  				(주)Jobsearch 서울특별시 서초구 1303-37 서초W타워 13층
  			</div> 
  			<div class="comcont2">
  				*위 내용은 사실이 아니며, 테스트에 사용된 내용입니다.
  			</div> 
  		</div>
  	</div>
  </div>
  <!-- /.container -->
</footer>