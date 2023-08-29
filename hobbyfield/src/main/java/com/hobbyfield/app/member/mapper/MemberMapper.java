package com.hobbyfield.app.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.member.service.MemberVO;
import com.hobbyfield.app.prdt.service.PrdtVO;

public interface MemberMapper {
	
	// 회원 가입
	public int insertMember(MemberVO memberVO);
	
	// 이메일 중복 체크
	public int chkMemberEmail(String memberEmail);
	
	// 로그인
	public MemberVO loginMember(MemberVO memberVO);
	
	// 로그인 성공 시 최근 접속일 갱신
	public int updateMemberLtst(MemberVO memberVO);
	
	// 금일 첫 로그인 시 활동포인트 갱신
	public int updateMemberPnt(MemberVO memberVO);
	
	// 회원 정보 수정
	public int updateMember(MemberVO memberVO);
	
	// 비밀번호 체크
	public String chkMemberPwd(String memberEmail);
	
	// 비밀번호 수정
	public void updateMemberPwd(@Param("memberEmail") String memberEmail, @Param("memberPwd") String encodePwd);
	
	// 회원 탈퇴
	public void deleteMember(String memberEmail);
	
	// 마이 페이지 - 가입한 소모임 조회
	public List<CreateclubVO> selectJoinClub(MemberVO memberVO);

	// 마이 페이지 - 기업회원의 판매 중인 상품 조회
	public List<PrdtVO> selectSellList(MemberVO memberVO);
	
	// 비밀번호 찾기 유효성 검사
	public int findPw(@Param("memberEmail") String memberEmail, @Param("memberNm") String memberNm, @Param("memberPwd") String memberPwd) throws Exception;
	
	// 비밀번호 찾기 - 비밀번호 변경 
	public int findPwCheck(MemberVO memberVO) throws Exception; 

}
