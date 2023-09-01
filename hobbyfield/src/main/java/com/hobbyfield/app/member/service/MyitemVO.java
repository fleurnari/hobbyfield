package com.hobbyfield.app.member.service;

import java.util.Date;

import lombok.Data;

@Data
public class MyitemVO {
	
	private Integer myitemId;
	private Integer pointId;
	private Integer pointOptId;
	private String pointName;
	private String pointItemType;
	private String pointItemTypeNm;
	private Integer pointPrice;
	private Date myitemPurcdt; //구매일자
	private String memberEmail;
	private String pointImgName;
	private String pointImgPath;
	private Integer myitemUseterm;
	


}


//MYITEM_ID
//POINT_ID
//POINT_OPT_ID
//POINT_NAME
//POINT_ITEM_TYPE
//POINT_PRICE
//MYITEM_PURCDT
//MEMBER_EMAIL
//POINT_IMG_NAME
//POINT_IMG_PATH
//MYITEM_USETERM