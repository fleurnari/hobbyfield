package com.hobbyfield.app.club.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class ClubCommentVO {
//	COMMENT_NUMBER          NOT NULL NUMBER(4)      
//	BOARD_NUMBER            NOT NULL NUMBER(4)      
//	CLUB_NUMBER             NOT NULL NUMBER(4)      
//	CLUB_COMMENT_CONTENT    NOT NULL VARCHAR2(1000) 
//	CLUB_COMMENT_DATE                DATE           
//	CLUB_COMMENT_SECRET              VARCHAR2(4)    
//	CLUB_COMMENT_PARTNUMBER          NUMBER(4)      
//	CLUB_COMMENT_LEVEL               VARCHAR2(4)    
//	PROFILE_NICKNAME        NOT NULL VARCHAR2(50)   
	private int commentNumber;
	private int boardNumber;
	private String clubCommentContent;
	private Date clubCommentDate;
	private String clubCommentSecret;
	private int clubCommentPartnumber;
	private String clubCommentLevel;
	private String profileNickname;
	private String profileImg;
	private String profileImgPath;
	private String clubName;
	private String parentWriter;
	
}
