package com.hobbyfield.app.member.service;

import java.util.Date;

import lombok.Data;

@Data
public class MyitemVO {
	
	private Integer pointId;
	private Integer pointOptId;
	private String pointName;
	private String pointItemType;
	private String pointImgPath;
	private String pointImgName;
	private Integer pointPrice;
	private Integer myitemUseterm;
	private Date myitemPurcdt;
	private Integer myitemId;
	private String memberEmail;
}


//POINT_PRICE	NUMBER(5,0)
//POINT_OPT_ID	NUMBER(4,0)
//POINT_NAME	VARCHAR2(100 BYTE)
//POINT_ITEM_TYPE	VARCHAR2(4 BYTE)
//POINT_IMG_PATH	VARCHAR2(100 BYTE)
//POINT_IMG_NAME	VARCHAR2(100 BYTE)
//POINT_ID	NUMBER(4,0)
//MYITEM_USETERM	NUMBER(5,0)
//MYITEM_PURCDT	DATE
//MYITEM_ID	NUMBER(4,0)
//MEMBER_EMAIL	VARCHAR2(50 BYTE)