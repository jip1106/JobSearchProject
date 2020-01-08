<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li class="current"><a href="${pageContext.request.contextPath }/admin/memberList.do"><i class="glyphicon glyphicon-home"></i> 회원관리</a></li>
                    <!-- 
	                    <li><a href="calendar.html"><i class="glyphicon glyphicon-calendar"></i> Calendar</a></li>
	                    <li><a href="stats.html"><i class="glyphicon glyphicon-stats"></i> Statistics (Charts)</a></li>
	                    <li><a href="tables.html"><i class="glyphicon glyphicon-list"></i> Tables</a></li>
	                    <li><a href="buttons.html"><i class="glyphicon glyphicon-record"></i> Buttons</a></li>
                     -->
                    <li><a href="${pageContext.request.contextPath }/admin/notice/write.do"><i class="glyphicon glyphicon-info-sign"></i>공지사항</a></li>
                    <li><a href="${pageContext.request.contextPath }/admin/faq/write.do"><i class="glyphicon glyphicon-question-sign"></i>FAQ</a></li>
                    <li class="submenu">
                         <a href="#">
                            <i class="glyphicon glyphicon-list"></i> Pages
                            <span class="caret pull-right"></span>
                         </a>
                         <!-- Sub menu -->
                         <ul>
                            <li><a href="login.html">Login</a></li>
                            <li><a href="signup.html">Signup</a></li>
                        </ul>
                    </li>
                </ul>
             </div>
		  </div>