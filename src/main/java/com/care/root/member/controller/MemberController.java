package com.care.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.MemberSessionName;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")	// /root/member/_____ 형식으로 경로 설정
public class MemberController implements MemberSessionName {

	@Autowired MemberService ms;
	
	@GetMapping("/login")	//컨트롤러의 리퀘스트매핑으로 인해 /root/member/login 경로로 생성
	public String login() {
		System.out.println("member/login 페이지 연결");
		return "member/login";
	}
	
	@PostMapping("/user_check")
	public String userCheck(@RequestParam String id, @RequestParam String pw,
							@RequestParam(required=false) String autoLogin, RedirectAttributes rs) {
							//autoLogin 체크가 되어 있지 않으면 null값
		System.out.println("member 로그인 확인");
		int result=ms.userCheck(id,pw);
		if(result==1) {	//로그인 성공일 때
			System.out.println(id +" 회원 : 로그인 성공");
			rs.addAttribute("id",id);	//jsp파일까지 연결 가능, session을 만들기 위함
			rs.addAttribute("autoLogin",autoLogin);
			return "redirect:successLogin";
		} else {	//로그인 실패 시
			System.out.println("로그인 실패");
			return "redirect:login";
		}
	}
	
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id, @RequestParam(required=false) String autoLogin,
							   HttpSession session, HttpServletResponse response/*쿠키:자동 로그인*/) {
		System.out.println("id : " + id);
		System.out.println("autoLogin : " + autoLogin);
		session.setAttribute(LOGIN, id);		//session 세팅
		
		if(autoLogin!=null) {	//사용자가 자동로그인을 체크했다면
			int limitTime = 60*60*24*90;	//90일
			Cookie loginCookie = new Cookie("loginCookie",session.getId());	//value:session.getId() id값이 유일한 값이기 때문
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());	//java.util.Date
			cal.add(Calendar.MONTH, 3); //3개월 후로 세팅
			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());		//util.Date->sql.Date로 변환
			
			ms.keepLogin(session.getId(), limitDate, id);	//DB로 연결
		}
		return "member/successLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response,
		/*자동로그인 해제를 위한*/ @CookieValue(value="loginCookie",required=false) Cookie loginCookie) {
		if(session.getAttribute(LOGIN)!=null) {
			if(loginCookie != null) {
				loginCookie.setPath("/");			//현재 매핑이 /member/*로 되어있기 때문에 최상위에서 쿠키를 삭제해주기 위해 필요
				loginCookie.setMaxAge(0);			//시간을 0으로 세팅 ->쿠키 소멸
				response.addCookie(loginCookie);	//사용자에게 쿠키 전달
				ms.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));	
				//				  ↑ nan:db의 cookie값의 디폴트값,							↑ session값
			}
		}
		session.invalidate();
		System.out.println("로그아웃 진행 : session,cookie 삭제");
		return "redirect:/index";		// '/'로 최상위부터 연결
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) { //jsp파일까지 값을 전달해야하기 때문에 Model 객체 사용
		System.out.println("membership 선택");
		if(session.getAttribute(LOGIN)!=null) {
			System.out.println(LOGIN+" 회원 : membership 선택");
			ms.memberInfo(model);
			return "member/memberinfo";
		}
		return "redirect:login";
	}
	
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {	//개인정보만 출력하는 info.jsp
		ms.info(model,id);
		return "member/info";
	}
}