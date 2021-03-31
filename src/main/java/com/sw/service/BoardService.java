package com.sw.service;

import java.util.List;

import com.sw.vo.BoardVO;
import com.sw.vo.Criteria;
import com.sw.vo.Criteria;

public interface BoardService {

	// 게시글 작성
	
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시글 리스트 조회
	
	public List<BoardVO> list(Criteria cri) throws Exception;
	
	// 게시글 총 갯수
	
	public int listCount() throws Exception;
	
	// 게시글 상세조회
	
	public BoardVO read(int boardNum) throws Exception;
	
	// 게시물 수정
	
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	
	public void delete(int boardNum) throws Exception;
	
}
