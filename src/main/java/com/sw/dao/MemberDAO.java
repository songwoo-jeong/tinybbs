package com.sw.dao;

import com.sw.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO memberVO) throws Exception;
	
	// 로그인 구현
	public MemberVO login(MemberVO memberVO) throws Exception;
	
}