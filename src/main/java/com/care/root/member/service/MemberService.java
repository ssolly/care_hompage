package com.care.root.member.service;

import java.sql.Date;

import org.springframework.ui.Model;

public interface MemberService {

	public int userCheck(String id, String pw);
	public void keepLogin(String sessionId, Date limitDate, String id);
	public void memberInfo(Model model);
	public void info(Model model, String id);
}
