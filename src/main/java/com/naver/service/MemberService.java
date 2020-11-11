package com.naver.service;

import com.naver.vo.MemberVO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	public MemberVO login(MemberVO vo) throws Exception;
	public void memberUpdate(MemberVO vo) throws Exception;
	public int idChk(MemberVO vo) throws Exception;
}