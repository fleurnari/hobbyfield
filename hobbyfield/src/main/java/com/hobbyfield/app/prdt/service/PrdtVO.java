package com.hobbyfield.app.prdt.service;

import java.util.Date;

import lombok.Data;

@Data
public class PrdtVO {

	private int prdtId; 			//상품번호
	private String prdtCate;		//상품카테고리
	private String prdtName;		//상품명
	private String prdtContents;		//상품상세내용
	private Date regDate;			//상품등록날짜
	private Date UpdateDate;		//상품수정날짜
	private int	prdtPrice;			//상품가격
	private int prdtCount;			//상품재고
	private String prdtSoldout;			//상품품절여부
	private String prdtThumPath;		//상품썸네일이미지경로
	private String prdtThum;			//상품썸네일이미지
	private String memberEmail;			//회원아이디
	private String prdtOption;			//상품옵션
	private String prdtDetail;
	
	
	
}
