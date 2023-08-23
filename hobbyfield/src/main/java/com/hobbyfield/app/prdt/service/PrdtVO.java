package com.hobbyfield.app.prdt.service;

import java.util.Date;

import lombok.Data;

@Data
public class PrdtVO {

	private String prdtId; 			//상품번호
	private String prdtName;		//상품명
	private int prdtPrice;			//상품가격
	private int prdtStock;			//상품재고
	private String prdtDist;		//상품구분
	private String prdtInfo;		//상품정보
	private Date prdtRegDate;		//상품등록일
	private Date prdtUpdate;		//상품정보수정일
	
	
	
}
