package com.hobbyfield.app.comm.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hobbyfield.app.comm.service.ImgFileService;
import com.hobbyfield.app.comm.service.ImgFileVO;

public class ImgFileServiceImpl implements ImgFileService {
	
	
	@Autowired
	
	
	@Override
	public List<ImgFileVO> uploadServer(ImgFileVO vo) {
		return null;
	}

	
	
	@Override
	public List<ImgFileVO> getImgFileList() {
		return null;
	}

	@Override
	public int deleteImgfFile(ImgFileVO vo) {
		return 0;
	}
	
	@Override
	public int insertImgFileList(List<ImgFileVO> vo) {
		return 0;
	}

	@Override
	public int updateImgFile(ImgFileVO vo) {
		return 0;
	}

	
}
