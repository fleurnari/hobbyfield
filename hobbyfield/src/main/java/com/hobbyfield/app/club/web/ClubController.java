package com.hobbyfield.app.club.web;

import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.club.board.service.ClubBoardService;
import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.comm.service.CommCodeVO;

//0821 이선호 (소모임 관리)
@Controller
public class ClubController {
	//private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@Autowired
	CreateclubService createClubService;
	
	@Autowired
	ClubBoardService clubBoardService;

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
	public String clubInsertForm(Model model) {
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
		return "club/insertClub";
	}

	// 소모임 등록 처리
	@PostMapping("insertClub")
	public String clubInsertProcess(CreateclubVO clubVO) {
		createClubService.insertClubInfo(clubVO);
		return "redirect:clubList";
	}

	// 소모임 등록 - 하위지역 반응 처리
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

		int result = createClubService.nickChk(profileNickname);

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

	// 소모임 수정
	@PostMapping("updateClub")
	@ResponseBody
	public Map<String, String> updateClub(@RequestBody CreateclubVO createclubVO){
		return createClubService.updateClub(createclubVO);
	}
	
	// 소모임 삭제?

	/* 마이페이지 개인정보 : 프로필 이미지 등록, 개인정보 조회 */
	
	
	// 프로필 추후 이동 ==
	// 프로필 이미지 등록
	@GetMapping("/profileImg")
	public String img(Model model) {
		model.addAttribute("profile", createClubService.getNomalMypage());
		return "club/profileImg";
	}

	// 프로필 이미지 등록 과정
	@PostMapping("/profileImg")
	public String ImgProcess(CreateclubVO clubVO) {
		createClubService.insertClubInfo(clubVO);
		return "redirect:clubList";
	}

	// 게시글 ==
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
	public String clubBoardInfo(Model model,CreateclubVO vo) {
		
		/*
		 * clubBoardService.getClubBoardInfo(vo); model.addAttribute("board", );
		 */
		
		
		return "club/clubBoardInfo";
	}
	

}