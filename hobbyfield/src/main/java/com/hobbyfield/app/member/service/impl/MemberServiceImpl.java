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
	public int idCheck(String memberEmail) {
	
		return memberMapper.idCheck(memberEmail);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {

		return memberMapper.memberLogin(memberVO);
	}

	@Override
	public int memberLtstUpdate(MemberVO memberVO) {

		return memberMapper.memberLtstUpdate(memberVO);
	}

	@Override
	public int memberPntUpdate(MemberVO memberVO) {

		return memberMapper.memberPntUpdate(memberVO);
	}

}
