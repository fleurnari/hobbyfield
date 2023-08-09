package com.hobbyfield.app.fnd.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	private Date fndWdate;
	private Integer fndTargetAmount;
	private Integer fndCurrentAmount;

	private String fndStartDate;
	private String fndEndDate;
	private String fndMainImg;
	private String fndMainImgPath;
	private Integer fndStatus;
	private Integer fndApproval;
	private Integer fndTotalAmount;
	private Integer fndParticipants;
}
