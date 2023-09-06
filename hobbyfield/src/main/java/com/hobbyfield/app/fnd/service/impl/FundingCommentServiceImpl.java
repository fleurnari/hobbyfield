package com.hobbyfield.app.fnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyfield.app.fnd.mapper.FundingCommentMapper;
import com.hobbyfield.app.fnd.service.FundingCommentService;
import com.hobbyfield.app.fnd.service.FundingCommentVO;

@Service
public class FundingCommentServiceImpl implements FundingCommentService {

	@Autowired
	FundingCommentMapper fundingCommentMapper;
	
	@Override
	public List<FundingCommentVO> getCommentList(int fndPostNumber) {
		
		return fundingCommentMapper.getCommentList(fndPostNumber);
	}

	@Override
	public FundingCommentVO getComment(FundingCommentVO vo) {
		
		return fundingCommentMapper.getComment(vo);
	}

	@Override
	public int insertComment(FundingCommentVO vo) {
	
		return fundingCommentMapper.insertComment(vo);
	}

	@Override
	public int updateComment(FundingCommentVO vo) {
		
		return fundingCommentMapper.updateComment(vo);
	}

	@Override
	public int deleteComment(FundingCommentVO vo) {
		
		return fundingCommentMapper.deleteComment(vo);
	}

}
