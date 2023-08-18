package com.hobbyfield.app.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.hobbyfield.app.member.service.MemberVO;

public class CustomUser implements UserDetails {
	
	private MemberVO member;
	
	public CustomUser(MemberVO member) {
		this.member = member;
	}
	
	public MemberVO getMemberInfo() {
		return this.member;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(member.getMemberGrd()));
		return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.member.getMemberPwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.member.getMemberEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		if (member.getMemberGrd().equals("A2") && member.getMemberComaccp().equals("AJ3")) {
			return false;
		}
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		if (member.getMemberGrd().equals("A2") && member.getMemberComaccp().equals("AJ1")) {
			return false;
		}
		return true;
	}

}
