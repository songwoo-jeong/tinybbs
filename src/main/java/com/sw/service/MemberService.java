package com.sw.service;

import com.sw.vo.MemberVO;

public interface MemberService {

	// 회원 가입 
	
	public void register(MemberVO memberVO) throws Exception;
	
	// 로그인 구현
	
	public MemberVO login(MemberVO memberVO) throws Exception;
	
}