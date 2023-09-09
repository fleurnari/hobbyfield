package com.hobbyfield.app.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.notice.service.NoticeVO;

public interface NoticeMapper {

	// 공지사항 전체조회
	public List<NoticeVO> selectNoticeAllList(@Param("scri")SearchCriteria scri, @Param("noticeVO")NoticeVO noticeVO);
	
	//공지사항 개수
	public int countNotice(@Param("scri")SearchCriteria scri, @Param("noticeVO")NoticeVO noticeVO);
	
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
	
	// 공지사항 카테고리별 조회
	public List<NoticeVO> selectNoticeCate(String noticeCate);



}
