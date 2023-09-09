package com.hobbyfield.app.club.service;

import lombok.Data;

@Data
public class CreateclubVO {
	private int clubNumber;
	private String clubName;
	private String clubCategory;
	private String profileNickname;
	private String clubType;
	private String clubInfo;
	private String majorLocation;
	private String subLocation;
	private String clubPublic;
	private String singupQuestion1;
	private String singupQuestion2;
	private String singupQuestion3;
	private String clubImg;
	private String clubImgPath;
	private Integer clubTotal;
	private String memberEmail;
	
	private String clubCategoryCd;
	private String clubTypeCd;
	private String majorLocationCd;
	private String subLocationCd;
	
	private String profileImg;
	private String profileImgPath;
	private String clubManager;
	
}
