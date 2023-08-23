package com.hobbyfield.app.admin.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.admin.mapper.AdminMapper;
import com.hobbyfield.app.admin.service.AdminService;
import com.hobbyfield.app.member.service.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> selectMemberList() {
		
		return adminMapper.selectMemberList();
	}

	@Override
	public List<MemberVO> selectComMemberList() {
		
		return adminMapper.selectComMemberList();
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		
		return adminMapper.selectMember(memberVO);
	}

	@Override
	public int updateComMember(MemberVO memberVO) {
		
		return adminMapper.updateComMember(memberVO);
	}

	@Override
	public int deleteMember(String memberEmail) {
		
		return adminMapper.deleteMember(memberEmail);
	}

}
