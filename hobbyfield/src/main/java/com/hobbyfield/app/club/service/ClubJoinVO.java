package com.hobbyfield.app.club.service;

import lombok.Data;

@Data
public class ClubJoinVO {
	private int applyNumber;
	private String profileNickname;
	private Integer clubNumber;
	private String applyDate;
	private String applyAnswer1;
	private String applyAnswer2;
	private String applyAnswer3;
	private String applyStatus;
	private String profileImg;
	private String profileImgPath;
	//소모임 회원 테이블(clubMember)
	private int clubMemberNumber;
	private String clubJoinDate;
	
}
