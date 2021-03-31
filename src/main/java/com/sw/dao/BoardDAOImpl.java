package com.sw.dao;

import com.sw.vo.BoardVO;
import com.sw.vo.Criteria;
import com.sw.vo.Criteria;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}
	
	// 게시물 목록 조회, Criteria 객체 기껏 만들어 놓고 선언 안 해 줘서 리스트에 못 불러 왔었음. Criteria 객체 선언 까 먹지 말것.
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {	
		return sqlSession.selectList("boardMapper.listPage", cri);
	}

	// 전체 게시물 갯수 로드
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount");
	}
	// 게시글 상세 조회
	@Override
	public BoardVO read(int boardNum) throws Exception {
		return sqlSession.selectOne("boardMapper.read", boardNum);
	}
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
	}
	// 게시물 삭제
	@Override
	public void delete(int boardNum) throws Exception {	
		sqlSession.delete("boardMapper.delete", boardNum);
	}

}
