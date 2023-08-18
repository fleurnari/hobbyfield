package com.hobbyfield.app;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.reply.service.ReplyService;
import com.hobbyfield.app.csboard.reply.service.ReplyVO;
import com.hobbyfield.app.csboard.service1.CSBoardVO;
import com.hobbyfield.app.csboard.service1.CSboardService;

@Controller
@RequestMapping("CSboard/")
public class CSController {

	@Autowired
	CSboardService csboardService;
	
	@Autowired 
	ReplyService replyService;
	
	//CS게시글 목록조회
	  @GetMapping("CSboardList") 
	  public String CSboardList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		  model.addAttribute("CSboardList", csboardService.getCSBoardList(scri));
		  PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		  pageMaker.setTotalCount(csboardService.csCount(scri));
		  
		  model.addAttribute("pageMaker", pageMaker); 
		  return "CSboard/CSboardList";
	  }


	// CS게시글 상세보기
	@GetMapping("CSboardInfo")
	public String CSboardInfo(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("CSboardInfo", csboardService.getCSBoardInfo(csboardVO.getCsNumber()));
		model.addAttribute("scri", scri);
		
		return "CSboard/CSboardInfo";
	}

	// CS게시글 등록페이지
	@GetMapping("CSboardInsert")
	public String CSboardInsertForm() {
		return "CSboard/CSboardInsert";
	}
	
	// CS게시글 등록
	@PostMapping("CSboardInsert")
	public String CSboardInsertProcess(CSBoardVO csboardVO) {
		csboardService.insertCSboardInfo(csboardVO);
		return "redirect:CSboardList";
	}

	// CS게시글 수정페이지
	@GetMapping("CSboardUpdate")
	public String CSboardUpdateForm(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("CSboardInfo", csboardService.getCSBoardInfo(csboardVO.getCsNumber()));
		model.addAttribute("scri", scri);
		return "CSboard/CSboardUpdate";
	}
	
	// CS게시글 수정
	@PostMapping("CSboardUpdate")
	public String CSboardUpdate(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) {
		csboardService.UpdateCSBoard(csboardVO);
		
		/* 리다이렉트 후에도 검색유형, 검색어를 유지하기 위한 기능, 보류
		 * rttr.addAttribute("page", scri.getPage()); rttr.addAttribute("perPageNum",
		 * scri.getPerPageNum()); rttr.addAttribute("searchType", scri.getSearchType());
		 * rttr.addAttribute("keyword", scri.getKeyword());
		 */
		
		return "redirect:CSboardList";
		
	}

	// CS게시글 삭제
	@PostMapping("CSboardDelete")
	public String CSboardDelete(CSBoardVO csboardVO) {
		
		csboardService.deleteCSboardInfo(csboardVO.getCsNumber());
		return "redirect:CSboardList";
	}

	
	
	//댓글 작성
	
	// 첨부 파일 업로드
	@PostMapping("uploadAjax")
	@ResponseBody
	public void uploadImg(MultipartFile[] csImgName) {
		String uploadFolder = "C:\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		// 폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : csImgName) {
			
			//파일 명 
			String uploadFileName = multipartFile.getOriginalFilename();			
			
			//uuid 적용 파일명같은 파일명 중복방지
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			

			// 파일 위치, 파일 이름을 합친 File 객체 
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	
	
}
