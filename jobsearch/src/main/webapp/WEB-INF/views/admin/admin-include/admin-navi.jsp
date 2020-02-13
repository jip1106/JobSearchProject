<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style>
@font-face { font-family: 'Recipekorea'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/Recipekorea.woff') format('woff'); font-weight: normal; font-style: normal; }
div#admin_navi {
    height: 6em;
    background-color: #10207d;
}
.logo {
    margin-top: 16px;
}
span.jobsearch_title {
    font-size: 23px;
    font-family: 'Recipekorea';
     color: white;
     text-decoration: none;
}
span.jobsearch_title2 {
    font-size: 22px;
    color: white;
    position: relative;
    top: 2px;
    text-decoration: none;
}
a.logoLink {
    text-decoration: none;
}
</style>
<div class="header" id="admin_navi">
     <div class="container">
        <div class="row">
           <div class="col-md-5">
              <!-- Logo -->
              <div class="logo">
                 <a class="logoLink" href="/jobsearch/admin/home.do">
                	 <span class="jobsearch_title">JobSearch</span>
                	 <span class="jobsearch_title2">_Admin(관리자)</span>
                 </a>
              </div>
           </div>
           <div class="col-md-5">

           </div>
           <div class="col-md-2">
              <div class="navbar navbar-inverse" role="banner">
                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                    <ul class="nav navbar-nav">
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="MyAccount">My Account <b class="caret"></b></a>
                        <ul class="dropdown-menu animated fadeInUp">
                           <li><a href="/jobsearch/home.do" target="parent">사용자페이지</a></li>
                           <li><a href="/jobsearch/member/logout.do">로그아웃</a></li>
                        </ul>
                      </li>
                    </ul>
                  </nav>
              </div>
           </div>
        </div>
     </div>
</div>