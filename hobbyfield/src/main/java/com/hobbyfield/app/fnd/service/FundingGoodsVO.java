package com.hobbyfield.app.fnd.service;

import lombok.Data;

@Data
public class FundingGoodsVO {
	//상품번호
	private Integer fndGoodsNumber;
	//펀딩 게시물 번호
	private Integer fndPostNumber;
	//펀딩 상품명
	private String fndGoodsName;
	//펀딩 상품 설명
	private String fndGoodsContent;
	//펀딩 상품 수량
	private Integer fndGoodsAmount;
	//펀딩 상품 가격
	private Integer fndGoodsPrice;
	//펀딩 이미지 파일명
	private String fndGoodsImg;
	//펀딩 이미지 파일경로
	private String fndGoodsImgPath;


}
