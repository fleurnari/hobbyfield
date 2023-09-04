package com.hobbyfield.app.prdt.service;

import java.util.Date;

import lombok.Data;
@Data
public class ReviewVO {

		private int reviewId;		//후기번호
		private Integer prdtId;			//상품번호
		private String category;	//분류(후기,문의)
		private String memberEmail;	//아이디
		private String reviewContent;	//리뷰내용
		private Date reviewDate;		//작성일
		private String reviewTitle;; //후기 제목
		
}
