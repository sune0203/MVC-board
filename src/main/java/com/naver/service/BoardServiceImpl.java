package com.naver.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dao.BoardDao;
import com.naver.vo.BoardVO;
import com.naver.vo.Criteria;
import com.naver.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDao dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	@Override
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

}