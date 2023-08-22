package com.hobbyfield.app.comm.service;

import java.util.List;

public interface ImgFileService {
	
	
	// 파일 전체 조회
	public List<ImgFileVO> getImgFileList();
	
	// 파일 삭제
	public int deleteImgfFile(ImgFileVO vo);
	
	// 파일 등록 
	public int insertImgFileList(List<ImgFileVO> vo);
	
	// 파일 수정 => 파일 삭제후 새로운 파일 등록 
	public int updateImgFile(ImgFileVO vo);
}
