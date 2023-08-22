package com.hobbyfield.app.club.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class ClubCommnetVO {
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
	private int clubNumber;  // 굳이 필요X 나중에 삭제 
	private String clubCommentContent;
	private Date clubCommentDate;
	private String clubSecret;
	private int clubCommentPartNumber;
	private String clubCommentLevel;
	private String profileNickName;
	
}
