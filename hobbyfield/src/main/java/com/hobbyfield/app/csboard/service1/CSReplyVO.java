package com.hobbyfield.app.csboard.service1;

import java.util.Date;

import lombok.Data;
@Data
public class CSReplyVO {
	
	private int replyId; 			//댓글번호
	private int csNumber;			//원게시글번호
	private String content;			//댓글내용
	private String replyWriter;		//댓글작성자	
	private Date regDate;			//댓글작성일
}
