package com.hobbyfield.app.club.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.club.board.service.ClubBoardService;
import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.profile.mapper.ClubProfileMapper;
import com.hobbyfield.app.club.profile.service.ClubProfileService;
import com.hobbyfield.app.club.profile.service.ClubProfileVO;
import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.comm.service.CommCodeVO;
import com.hobbyfield.app.member.service.MemberVO;

//0821 이선호 (소모임 관리)
@Controller
public class ClubController {
	//private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@Autowired
	CreateclubService createClubService;
	
	@Autowired
	ClubBoardService clubBoardService;

	@Autowired
	ClubProfileService clubprofileService;
	
	@Autowired
	ClubProfileMapper clubprofileMapper;
	
	@Autowired
	CommCodeMapper commCodeMapper;
	
	/*========= 소모임 조회관련 =========*/
	// 소모임 전체조회
	@GetMapping("clubList")
	public String clubList(Model model) {
		model.addAttribute("clubList", createClubService.getCreateClubList());
		return "club/clubList";
	}

	// 소모임 세부조회

	/*========= 소모임 등록관련 =========*/
	// 소모임 등록 페이지
	@GetMapping("insertClub")
	public String clubInsertForm(ClubProfileVO clubprofileVO ,Model model, HttpSession session) {
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubprofileVO.setMemberEmail(member.getMemberEmail());
		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		model.addAttribute("getNomalMypage", findVO);
		return "club/insertClub";
	}

	// 소모임 등록 처리 Process
	@PostMapping("insertClub")
	public String clubInsertProcess(CreateclubVO clubVO, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubVO.setMemberEmail(member.getMemberEmail());
		createClubService.insertClubInfo(clubVO);
		return "redirect:clubList";
	}
	

	// 소모임 등록 - 하위지역 반응 처리(공통코드받아서)
	@ResponseBody
	@GetMapping("/selectCommsubList")
	public List<CommCodeVO> getSubLocations(String code) {
		// 상위 카테고리 값에 따라 하위 카테고리 목록을 데이터베이스에서 조회
		List<CommCodeVO> subLocations = commCodeMapper.selectCommsubList(code);
		return subLocations;
	}

	// 닉네임 중복체크
	/* @RequestMapping(value = "nickChk", method = RequestMethod.POST) */
	@ResponseBody
	@PostMapping("/nickChk")
	public String nickChkPOST(String profileNickname) throws Exception {

		int result = clubprofileService.nickChk(profileNickname);

		if (result != 0) {

			return "fail"; // 중복 닉네임 존재

		} else {

			return "success"; // 중복 닉네임 없음

		}
	}

	// 소모임 이름 중복체크
	@ResponseBody
	@PostMapping("/clubnameChk")
	public String clubnameChkPOST(String clubName) throws Exception {

		int result = createClubService.clubnameChk(clubName);

		if (result != 0) {

			return "fail"; // 중복 모임 이름 존재

		} else {

			return "success"; // 중복 모임 이름 없음
		}
	}

	// 소모임 수정 (구현중)
	@PostMapping("updateClub")
	@ResponseBody
	public Map<String, String> updateClub(@RequestBody CreateclubVO createclubVO){
		return createClubService.updateClub(createclubVO);
	}
	
	// 소모임 삭제?


	/*========= 마이페이지 개인정보 : 프로필 이미지 등록, 개인정보 조회=========*/

	//프로필 등록 Form(페이지)
	@GetMapping("insertProfile")
	public String profileInsertForm(Model model) {
	    return "club/insertProfile";  // 프로필 입력 폼 페이지의 뷰 이름
	}

	
	// 프로필 등록 처리
	@PostMapping("insertProfile")
	public String profileInsertProcess(ClubProfileVO profileVO) {
	    // 프로필 정보를 DB에 저장하는 서비스 메서드를 호출합니다.
		clubprofileService.insertProfile(profileVO);
	    
	    // 프로필 정보 저장 후 원하는 페이지로 리다이렉트 
	    return "redirect:insertProfile";
	}
	
	
	//프로필 개인정보 조회(getNomalMypage)
	@GetMapping("/getNomalMypage")
	public String selctProfileClub(ClubProfileVO clubprofileVO, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubprofileVO.setMemberEmail(member.getMemberEmail());
		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		if(findVO == null)
		model.addAttribute("getNomalMypage", findVO);
		
		return "club/getNomalMypage";
	}
	
	//프로필 단건조회(getNomalMypage에 뿌려줌)
	@GetMapping("/selectProfile")
	public String getProfile(ClubProfileVO clubprofileVO, Model model) {
		ClubProfileVO selectedProfile = clubprofileService.getProfile(clubprofileVO);
		model.addAttribute("selectProfile",  selectedProfile);
		return "club/getNomalMypage";
	}
	
	//프로필 수정 (이미지 포함)
	@PostMapping("updateProfile")
	@ResponseBody
	public Map<String, String> updateProcess(@RequestBody ClubProfileVO clubprofileVO){
		return clubprofileService.updateProfile(clubprofileVO);
	}

	// 게시글 ==
	
	// 소모임 메인페이지 이동(모든 소모임, 게시글 볼 수 있는 페이지);
	@GetMapping("clubMainPage")
	public String clubMainPage(Model model) {
		List<CreateclubVO> clubvo =  createClubService.getCreateClubList();
		List<ClubBoardVO> boardvo = clubBoardService.getAllClubBoardList();
		model.addAttribute("club", clubvo);
		model.addAttribute("board", boardvo);
		return "club/clubMainPage";
	}
	
	// 선택 소모임 메인페이지
	@GetMapping("clubSelectMain")
	public String selectClubMain(Model model, CreateclubVO clvo) {
		// clubBoardService.getSelectClubBoardList(clvo);
		
		return "club/"; 
	}
	
	// 소모임 게시글 생성
	@GetMapping("clubBoardInsert")
	public String clubBoardInsertForm() {
		return "club/clubBoardInsert";
	}

	// 이미지 테스트
	@GetMapping("TESTIMG")
	public String TestImg() {
		return "club/TESTIMG";
	}
	
	@GetMapping("uploadForm")
	public String uploadForm() {
		return "club/uploadForm";
	}
	
	
	@PostMapping("clubBoardInsert")
	public String insertClubBoard(ClubBoardVO vo) {
		
		clubBoardService.insertClubBoard(vo);
		
		return "club/clubBoardList";
	}
	
	@GetMapping("clubBoardList")
	public String clubBoardList(Model model) {
		List<ClubBoardVO> clubBoardList = clubBoardService.getAllClubBoardList();
		model.addAttribute("boardList", clubBoardList);
		
		return "club/clubBoardList";
	}
	
	@GetMapping("clubBoardInfo")
	public String clubBoardInfo(Model model,ClubBoardVO vo) {
		model.addAttribute("board", clubBoardService.getClubBoardInfo(vo));	
		return "club/clubBoardInfo";
	}
	

}