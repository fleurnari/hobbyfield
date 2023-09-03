package com.hobbyfield.app.club.board.service;

import java.util.List;

import com.hobbyfield.app.member.service.MemberVO;

public interface ClubCommentService {
	
	// 댓글 불러오기(사용자가 작성한댓글)
	public List<ClubCommentVO> getUserComment(String memberEmail);
	// 댓글 불러오기(게시물의 댓글) 
	public List<ClubCommentVO> getBoardComment(int boardNumber);
	// 특정 댓글 불러오기
	public ClubCommentVO getComment(ClubCommentVO vo);
	// 댓글 작성
	public int insertComment(ClubCommentVO vo);
	// 댓글 수정 
	public int updateComment(ClubCommentVO vo);
	// 댓글 삭제
	public int deleteComment(ClubCommentVO vo);
	// 댓글 작성 활동 포인트 적립
	public int updateMemberPnt(MemberVO memberVO);

}
