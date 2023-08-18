package com.hobbyfield.app.club.web;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hobbyfield.app.club.service.CreateclubService;
import com.hobbyfield.app.club.service.CreateclubVO;
import com.hobbyfield.app.comm.mapper.CommCodeMapper;



@Controller
public class ClubController {
   private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
   
   @Autowired
   CreateclubService createClubService;
   
   @Autowired
   CommCodeMapper commCodeMapper;
   
   //소모임 전체조회
   @GetMapping("clubList")
   public String clubList(Model model) {

      model.addAttribute("clubList", createClubService.getCreateClubList());

      return "club/clubList";
   }
   
   //소모임 세부조회
   
   
   //소모임 등록 페이지

   @GetMapping("/insertClub")
   public String clubInsertForm(Model model) {
	  model.addAttribute("E", commCodeMapper.selectCommCodeList("0E")); //지역대그룹 코드
	  model.addAttribute("F", commCodeMapper.selectCommsubList("0F")); //지역소그룹 코드
	  model.addAttribute("C", commCodeMapper.commCategoryList("0C")); //모임카테고리 그룹코드
	  model.addAttribute("D", commCodeMapper.clubTypeList("0D")); //모임분류 그룹코드

      return "club/insertClub";
   }
   
   //소모임 등록 처리

   @PostMapping("/insertClub")
   public String clubInsertProcess(CreateclubVO clubVO) {
	   createClubService.insertClubInfo(clubVO);
      return "redirect:clubList";
   }
   
   //소모임 지역분류 카테고리 처리
	/*
	 * @PostMapping("/subLocation")
	 * 
	 * @ResponseBody public List<SubLocation>
	 * getSubLocation(@RequestParam("majorLocation") String majorLocation){
	 * List<SubLocation> subLocations = service.getsub }
	 */
   
   //닉네임 중복체크
   /* @RequestMapping(value = "nickChk", method = RequestMethod.POST) */
   @ResponseBody
   @PostMapping("/nickChk")
   public String nickChkPOST(String profileNickname) throws Exception{
   
      int result = createClubService.nickChk(profileNickname);

      if(result != 0) {
         
         return "fail";   // 중복 닉네임 존재
         
      } else {
         
         return "success";   // 중복 닉네임 없음
         
      }   
   }
   
   //소모임 이름 중복체크
   @ResponseBody
   @PostMapping("/clubnameChk")
   public String clubnameChkPOST(String clubName) throws Exception {
      
      int result = createClubService.clubnameChk(clubName);

      
      if(result !=0) {
         
         return "fail"; //중복 모임 이름 존재
               
      } else {
         
         return "success";  //중복 모임 이름 없음
      }
   }
   
   //소모임 수정

  
   //소모임 삭제?
   
   
   //프로필 이미지 등록
   @GetMapping("/profileImg")
   public String img() {
      return "club/profileImg";
   }
      
   //프로필 이미지 등록 과정
   @PostMapping("/profileImg")
   public String ImgProcess(CreateclubVO clubVO) {
	   createClubService.insertClubInfo(clubVO);
      return "redirect:clubList";
   }
   
   //프로필이미지 업로드
	@PostMapping(value="/uploadsAjax", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CreateclubVO>> uploadImg(MultipartFile[] profileImg) {
		logger.info("uploadsAjax.....");
		
		for(MultipartFile multipartFile: profileImg) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			// MIME TYPE을 저장할 String 타입의 type 변수를 선언하고 null로 초기화
			String type = null;
			
			try {
			// Files의 probeContetype() 메서드를 호출하여 반환하는 MIME TYPE 데이터를 type 변수에 대입
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				List<CreateclubVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}
		
		
		String uploadFolder = "c:\\upload";
		//날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		//폴더생성
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) { 
			uploadPath.mkdirs(); 
		}
		
		/* 이미지 정보 담는 객체 */
		List<CreateclubVO> list = new ArrayList();
		
		
		for(MultipartFile multipartFile : profileImg) {
			/* 이미지 정보 객체 */
			CreateclubVO vo  = new CreateclubVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();			
			vo.setProfileImg(uploadFileName);
			vo.setProfileImgPath(datePath);

			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				/* 썸네일 생성 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				//비율
				double ratio = 3;
				//넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0,width,height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo); //이미지 정보가 저장된 createClubVO객체를 List의 요소로 추가
		}
		
		ResponseEntity<List<CreateclubVO>> result = new ResponseEntity<List<CreateclubVO>>(list, HttpStatus.OK);
		
		return result; //ResponseEntity 객체를 반환
	}
	

	//프로필 이미지 출력
	@GetMapping("/profileView")
	public ResponseEntity<byte[]> getprofileImg(String fileName){
		logger.info("getprofileImg()....." + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
   
	//프로필 이미지 수정

   public String ImgProcess(ClubVO clubVO) {
      clubService.insertClubInfo(clubVO);
      return "redirect:clubList";
   }
   

   //소모임 게시글 생성 
   @GetMapping("clubBoardInsert")
   public String clubBoardInsertForm() {
      return "club/clubBoardInsert";
   }
   

   // 이미지 테스트
   @GetMapping("TESTIMG")
   public String TestImg() {
      return "club/TESTIMG";
   }

}