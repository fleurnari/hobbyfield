package com.hobbyfield.app.fnd.service;

import java.util.List;

public interface FundingCommentService {
	
	// 댓글 전체 조회
	public List<FundingCommentVO> getCommentList(int fndPostNumber);

	// 특정 댓글 셀렉트
	public FundingCommentVO getComment(FundingCommentVO vo);

	// 댓글 작성
	public int insertComment(FundingCommentVO vo);
	
	// 댓글 수정
	public int updateComment(FundingCommentVO vo);
	
	// 댓글 삭제
	public int deleteComment(FundingCommentVO vo);

}
