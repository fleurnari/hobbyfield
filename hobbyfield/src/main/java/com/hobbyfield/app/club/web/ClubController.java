package com.hobbyfield.app.club.web;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobbyfield.app.club.board.service.ClubBoardService;
import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.profile.mapper.ClubProfileMapper;
import com.hobbyfield.app.club.profile.service.ClubProfileService;
import com.hobbyfield.app.club.profile.service.ClubProfileVO;
import com.hobbyfield.app.club.service.ClubJoinService;
import com.hobbyfield.app.club.service.ClubJoinVO;
import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.comm.mapper.CommCodeMapper;
import com.hobbyfield.app.comm.service.CommCodeVO;
import com.hobbyfield.app.member.mapper.MemberMapper;
import com.hobbyfield.app.member.service.MemberVO;

import oracle.jdbc.proxy.annotation.Post;

//0828 이선호 (소모임 관리)
@Controller
@RequestMapping("/club/*")
public class ClubController {

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
	
	@Autowired
	MemberMapper membermapper;
  
    @Autowired
	ClubJoinService clubJoinService;

	
	/*========= 소모임 조회관련 =========*/
	// 소모임 전체조회
	@GetMapping("/clubList")
	public String clubList(Model model) {
		model.addAttribute("clubList", createClubService.getCreateClubList());
		model.addAttribute("board", clubBoardService.getAllClubBoardList());
		model.addAttribute("clubCategorie", commCodeMapper.clubTypeList("0C"));
		
		return "club/clubList";
	}
	

	// 소모임 세부조회
	@GetMapping("/clubInfo")
	public String getClubInfo(@RequestParam String profileNickname, ClubJoinVO joinVO , Model model) {
	    CreateclubVO clubVO = new CreateclubVO();
	    clubVO.setProfileNickname(profileNickname);
	    CreateclubVO findVO = createClubService.getClub(clubVO);
	    model.addAttribute("clubInfo", findVO);
	    return "club/clubInfo";
	}
	
	/// 내가 생성한 소모임 조회(진행중-미구현)
//	@ResponseBody
//	@GetMapping("/selectMadeClub")
//	public CreateclubVO selectMadeClub(CreateclubVO clubVO) {
//	    return createClubService.selectMadeClub(clubVO);
//	}
	
	@ResponseBody
	@GetMapping("/selectMadeClub")
	public CreateclubVO selectMadeClub(CreateclubVO clubVO, Model model) {
		CreateclubVO findVO = createClubService.selectMadeClub(clubVO);
		model.addAttribute("clubInfo",findVO);
	    return findVO;
	}
	
	
	// 가입한 소모임 회원 조회(info 또는 clubMain에서 조회) <모임장>
	@GetMapping("/clubManage")
	public String clubConfirmMember(ClubJoinVO clubJoinVO, Model model) {
		List<ClubJoinVO> joinVO = clubJoinService.joinClubMemberInfo(clubJoinVO);
		model.addAttribute("beforeMembers",joinVO);
		return "club/clubManage";
	}
	

	/*========= 소모임 등록관련 =========*/
	// 소모임 등록 페이지
	@GetMapping("/clubInsert")
	public String clubInsertForm(ClubProfileVO clubprofileVO ,Model model, HttpSession session) {
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubprofileVO.setMemberEmail(member.getMemberEmail());
		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		model.addAttribute("getNomalMypage", findVO);
		return "club/clubInsert";
	}

