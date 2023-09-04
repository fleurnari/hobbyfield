package com.hobbyfield.app.notice.mapper;

import java.util.List;

import com.hobbyfield.app.common.Criteria;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.notice.service.NoticeVO;

public interface NoticeMapper {
//	
//	//페이징
//	public int getNoticeCount(SearchCriteria scri);
//	
	// 공지사항 전체조회
	public List<NoticeVO> selectNoticeAllList();
	
	// 공지사랑 단건조회
	public NoticeVO selectNoticeInfo(NoticeVO noticeVO);

	// 공지사항 등록
	public int insertNotice(NoticeVO noticeVO);

	// 공지사항 수정
	public int updateNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	public int deleteNotice(int delete);

	// 공지사항 조회수
	public int updateNoticeView(NoticeVO noticeVO);



}
