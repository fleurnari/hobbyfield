package com.hobbyfield.app.prdtcart.service;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {

	private int cartId; 			//장바구니 번호	
	private String memberEmail;		//구매자 아이디
	private int prdtId;				//상품번호
	private int cartStock;			//장바구니에 담은 수량
	private Date addDate;			//장바구니에 담은 날짜
	
	private int num;
	private String prdtName;
	private int prdtPrice;
	private String prdtThum;
	
}