	// 소모임 등록 처리 Process
	@PostMapping("/clubInsert")
	public String clubInsertProcess(CreateclubVO clubVO, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubVO.setMemberEmail(member.getMemberEmail());
		
		ClubJoinVO joinvo = new ClubJoinVO();
		joinvo.setClubNumber(clubVO.getClubNumber());
		clubJoinService.clubJoinInfo(joinvo);		
		
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

	//소모임 수정 form 페이지

//	@GetMapping("clubUpdate")
//	public String updateView(ClubProfileVO clubprofileVO, Model model, HttpSession session) {
//		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
//		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
//		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
//		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
//		MemberVO member = (MemberVO) session.getAttribute("member");
//		clubprofileVO.setMemberEmail(member.getMemberEmail());
//		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
//		model.addAttribute("update", findVO);
//		return "club/clubMadeList";
//	}

	@GetMapping("/clubUpdate")
	public String updateView(ClubProfileVO clubprofileVO, Model model, HttpSession session) {
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubprofileVO.setMemberEmail(member.getMemberEmail());
		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		model.addAttribute("update", findVO);
		
		return "club/clubMadeList";
	}

	
	
	// 소모임 수정 (AJAX 사용하지 X) - clubMadeList modal창
	@PostMapping("/clubUpdate")
	public String clubUpdate(CreateclubVO createclubVO){
		createClubService.updateClub(createclubVO);
		return "redirect:clubList"; 
	}
	
		
	// 소모임 가입하기 Process
	@PostMapping("/clubJoinProcess")
	public String clubJoinProcess(ClubJoinVO joinVO ,Model model) {
		clubJoinService.clubJoinInfo(joinVO);
		return "redirect:clubList"; 
	}
		
	
	
	// 소모임 삭제?
	
	/*========= 마이페이지 : 내가 생성한 소모임 조회 =========*/
	// 내가 생성한 소모임 전체조회
	@GetMapping("/clubMadeList")
	public String clubMyList(CreateclubVO createclubVO ,Model model, HttpSession session) {
		//공통코드 , ClubProfileVO clubprofileVO
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		createclubVO.setMemberEmail(member.getMemberEmail());
		List<CreateclubVO> clubMadeList = createClubService.getMyClubList(createclubVO);
		
		model.addAttribute("clubMadeList", clubMadeList);
		return "club/clubMadeList";
	}
	

	/*========= 마이페이지 개인정보 : 프로필 이미지 등록, 개인정보 조회=========*/

	//프로필 개인정보 조회 : 전체조회(clubProfile)
	@GetMapping("/clubMypage")
	public String selctProfileClub(ClubProfileVO clubprofileVO, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubprofileVO.setMemberEmail(member.getMemberEmail());
		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		model.addAttribute("getNomalMypage", findVO);
		
		return "club/clubMypage";
	}
	
	//프로필 단건조회(clubProfile에 뿌려줌)
	@ResponseBody
	@GetMapping("/selectProfile")
	public ClubProfileVO getProfile(ClubProfileVO clubprofileVO) {
		System.out.println("getProfile method called with nickname: " + clubprofileVO.getProfileNickname());
		
		return clubprofileService.getProfile(clubprofileVO);
	}
	
	//프로필 등록 Form
	@GetMapping("/profileInsert")
	public String profileInsertForm(Model model) {
	    return "club/profileInsert";  // 프로필 입력 폼 페이지의 뷰 이름
	}

	// 프로필 등록 처리
	@PostMapping("/profileInsert")
	public String profileInsertProcess(ClubProfileVO profileVO) {
		clubprofileService.insertProfile(profileVO);
	    
	    return "redirect:profileInsert";
	}
	
	
	//프로필 수정 (이미지 포함)
	@ResponseBody
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST) // @PostMapping("/updateProfile")와 동일함
	public Map<String, String> updateProfile(@RequestBody ClubProfileVO clubProfileVO) {
	    return clubprofileService.updateProfile(clubProfileVO);
	}
	

	/*========= 게시글 =========*/
	
	// 소모임 메인페이지 이동(모든 소모임, 게시글 볼 수 있는 페이지);
	@GetMapping("/clubMainPage")
	public String clubMainPage(Model model) {
		List<CreateclubVO> clubvo =  createClubService.getCreateClubList();
		List<ClubBoardVO> boardvo = clubBoardService.getAllClubBoardList();
		model.addAttribute("club", clubvo);
		model.addAttribute("board", boardvo);
		return "club/clubMainPage";
	}
	
	
	
	@PostMapping("/clubBoardInsert")
	public String insertClubBoard(Model model ,ClubBoardVO vo,CreateclubVO cvo) {
		clubBoardService.insertClubBoard(vo);
		List<ClubBoardVO> clubBoardList = clubBoardService.getSelectClubBoardList(cvo);
		model.addAttribute("boardList", clubBoardList);
		return "club/clubBoardList";
	}
	
	
	// 해당소모임 게시물 보는 페이지
	@GetMapping("/clubBoardList")
	public String clubBoardList(Model model, CreateclubVO vo, HttpServletRequest request) {
		List<ClubBoardVO> clubBoardList = clubBoardService.getSelectClubBoardList(vo);
		model.addAttribute("boardList", clubBoardList);
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		CreateclubVO cvo = createClubService.getClub(vo);
		session.setAttribute("club", cvo);
		ClubProfileVO profile = clubprofileMapper.getSessionProfile(mvo.getMemberEmail(), vo.getClubNumber());
		if( profile != null) {
			session.setAttribute("profile", profile);
		}else {
			session.removeAttribute("profile");
		}
		return "club/clubBoardList";
	}
	
	
	@GetMapping("/clubBoardInfo")
	public String clubBoardInfo(Model model,ClubBoardVO vo) {
		model.addAttribute("board", clubBoardService.getClubBoardInfo(vo));	
		
		return "club/clubBoardInfo";
	}
	
	
	
	@GetMapping("/searchBoard")
	public String searchBoard(Model model, ClubBoardVO vo ,@RequestParam(value = "searchText") String text) {
		List<ClubBoardVO> boardList = clubBoardService.searchClubBoard(vo, text);
		model.addAttribute("boardList", boardList);
		return "club/clubBoardList";
	}
	

}