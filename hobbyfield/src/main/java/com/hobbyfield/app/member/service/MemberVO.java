package com.hobbyfield.app.member.service;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberEmail;
	private String memberPwd;
	private String memberNm;
	private String memberZip;
	private String memberBaseaddr;
	private String memberDetaaddr;
	private String memberBizno;
	private String memberCntinfo;
	private String memberGrd;
	private Integer memberActpnt;
	private Integer memberRprtcnt;
	private Date memberLtstconn;
	private String memberComaccp;
	private Date memberDeldate;
}
