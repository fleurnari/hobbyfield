package com.hobbyfield.app.club.board.service;

import lombok.Data;

@Data
public class BoardVoteResultVO {
//	VOTE_RESULT_NUMBER NOT NULL NUMBER(2)    
//	PROFILE_NICKNAME   NOT NULL VARCHAR2(50) 
//	VOTE_NUMBER        NOT NULL NUMBER(4)    
//	VOTE_OP_NUMBER     NOT NULL NUMBER(2)    
	private Integer voteResultNumber;
	private String profileNickName;
	private Integer voteNumber;
	private Integer voteOpNumber;
}
