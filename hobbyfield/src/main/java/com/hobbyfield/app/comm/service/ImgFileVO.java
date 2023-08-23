package com.hobbyfield.app.comm.service;

import lombok.Data;

@Data
public class ImgFileVO {
//	FILE_UUID      NOT NULL VARCHAR2(500) 
//	FILE_PATH               VARCHAR2(500) 
//	FILE_CATEGORIE          VARCHAR2(500) 
//	FILE_NAME               VARCHAR2(500) 
	private String fileUUID;
	private String filePath;
	private String fileCategorie;
	private String fileName;
}
