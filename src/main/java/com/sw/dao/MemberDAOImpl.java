package com.sw.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sw.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	
	// 회원가입
	@Override
	public void register(MemberVO memberVO) throws Exception {
		sql.insert("memberMapper.register", memberVO);
	}
	
	// 로그인 구현
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("memberMapper.login", memberVO);	}
}