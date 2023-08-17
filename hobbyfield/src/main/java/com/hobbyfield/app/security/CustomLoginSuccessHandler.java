package com.hobbyfield.app.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hobbyfield.app.member.mapper.MemberMapper;
import com.hobbyfield.app.member.service.MemberVO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberVO member = new MemberVO();
		member.setMemberEmail(authentication.getName());
		
		member = memberMapper.memberLogin(member);
		
		request.getSession().setAttribute("member", member);
		
		response.sendRedirect(request.getContextPath() + "/");

	}

}
