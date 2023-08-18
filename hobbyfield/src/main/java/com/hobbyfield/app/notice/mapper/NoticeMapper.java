package com.hobbyfield.app.notice.mapper;

import java.util.List;

import com.hobbyfield.app.notice.service.NoticeVO;

public interface NoticeMapper {
	
	// 공지사항 전체조회
	List<NoticeVO> selectnoticeAllList();

	// 공지사랑 단건조회
	NoticeVO selectNoticeInfo(NoticeVO noticeVO);

	// 공지사항 등록
	int insertNotice(NoticeVO noticeVO);

	// 공지사항 수정
	int updateNotice(NoticeVO noticeVO);

	// 공지사항 삭제
	int deleteNoticeInfo(int delete);

	// 공지사항 조회수
	int noticeViewCount(NoticeVO noticeVO);

}
