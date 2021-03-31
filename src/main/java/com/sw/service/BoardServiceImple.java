package com.sw.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sw.dao.BoardDAO;
import com.sw.vo.BoardVO;
import com.sw.vo.Criteria;
import com.sw.vo.PageMaker;
import com.sw.vo.Criteria;

@Service
public class BoardServiceImple implements BoardService {

	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	// 게시글 리스트 조회
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}

	// 게시글 총 갯수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}
	// 게시물 상세 조회
	@Override
	public BoardVO read(int boardNum) throws Exception {
		return dao.read(boardNum);
	}
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	// 게시물 삭제
	@Override
	public void delete(int boardNum) throws Exception {
		dao.delete(boardNum);
	}

}
