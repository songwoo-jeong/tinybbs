package com.sw.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.sw.dao.MemberDAO;
import com.sw.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	
	// 회원가입 
	@Override
	public void register(MemberVO memberVO) throws Exception {
		dao.register(memberVO);
	}
	
	// 로그인 구현
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(memberVO);
	}
	
}