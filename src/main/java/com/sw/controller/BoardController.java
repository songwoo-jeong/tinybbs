package com.sw.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sw.service.BoardService;
import com.sw.vo.BoardVO;
import com.sw.vo.Criteria;
import com.sw.vo.PageMaker;
import com.sw.vo.PageMaker;
import com.sw.vo.Criteria;

@Controller
@RequestMapping(value = "/board/*")

public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception{
		logger.info("writeView");
		return "board/writeView";
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		service.write(boardVO);
		logger.info("write");
		return "redirect:/board/list";
	}
	
	// 게시판 목록 조회, 페이징 적용
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		model.addAttribute("list", service.list(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
		logger.info("list");
		return "board/list";			
	}

	// 게시판 상세조회
	@RequestMapping(value = "/board/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		model.addAttribute("read", service.read(boardVO.getBoardNum()));
		logger.info("write");
		return "board/readView";	
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		model.addAttribute("update", service.read(boardVO.getBoardNum()));	
		logger.info("write");
		return "board/updateView";
	}	
	// 게시판 수정
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		service.update(boardVO);
		logger.info("update");	
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception{
		service.delete(boardVO.getBoardNum());
		logger.info("delete");	
		return "redirect:/board/list";
	}
	
}
