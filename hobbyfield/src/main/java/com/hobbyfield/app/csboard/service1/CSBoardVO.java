package com.hobbyfield.app.csboard.service1;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class CSBoardVO {
	
	private Integer csNumber; 		//CS�Խñ۹�ȣ
	private String csTitle;		//CS�Խñ�����
	private int prdtNumber;		//��ǰ��ȣ
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date csDate;		//CS�Խñ��ۼ���
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date csUpdate;		//CS�Խñۼ�����
	private String csContents;	//CS�Խñ۳���
	private String csWriter;	//CS�Խñ��ۼ���
	private String csSecret;	//CS�Խñ۰�������
	private int csGroupOrd; 	// ����(��������ؼ�)�� ���� ����
	private int csOriginNumber; // ���۹�ȣ
	private int csLv;		// ��� ����(���ۿ� ���� �������, ��ۿ� ���� ������� �����ϱ� ����) 
	private String csCate;		//CS�Խñ�ī�װ�
	private String csImgName;	//CS�Խñ��̹������ϸ�
	private String csImgPath;	//CS�Խñ��̹�������������
	
	
	//cs_origin_number = ���۹�ȣ, cs_group_ord = ��ۼ���, cs_lv => ���ۿ� ���� �������, ��ۿ� ���� ������� ����
	
	
	
}
