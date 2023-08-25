package com.hobbyfield.app.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class CustomLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String errorMessage = "";
		
		if (exception instanceof AuthenticationServiceException) {
			errorMessage =  "존재하지 않는 사용자입니다.";
		
		} else if(exception instanceof BadCredentialsException) {
			errorMessage = "아이디 또는 비밀번호가 틀립니다.";
			
		} else if(exception instanceof LockedException) {
			errorMessage = "가입 승인이 거부된 기업 회원입니다. 관리자에게 문의해 주세요.";
			
		} else if(exception instanceof DisabledException) {
			errorMessage = "가입 승인 대기 중인 기업 회원입니다.";
		}
		
		errorMessage = URLEncoder.encode(errorMessage, "UTF-8");
		setDefaultFailureUrl("/member/login?error=true&exception=" + errorMessage);
		
		super.onAuthenticationFailure(request, response, exception);

	}
}
