package com.hobbyfield.app.comm.mapper;

import java.util.List;

import com.hobbyfield.app.comm.service.ImgFileVO;

public interface ImgFileMapper {
	
	// 등록
	public int insertImgFile(ImgFileVO vo);
	
	// 조회
	public List<ImgFileVO> selectImgFile(ImgFileVO vo);
	
	// 수정 
	public int updateImgFile(ImgFileVO vo);
	// 삭제 
	public int deleteImgFile(ImgFileVO vo);
}
