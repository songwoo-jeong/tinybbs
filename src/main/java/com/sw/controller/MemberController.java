package com.sw.controller;

import java.lang.reflect.Member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sw.service.MemberService;
import com.sw.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	MemberService service;
	
	// 회원가입 화면으로 이동 get 
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 화면에서 작성된 정보들 post로 넘김
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO memberVO) throws Exception {
		logger.info("post register");
		service.register(memberVO);
		return "redirect:/";
	}
	
	// 로그인 구현 - 세션 생성 후 세션에 로그인 정보 탑재
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		HttpSession session = req.getSession();
		MemberVO login = service.login(memberVO);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		return "redirect:/";
	}

	// 로그아웃 구현 - 세션 말소
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		return "/board/logout";
	}
}