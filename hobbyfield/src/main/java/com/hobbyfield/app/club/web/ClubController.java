package com.hobbyfield.app.club.web;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.club.board.service.ClubBoardService;
import com.hobbyfield.app.club.board.service.ClubBoardVO;
import com.hobbyfield.app.club.board.service.ClubCommentService;
import com.hobbyfield.app.club.board.service.ClubCommentVO;
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
import com.hobbyfield.app.point.service.EmojiVO;
import com.hobbyfield.app.point.service.PointService;
import com.hobbyfield.app.point.service.PointVO;
import com.hobbyfield.app.pointrecord.service.PointRecordService;
import com.hobbyfield.app.pointrecord.service.PointRecordVO;

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
    

    @Autowired 
    PointService pointService;

    @Autowired
    ClubCommentService clubCommentService;
    
    @Autowired
    PointRecordService prService;


	
    /*========= 소모임 조회관련 =========*/
    // 소모임 전체조회(메인페이지)
 	@GetMapping("clubMain")
 	public String clubMain(Model model) {
 		model.addAttribute("clubList", createClubService.getClubTop());
 		model.addAttribute("board", clubBoardService.getAllClubBoardList());
 		model.addAttribute("clubCategorie", commCodeMapper.clubTypeList("0C"));
 		return "club/clubMain";
 	}
 	
 	// 리스트 무한 스크롤(페이징)
 	@ResponseBody
 	@RequestMapping(value="clubInfiniteScroll", produces="application/json; charset=UTF-8")
 	public ResponseEntity<List<CreateclubVO>> clubInfiniteScroll(@RequestParam("startPage") int startPage, 
 	                                                             @RequestParam("endPage") int endPage) {
 	    HashMap<String, Integer> map = new HashMap<>();
 	    map.put("start", startPage);
 	    map.put("end", endPage);
 	    List<CreateclubVO> scrollList = createClubService.getClubsForInfiniteScroll(map);
 	    return new ResponseEntity<>(scrollList, HttpStatus.OK);
 	}
    
    
    // 소모임 전체조회(조회페이지)
	@GetMapping("clubList")
	public String clubList(Model model) {
	    HashMap<String, Integer> map = new HashMap<>();
 	    map.put("start", 1);
 	    map.put("end", 12);
 	    List<CreateclubVO> scrollList = createClubService.getClubsForInfiniteScroll(map);
 	    
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("clubList", scrollList);
		System.out.println(scrollList);
		return "club/clubList";
	}
	
	//소모임 정렬(조회페이지/지역정렬)
	@ResponseBody
	@GetMapping("getClubsByRegion")
	public List<CreateclubVO> getClubsByRegion(@RequestParam String majorLocation, Model model) {
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
	    List<CreateclubVO> clubs = createClubService.getOrderLocation(majorLocation);
	    return clubs;
	}
	
	//소모임 종류 정렬(조회페이지/종류정렬)
	@ResponseBody
	@GetMapping("getClubsByCate")
	public List<CreateclubVO> getClubsByCategory(@RequestParam String clubCategory, Model model) {
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
	    List<CreateclubVO> Cate = createClubService.getOrderCategory(clubCategory);
	    return Cate;
	}

	
	// 소모임 세부조회
	@GetMapping("clubInfo")
	public String getClubInfo(HttpSession session, @RequestParam Integer clubNumber, Model model) {
		// 소모임 정보 조회
		CreateclubVO clubVO = new CreateclubVO();
		clubVO.setClubNumber(clubNumber);
		CreateclubVO findVO = createClubService.getClub(clubVO);
		
		// 로그인한 유저의 프로필 정보 가져오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		// 로그인한 유저의 이메일을 clubProfileVO에 설정
	    ClubProfileVO clubProfileVO = new ClubProfileVO();
	    clubProfileVO.setMemberEmail(member.getMemberEmail());
	    
	    // 로그인한 유저의 프로필 정보 가져오기
	    List<ClubProfileVO> profileInfo = clubprofileService.getClubProfileVO(clubProfileVO);
		// 모델에 추가
	    model.addAttribute("profile", profileInfo);
		model.addAttribute("clubInfo", findVO);
		System.out.println(profileInfo);
		return "club/clubInfo";
	}

	// 내가 생성한 소모임 조회(데이터불러오기 가능/input태그 들어가지 않음)
	@ResponseBody
	@GetMapping("selectMadeClub")
	public CreateclubVO selectMadeClub(CreateclubVO clubVO) {
		return createClubService.selectMadeClub(clubVO);
	}

	// 가입신청한 소모임 회원 조회(info 또는 clubMain에서 조회) <모임장>
	@GetMapping("clubManage")
	public String clubConfirmMember(ClubJoinVO clubJoinVO, Model model) {
		List<ClubJoinVO> joinVO = clubJoinService.joinClubMemberInfo(clubJoinVO);
		model.addAttribute("beforeMembers", joinVO);
		return "club/clubManage";
	}

	// 가입신청한 회원 승인
	@PostMapping("acceptClubMember")
	public String acceptClubMember(@RequestParam String profileNickname, @RequestParam int clubNumber,
			RedirectAttributes redirectAttrs) {
		ClubJoinVO joinVO = new ClubJoinVO();
		joinVO.setProfileNickname(profileNickname);
		joinVO.setClubNumber(clubNumber);
		boolean result = clubJoinService.acceptMember(joinVO);
		if (result) {
			redirectAttrs.addFlashAttribute("message", "수락되었습니다.");
			return "redirect:/clubManage";
		} else {
			redirectAttrs.addFlashAttribute("error", "오류 발생");
			return "redirect:/clubManage";
		}
	}

	// 가입신청한 회원 거부
	@PostMapping("rejectClubMember")
	public String rejectClubMember(@RequestParam String profileNickname, @RequestParam int clubNumber,
			RedirectAttributes redirectAttrs) {
		boolean result = clubJoinService.rejectMember(profileNickname, clubNumber);
		if (result) {
			redirectAttrs.addFlashAttribute("message", "거절되었습니다.");
			return "redirect:/clubManage";
		} else {
			redirectAttrs.addFlashAttribute("error", "오류 발생");
			return "redirect:/clubManage";
		}
	}
	
	/*========= 소모임 등록관련 =========*/
	// 소모임 등록 페이지
	@GetMapping("clubInsert")
	public String clubInsertForm(ClubProfileVO clubprofileVO ,Model model, HttpSession session) {
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드
		MemberVO member = (MemberVO) session.getAttribute("member");
		//profile목록은 로그인할때 profileList로 담음
		//clubprofileVO.setMemberEmail(member.getMemberEmail());
		//List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		//model.addAttribute("getNomalMypage", findVO);
		return "club/clubInsert";
	}

	// 소모임 등록 처리 Process
	@PostMapping("clubInsert")
	public String clubInsertProcess(CreateclubVO clubVO, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubVO.setMemberEmail(member.getMemberEmail());

		createClubService.insertClubInfo(clubVO);
		return "redirect:clubList";
	}

	// 소모임 등록 - 하위지역 반응 처리(공통코드받아서)
	@ResponseBody
	@GetMapping("selectCommsubList")
	public List<CommCodeVO> getSubLocations(String code) {
		// 상위 카테고리 값에 따라 하위 카테고리 목록을 데이터베이스에서 조회
		List<CommCodeVO> subLocations = commCodeMapper.selectCommsubList(code);
		return subLocations;
	}

	// 닉네임 중복체크
	/* @RequestMapping(value = "nickChk", method = RequestMethod.POST) */
	@ResponseBody
	@PostMapping("nickChk")
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
	@PostMapping("clubnameChk")
	public String clubnameChkPOST(String clubName) throws Exception {

		int result = createClubService.clubnameChk(clubName);

		if (result != 0) {

			return "fail"; // 중복 모임 이름 존재

		} else {

			return "success"; // 중복 모임 이름 없음
		}
	}

	// 소모임 수정 clubMadeList modal창
	@PostMapping("clubUpdate")
	public String clubUpdate(CreateclubVO createclubVO){
		createClubService.updateClub(createclubVO);
		System.out.println(createclubVO);
		return "redirect:clubList";
	}

	// 소모임 가입하기 Process
	@PostMapping("clubJoinProcess")
	public String clubJoinProcess(ClubJoinVO joinVO ,Model model) {
		clubJoinService.clubJoinInfo(joinVO);
		return "redirect:clubList";
	}

	// 소모임 삭제?
	
	/*========= 마이페이지 : 내가 생성한 소모임 조회 =========*/
	// 내가 생성한 소모임 전체조회

	@GetMapping("clubMadeList")
	public String clubMyList(CreateclubVO createclubVO ,Model model, HttpSession session) {
		//공통코드 , ClubProfileVO clubprofileVO
		model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); // 지역대그룹 코드
		model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); // 지역소그룹 코드
		model.addAttribute("C", commCodeMapper.commCategoryList("0C")); // 모임카테고리 그룹코드
		model.addAttribute("D", commCodeMapper.clubTypeList("0D")); // 모임분류 그룹코드

		MemberVO member = (MemberVO) session.getAttribute("member");
		createclubVO.setMemberEmail(member.getMemberEmail());
