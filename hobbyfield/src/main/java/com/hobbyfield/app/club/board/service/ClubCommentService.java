package com.hobbyfield.app.club.board.service;

import java.util.List;

public interface ClubCommentService {
	
	// 댓글 작성
	public int insertComment(ClubCommentVO vo);
	// 댓글 수정 
	public int updateComment(ClubCommentVO vo);
	// 댓글 삭제
	public int deleteComment(ClubCommentVO vo);
	
	// 댓글 불러오기(사용자가 작성한댓글) -> 내정보 페이지에서 사용
	public List<ClubCommentVO> getUserComment(String email);
	
	// 댓글 불러오기(게시물의 댓글) -> 소모임 페이지에서 사용(게시글번호에 따라옴)
	public List<ClubCommentVO> getBoardComment(ClubCommentVO vo);

}
