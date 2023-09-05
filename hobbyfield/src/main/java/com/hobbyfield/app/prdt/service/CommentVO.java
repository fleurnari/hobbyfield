package com.hobbyfield.app.prdt.service;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
		private int commentId;				
	    private int reviewId;
	    private String memberEmail;
	    private String commentContent;
	    private Date commentDate;
	    private int parentCommentId;	//(기본은 null)
}
