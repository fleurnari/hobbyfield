package com.hobbyfield.app.club.board.service;

import lombok.Data;

@Data
public class BoardVoteOptionVO {
//	VOTE_OP_NUMBER NOT NULL NUMBER(2)     
//	VOTE_NUMBER    NOT NULL NUMBER(4)     
//	VOTE_OP_ITEM   NOT NULL VARCHAR2(100) 
	private Integer voteOpNumber;
	private Integer voteNumber;
	private String voteOpItem;
	
}
