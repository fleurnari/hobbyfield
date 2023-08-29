package com.hobbyfield.app.club.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardVoteVO {
//	VOTE_NUMBER      NOT NULL NUMBER(4)     
//	PROFILE_NICKNAME NOT NULL VARCHAR2(50)  
//	CLUB_NUMBER      NOT NULL NUMBER(4)     
//	VOTE_SUBJECT     NOT NULL VARCHAR2(300) 
//	VOTE_DATE        NOT NULL DATE          
//	VOTE_SECRET      NOT NULL VARCHAR2(4)   
//	VOTE_MULTI       NOT NULL VARCHAR2(4)   
//	VOTE_STDATE      NOT NULL DATE          
//	VOTE_EDDATE      NOT NULL DATE          
//	VOTE_COUNT                NUMBER(3) 
	private Integer voteNumber; 
	private String profileNickName;
	private Integer boardNumber; 
	private String voteSubject;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date voteDate;    
	private String voteSecret;     
	private String voteMulit;   
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date voteStdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date voteEddate;
	private Integer voteCount;  
}
