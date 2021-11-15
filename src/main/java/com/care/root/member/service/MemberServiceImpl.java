package com.care.root.member.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper mapper;
	
	@Override
	public int userCheck(String id, String pw) {
		MemberDTO dto = mapper.userCheck(id);
		if(dto!=null) {
			if(pw.equals(dto.getPw())) {	//로그인 성공
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


}
