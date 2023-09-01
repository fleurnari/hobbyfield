package com.hobbyfield.app.club.board.mapper;

import java.util.List;
import com.hobbyfield.app.club.board.service.ClubCommentVO;

public interface ClubCommentMapper {
	
	// 댓글 불러오기(사용자가 작성한댓글)
	public List<ClubCommentVO> getUserComment(String email);
	// 댓글 불러오기(게시물의 댓글) 
	public List<ClubCommentVO> getBoardComment(ClubCommentVO vo);
	// 댓글 작성
	public int insertComment(ClubCommentVO vo);
	// 댓글 수정 
	public int updateComment(ClubCommentVO vo);
	// 댓글 삭제
	public int deleteComment(ClubCommentVO vo);
	
}
