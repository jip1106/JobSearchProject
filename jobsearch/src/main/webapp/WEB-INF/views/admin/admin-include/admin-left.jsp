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
                    <li><a href="${pageContext.request.contextPath }/admin/board/list.do?boardType=1"><i class="glyphicon glyphicon-info-sign"></i>공지사항 관리</a></li>
                    <li><a href="${pageContext.request.contextPath }/admin/board/list.do?boardType=2"><i class="glyphicon glyphicon-question-sign"></i>FAQ 관리</a></li>
                </ul>
             </div>
		  </div>