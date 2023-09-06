package com.hobbyfield.app.club.member.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ClubMemberVO {
//	CLUB_MEMBER_NUMBER NOT NULL NUMBER(4)    
//	PROFILE_NICKNAME   NOT NULL VARCHAR2(50) 
//	CLUB_NUMBER        NOT NULL NUMBER(4)    
//	CLUB_JOIN_DATE     NOT NULL DATE   
	private int clubMemberNumber;
	private String profileNickname;
	private int clubNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clubJoinDate;
}
