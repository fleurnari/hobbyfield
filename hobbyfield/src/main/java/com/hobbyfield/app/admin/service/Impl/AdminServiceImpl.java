package com.hobbyfield.app.admin.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.admin.mapper.AdminMapper;
import com.hobbyfield.app.admin.service.AdminService;
import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.member.service.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> selectMemberList(SearchCriteria scri) {
		
		return adminMapper.selectMemberList(scri);
	}

	@Override
	public List<MemberVO> selectComMemberList(SearchCriteria scri) {
		
		return adminMapper.selectComMemberList(scri);
	}
	
	@Override
	public int countMember(SearchCriteria scri) {
		
		return adminMapper.countMember(scri);
	}
	
	@Override
	public int countComMember(SearchCriteria scri) {
		
		return adminMapper.countComMember(scri);
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
