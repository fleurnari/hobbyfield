package com.hobbyfield.app.comm.mapper;

import java.util.List;

import com.hobbyfield.app.comm.service.CommCodeVO;

public interface CommCodeMapper {
	//지역대분류코드 (수정, 업데이트시 따로 service 추가해주면됨) 
	List<CommCodeVO> selectCommCodeList(String code);
	
	//지역소분류코드
	List<CommCodeVO> selectCommsubList(String code);
	
	//모임카테고리코드
	List<CommCodeVO> commCategoryList(String code);
	
	//모임분류코드
	List<CommCodeVO> clubTypeList(String code);
	
}
