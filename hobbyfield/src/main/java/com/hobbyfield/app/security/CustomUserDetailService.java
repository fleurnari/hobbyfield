package com.hobbyfield.app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.hobbyfield.app.member.mapper.MemberMapper;
import com.hobbyfield.app.member.service.MemberVO;

public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		MemberVO member = new MemberVO();
		member.setMemberEmail(username);
		MemberVO vo = memberMapper.memberLogin(member);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
