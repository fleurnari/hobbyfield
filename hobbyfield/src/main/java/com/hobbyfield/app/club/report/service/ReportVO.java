package com.hobbyfield.app.club.report.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
//	REPORT_NUMBER NOT NULL NUMBER(4)     
//	BOARD_NUMBER  NOT NULL NUMBER(4)     
//	REPORT_INFO   NOT NULL VARCHAR2(500) 
//	REPORT_DATE   NOT NULL DATE          
//	REPORT_NAME   NOT NULL VARCHAR2(50)  
//	REPORTED_NAME NOT NULL VARCHAR2(50)  
//	REPORT_STATUS          VARCHAR2(4)
	private Integer reportNumber;
	private	Integer boardNumber;
	private String reportInfo;
	private Date reportDate;
	private String reportName;
	private	String reportedName;
	private String reportStatus;
	
}
