package com.hobbyfield.app.prdt.service;

import java.util.Date;

import lombok.Data;

@Data
public class LikeVO {
	private int likeId;
	private String memberEmail;
	private int prdtId;
	private Date likeDate;
}