//			System.out.println(createclubVO); //데이터 확인용
//			System.out.println(clubMadeList);
		List<CreateclubVO> clubMadeList = createClubService.getMyClubList(createclubVO);

//			clubprofileVO.setMemberEmail(member.getMemberEmail());
//			List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
//			model.addAttribute("clubmade", findVO);
		model.addAttribute("clubMadeList", clubMadeList);
		return "club/clubMadeList";
	}
		

	/* ========= 마이페이지 개인정보 : 프로필 이미지 등록, 개인정보 조회========= */

	// 프로필 개인정보 조회 : 전체조회(profileList)
	@GetMapping("profileList")
	public String selctProfileClub(ClubProfileVO clubprofileVO, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		clubprofileVO.setMemberEmail(member.getMemberEmail());
		List<ClubProfileVO> findVO = clubprofileService.getNomalMypage(clubprofileVO);
		model.addAttribute("getNomalMypage", findVO);

		return "club/profileList";
	}

	// 프로필 단건조회(clubProfile에 뿌려줌)
	@ResponseBody
	@GetMapping("selectProfile")
	public ClubProfileVO getProfile(ClubProfileVO clubprofileVO) {
		System.out.println("getProfile method called with nickname: " + clubprofileVO.getProfileNickname());

		return clubprofileService.getProfile(clubprofileVO);
	}

	//프로필 등록 Form
	@GetMapping("profileInsert")
	public String profileInsertForm(Model model) {
		return "club/profileInsert"; // 프로필 입력 폼 페이지의 뷰 이름
	}

	// 프로필 등록 처리
	@PostMapping("profileInsert")
	public String profileInsertProcess(ClubProfileVO profileVO) {
		// 프로필 정보를 DB에 저장하는 서비스 메서드를 호출합니다.
		clubprofileService.insertProfile(profileVO);

		// 프로필 정보 저장 후 원하는 페이지로 리다이렉트
		return "redirect:profileInsert";
	}

	// 프로필 수정 (이미지 포함)
	@ResponseBody
	@RequestMapping(value = "/updateProfile", method = RequestMethod.POST) // @PostMapping("/updateProfile")와 동일함
	public Map<String, String> updateProfile(@RequestBody ClubProfileVO clubProfileVO) {
		return clubprofileService.updateProfile(clubProfileVO);
	}

	// 프로필등록 3개제한
	@RequestMapping(value = "/profileCount", method = RequestMethod.POST)
	@ResponseBody
	public int getProfileCount(@RequestParam String email) {
		return clubprofileMapper.getProfileCountByEmail(email);
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
	public String insertClubBoard(Model model ,ClubBoardVO vo,CreateclubVO cvo, HttpServletRequest request) {
		int result = clubBoardService.insertClubBoard(vo);
		
		
		if (result == 1) {
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			clubBoardService.updateMemberPnt(mvo);
			
			PointRecordVO pointRecord = new PointRecordVO();
			pointRecord.setMemberEmail(mvo.getMemberEmail());
			pointRecord.setPointType("AB2");
			prService.insertPointLog(pointRecord);
		}

		
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
	
	@GetMapping("/searchBoard")
	public String searchBoard(Model model, @RequestParam(value = "searchNum") int num 
			, @RequestParam(value = "searchText") String text) {
		List<ClubBoardVO> boardList = clubBoardService.searchClubBoard(num, text);
		model.addAttribute("boardList", boardList);
		return "club/clubBoardList";
	}
	
	
	
	// 삭제할것
	// 소모임 게시물 상세 보기
	@GetMapping("/clubBoardInfo")
	public String clubBoardInfo(Model model, ClubBoardVO vo, HttpServletRequest request, EmojiVO emojiVO) {
		ClubBoardVO cvo = clubBoardService.getClubBoardInfo(vo);
		model.addAttribute("board", cvo);
		model.addAttribute("commentList", clubCommentService.getBoardComment(vo.getBoardNumber()));
		
		CreateclubVO clubVO = new CreateclubVO();
		clubVO.setClubNumber(cvo.getClubNumber());
		model.addAttribute("club", createClubService.getClub(clubVO));
		
		// 세션 객체 생성후 request의 session값 담기
		HttpSession session = request.getSession();
		// member객체 생성후 session 값을 member 객체에 담기 
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		// 가져온 세션값을 토대로 자신의 프로필을 가져와서 오기
		ClubProfileVO profile = clubprofileMapper.getSessionProfile(mvo.getMemberEmail(), cvo.getClubNumber());

		// 가져온 값을 세션에 담기
		session.setAttribute("profile", profile);
    
		//이모지 이름 가져오기
		List<PointVO> point =  pointService.emojiGroup(mvo.getMemberEmail());
		model.addAttribute("point", point);
		//등록된 사진 첫번째 가져오기
		if(point != null && point.size()>0) {
			model.addAttribute("emojis", pointService.emojis(point.get(0).getPointId()));
		}
		return "club/clubBoardInfo";
	}

	// 이모티콘 이미지
	@GetMapping("clubBoardInfo-sub")
	@ResponseBody
	public List<EmojiVO> clubBoardEmoji(HttpSession session, Model model, EmojiVO emojiVO) {
		//이모티콘 이미지 
		return pointService.emojis(emojiVO.getPointId());
	}

	// 댓글 등록
	@ResponseBody
	@PostMapping("clubCommentInsert")
	public int insertClubComment(ClubCommentVO clubCommentVO, HttpServletRequest request) {
		if (request.getParameter("clubCommentSecret").equals("on")) {
			clubCommentVO.setClubCommentSecret("L1");
		} else {
			clubCommentVO.setClubCommentSecret("L2");
		}
		
		clubCommentVO.setClubCommentPartnumber(0);
		clubCommentVO.setClubCommentLevel("M1");
		
		int result = clubCommentService.insertComment(clubCommentVO);
		
		if (result == 1) {
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			clubCommentService.updateMemberPnt(mvo);
			
			PointRecordVO pointRecord = new PointRecordVO();
			pointRecord.setMemberEmail(mvo.getMemberEmail());
			pointRecord.setPointType("AB3");
			prService.insertPointLog(pointRecord);
		}

		return result;
	}
	
	
	// 댓글 수정 폼
	@GetMapping("clubCommentUpdate")
	public String updateClubCommentForm(Model model, ClubCommentVO clubCommentVO) {
		ClubCommentVO findVO = clubCommentService.getComment(clubCommentVO);
		model.addAttribute("comment", findVO);
		return "clubComment/clubCommentUpdate";
	}
	
	// 댓글 수정 수행
	@ResponseBody
	@PostMapping("clubCommentUpdate")
	public boolean updateClubComment(ClubCommentVO clubCommentVO, HttpServletRequest request) {
		
		if (request.getParameter("clubCommentSecret").equals("on")) {
			clubCommentVO.setClubCommentSecret("L1");
		} else {
			clubCommentVO.setClubCommentSecret("L2");
		}
		
		int result = clubCommentService.updateComment(clubCommentVO);
		
		if (result == 0) {
			return false;
		}
		
		
		return true;
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping("clubCommentDelete")
	public boolean deleteClubComment(ClubCommentVO clubCommentVO) {
		
		int result = clubCommentService.deleteComment(clubCommentVO);
		
		if (result == 0) {
			return false;
		}
		
		return true;
	}

	// 대댓글 작성 폼
	@GetMapping("clubRecommentInsert")
	public String recommentInsertForm(HttpServletRequest request, Model model, ClubCommentVO clubCommentVO) {
		
		ClubCommentVO commentVO = clubCommentService.getComment(clubCommentVO);
		
		model.addAttribute("comment", commentVO);
		
		return "clubComment/clubRecommentInsert";

	}
	
	// 대댓글 작성 수행
	@ResponseBody
	@PostMapping("clubRecommentInsert")
	public int recommentInsert(ClubCommentVO clubCommentVO, HttpServletRequest request) {
		
		if (request.getParameter("clubCommentSecret").equals("on")) {
			clubCommentVO.setClubCommentSecret("L1");
		} else {
			clubCommentVO.setClubCommentSecret("L2");
		}
		
		clubCommentVO.setClubCommentPartnumber(clubCommentVO.getCommentNumber());
		clubCommentVO.setClubCommentLevel("M2");
		
		int result = clubCommentService.insertComment(clubCommentVO);
		
		if (result == 1) {
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO)session.getAttribute("member");
			clubCommentService.updateMemberPnt(mvo);
			
			PointRecordVO pointRecord = new PointRecordVO();
			pointRecord.setMemberEmail(mvo.getMemberEmail());
			pointRecord.setPointType("AB3");
			prService.insertPointLog(pointRecord);
		}

		return result;
		
	
	}
	
	
	
}