package com.hobbyfield.app.club.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ClubBoardVO {
//	BOARD_NUMBER       NOT NULL NUMBER(4)      
//	CLUB_NUMBER        NOT NULL NUMBER(4)      
//	CLUB_BOARD_WRITER  NOT NULL VARCHAR2(50)   
//	CLUB_BOARD_TITLE   NOT NULL VARCHAR2(200)  
//	CLUB_BOARD_CONTENT NOT NULL VARCHAR2(2000) 
//	CLUB_BOARD_WDATE   NOT NULL DATE           
//	CLUB_BOARD_VIEWS            NUMBER(4)      
//	CLUB_BOARD_TYPE    NOT NULL VARCHAR2(4)    
//	SCHEDULE_DATE               DATE           
//	CLUB_BOARD_BLIND            VARCHAR2(4)   
	
	private int boardNumber;
	private Integer clubNumber;
	private String clubBoardWriter;
	private String clubBoardContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date clubBoardWdate;
	private Integer clubBoardViews;
	private String clubBoardType;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date scheduleDate;
	private String clubBoardBlind;
	private String profileImg;
	private String profileImgPath;
	
	private String memberEmail;
	// 페이징을 위한 VO
//	private Integer start;
//	private Integer end;
	
}
