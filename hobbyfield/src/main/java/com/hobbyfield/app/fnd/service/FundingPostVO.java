package com.hobbyfield.app.fnd.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FundingPostVO {
	//펀딩 게시물 번호
	private Integer fndPostNumber;
	//판매자 ID
	private String memberEmail;
	//펀딩 카테고리
	private String fndCategory;
	//펀딩 제목
	private String fndTitle;
	//펀딩 내용
	private String fndContent;
	//펀딩 조회수
	private Integer fndViews;
	//펀딩 프로젝트 등록일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fndWdate;
	//펀딩 목표금액
	private Integer fndTargetAmount;
	//펀딩 현재금액
	private Integer fndCurrentAmount;
	//펀딩 시작일자
	private String fndStartDate;
	//펀딩 종료일자
	private String fndEndDate;
	//메인 파일이미지
	private String fndMainImg;
	//메인 파일이미지 경로
	private String fndMainImgPath;
	//펀딩 진행상황
	private Integer fndStatus;
	//이건뭐였지
	private Integer fndApproval;
	//총 결제 금액
	private Integer fndTotalAmount;
	//참여 인원
	private Integer fndParticipants;
}
