package com.ezen.jobsearch.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ezen.jobsearch.member.model.MemberVO;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("컨트롤러 수행 전 호출 - preHandle()");
		
		HttpSession session = request.getSession();
		MemberVO memberVo = (MemberVO)session.getAttribute("loginMember");
		
		String loginPath="/member/login.do";
		PrintWriter out = response.getWriter();
		
		//로그인 안했을 때
		if(memberVo==null) {
			if(request.getRequestURI().indexOf("admin") > 0 ) {
				loginPath = "/admin/login.do";
			}
			response.setContentType("text/html;charset=utf-8");
			
			out.print("<script type='text/javascript'>");
			out.print("alert('로그인이 필요한 서비스 입니다.');");
			out.print("location.href='" + request.getContextPath() + loginPath +"';");
			out.print("</script>");
						
			return false;
			
		//로그인은 했지만 관리자가 아니면서 요청이 관리자일때
		}else if(request.getRequestURI().indexOf("admin") > 0 && !memberVo.getRegType().equals("0")) {
			loginPath = "/admin/login.do";
		
			response.setContentType("text/html;charset=utf-8");
			
			out.print("<script type='text/javascript'>");
			out.print("alert('관리자만 접근 가능합니다.');");
			out.print("location.href='" + request.getContextPath() + loginPath +"';");
			out.print("</script>");
		
			return false;
		
		//로그인은 했지만 일반회원이 아니면서 요청이 개인회원용일때	
		}else if(!memberVo.getRegType().equals("1") 
				&& request.getRequestURI().indexOf("mypage") > 0 
				|| request.getRequestURI().indexOf("Scrap") > 0
				|| request.getRequestURI().indexOf("resume") > 0
				|| request.getRequestURI().indexOf("apply") > 0) {
			
			response.setContentType("text/html;charset=utf-8");
			
			out.print("<script type='text/javascript'>");
			out.print("alert('일반회원으로  로그인하세요.');");
			out.print("location.href='" + request.getContextPath() + loginPath +"';");
			out.print("</script>");
			
			return false;
		
		//로그인은 했지만 기업회원이 아니면서 요청이 company일때
		}else if(!memberVo.getRegType().equals("2") && request.getRequestURI().indexOf("company") > 0) {
						
			response.setContentType("text/html;charset=utf-8");
			
			out.print("<script type='text/javascript'>");
			out.print("alert('기업회원으로  로그인하세요.');");
			out.print("location.href='" + request.getContextPath() + loginPath +"';");
			out.print("</script>");
		
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.info("컨트롤러 수행 후 호출 - postHandle()");
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("뷰 생성 후 호출 - postHandle()");
		
	}

}
