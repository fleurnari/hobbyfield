package com.hobbyfield.app.csboard.service1;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class CSBoardVO {
	
	private Integer csNumber; 		//CS게시글번호
	private String csTitle;		//CS게시글제목
	private int prdtNumber;		//상품번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date csDate;		//CS게시글작성일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date csUpdate;		//CS게시글수정일
	private String csContents;	//CS게시글내용
	private String csWriter;	//CS게시글작성자
	private String csSecret;	//CS게시글공개여부
	private int csGroupOrd; 	// 원글(답글포함해서)에 대한 순서
	private int csOriginNumber; // 원글번호
	private int csLv;		// 답글 계층(원글에 대한 답글인지, 답글에 대한 답글인지 구분하기 위함) 
	private String csCate;		//CS게시글카테고리
	private String csImgName;	//CS게시글이미지파일명
	private String csImgPath;	//CS게시글이미지파일저장경로
	
	
	//cs_origin_number = 원글번호, cs_group_ord = 답글순서, cs_lv => 원글에 대한 답글인지, 답글에 대한 답글인지 구분
	
	
	
}
