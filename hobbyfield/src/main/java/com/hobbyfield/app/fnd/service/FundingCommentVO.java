package com.hobbyfield.app.fnd.service;

import java.util.Date;

import lombok.Data;

@Data
public class FundingCommentVO {
	
	private int fndCommentNumber;
	private int fndPostNumber;
	private Date fndCommentDate;
	private String memberEmail;
	private String fndCommentContent;
	private String fndSecret;


}
