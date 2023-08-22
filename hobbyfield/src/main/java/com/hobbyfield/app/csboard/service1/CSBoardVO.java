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
	private String csSecret;	//CS게시글 공개여부
	private int csGroupOrd; 	// ����(��������ؼ�)�� ���� ����
	private int csOriginNumber; // ���۹�ȣ
	private int csLv;		// ��� ����(���ۿ� ���� �������, ��ۿ� ���� ������� �����ϱ� ����) 
	private String csCate;		//CS게시글카테고리
	private String csImgName;	//CS이미지파일명
	private String csImgPath;	//CS이미지파일저장경로
	
	
	//cs_origin_number = ���۹�ȣ, cs_group_ord = ��ۼ���, cs_lv => ���ۿ� ���� �������, ��ۿ� ���� ������� ����
	
	
	
}
