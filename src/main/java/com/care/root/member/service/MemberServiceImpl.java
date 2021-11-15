package com.care.root.member.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper mapper;
	BCryptPasswordEncoder encoder;	//비밀번호 암호화
	
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	
	@Override
	public int userCheck(String id, String pw) {
		MemberDTO dto = mapper.userCheck(id);
		if(dto!=null) {	//아이디가 존재한다면
			//암호화 전 : if(pw.equals(dto.getPw())) {	//로그인 성공
			//암호화 후 : if(encoder.matches(pw, dto.getPw())) {	//(사용자 입력값, DB에서 가져온 값)
			if(encoder.matches(pw, dto.getPw()) || pw.equals(dto.getPw())) {
				return 1;
			}
		}
		return 0;	//로그인 실패
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);
	}

	@Override
	public void memberInfo(Model model) {
		model.addAttribute("memberList",mapper.memberInfo());
	}

	@Override
	public void info(Model model, String id) {
		model.addAttribute("info",mapper.userCheck(id));
	}

	@Override
	public int register(MemberDTO dto) {
		System.out.println("비밀번호 암호화 전 : " + dto.getPw());
		String securePw = encoder.encode(dto.getPw());
		System.out.println("비밀번호 암호화 후 : " + securePw);
		dto.setPw(securePw);
		
		int result=0;
		try {
			result=mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	


}
