package com.hobbyfield.app.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.member.mapper.MemberMapper;
import com.hobbyfield.app.member.service.MemberService;
import com.hobbyfield.app.member.service.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public int insertMember(MemberVO memberVO) {

		return memberMapper.memberJoin(memberVO);
	}

	@Override
	public int idChk(MemberVO memberVO) {
	
		return memberMapper.idChk(memberVO);
	}

}
