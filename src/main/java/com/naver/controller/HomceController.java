package com.naver.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.service.BoardService;
import com.naver.vo.BoardVO;
import com.naver.vo.Criteria;
import com.naver.vo.PageMaker;
import com.naver.vo.SearchCriteria;

@Controller
@RequestMapping("/")
public class HomceController {

	private static final Logger logger = LoggerFactory.getLogger(HomceController.class);

	@Inject
	BoardService service;

	// 게시판 글 작성
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {
		logger.info("home");
		return "home";
	}

}