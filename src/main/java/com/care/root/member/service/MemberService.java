package com.care.root.member.service;

import java.sql.Date;

public interface MemberService {

	public int userCheck(String id, String pw);
	public void keepLogin(String sessionId, Date limitDate, String id);
}
