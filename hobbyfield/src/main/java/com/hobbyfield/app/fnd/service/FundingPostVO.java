package com.hobbyfield.app.fnd.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FundingPostVO {
	private Integer fndPostNumber;
	private String memberEmail;
	private String fndCategory;
	private String fndTitle;
	private String fndContent;
	private Integer fndViews;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date fndWdate;
	private Integer fndTargetAmount;
	private Integer fndCurrentAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private String fndStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private String fndEndDate;
	private String fndMainImg;
	private String fndMainImgPath;
	private String fndStatus;
	private Integer fndApproval;
	private Integer fndTotalAmount;
	private Integer fndParticipants;
	private Integer fndTotalPrice;
	private Integer y;
}
