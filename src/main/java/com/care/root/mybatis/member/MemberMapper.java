package com.care.root.mybatis.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.care.root.member.dto.MemberDTO;

@Repository
public interface MemberMapper {

	public MemberDTO userCheck(String id);
	public void keepLogin(Map<String,Object> map);
}
