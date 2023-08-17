package com.hobbyfield.app.security;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hobbyfield.app.member.mapper.MemberMapper;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.pointrecord.mapper.PointRecordMapper;
import com.hobbyfield.app.pointrecord.service.PointRecordVO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	PointRecordMapper pointRecordMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberVO member = new MemberVO();
		member.setMemberEmail(authentication.getName());
		
		member = memberMapper.memberLogin(member);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		
		if ((member.getMemberLtstconn() == null) || !(dateFormat.format(new Date()).equals(dateFormat.format(member.getMemberLtstconn())))) {
			memberMapper.memberLtstUpdate(member);
			memberMapper.memberPntUpdate(member);
			
			PointRecordVO pointRecord = new PointRecordVO();
			pointRecord.setMemberEmail(member.getMemberEmail());
			pointRecordMapper.loginPointInsert(pointRecord);
			
		}
		
		request.getSession().setAttribute("member", member);
		
		response.sendRedirect(request.getContextPath() + "/");

	}

}
