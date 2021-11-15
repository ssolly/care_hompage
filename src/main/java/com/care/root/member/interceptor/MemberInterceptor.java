package com.care.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.MemberSessionName;

public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {
	//servlet-context.xml에서 bean으로 생성
	
	@Override	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("homecontroller, index 실행 전 실행");
		
		//request를 이용해서 session을 얻어옴
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)==null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인이 필요합니다');"
					+ "location.href='" + request.getContextPath() + "/member/login';</script>");
								//절대경로 : /root/member/login
			return false;
		}
		return true;	//요청한 페이지로 연결
	}
	
	
	
}
