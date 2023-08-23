package com.hobbyfield.app.csboard.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hobbyfield.app.common.PageMaker;
import com.hobbyfield.app.common.SearchCriteria;
import com.hobbyfield.app.csboard.service1.CSBoardVO;
import com.hobbyfield.app.csboard.service1.CSReplyVO;
import com.hobbyfield.app.csboard.service1.CSboardService;

// 0821 정병권
// 게시판 CRUD, 페이징
@Controller
@RequestMapping("CSboard/")
public class CSController {

	@Autowired
	CSboardService csboardService;
	
	
	@Value("${editor.img.save.url}")
	private String saveUrl;

	@Value("${editor.img.load.url}")
	private String loadUrl;

	@Value("${editor.mode}")
	private String mode;
	
	//CS게시글리스트
	  @GetMapping("CSboardList") 
	  public String CSboardList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		  model.addAttribute("CSboardList", csboardService.getCSBoardList(scri));
		  PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		  pageMaker.setTotalCount(csboardService.csCount(scri));
		  
		  
		  model.addAttribute("pageMaker", pageMaker); 
		  return "CSboard/CSboardList";
	  }
	  

	// CS게시글상세보기
	@GetMapping("CSboardInfo")
	public String CSboardInfo(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("CSboardInfo", csboardService.getCSBoardInfo(csboardVO.getCsNumber()));
		model.addAttribute("scri", scri);
		
		List<CSReplyVO> replyList = csboardService.readReply(csboardVO.getCsNumber());
		model.addAttribute("replyList", replyList);
		return "CSboard/CSboardInfo";
	}
	
	//댓글 작성
	@PostMapping("insertReply")
    @ResponseBody
    public String insertReply(@RequestBody CSReplyVO replyVO) {
        csboardService.insertReply(replyVO); 
        return "redirect:CSboardList";
    }
	
	//댓글 수정
	
	
	
	// CS게시글등록폼
	@GetMapping("CSboardInsert")
	public String CSboardInsertForm() {
		return "CSboard/CSboardInsert";
	}
	
	// CS게시글등록
	@PostMapping("CSboardInsert")
	public String CSboardInsertProcess(CSBoardVO csboardVO) {
		csboardService.insertCSboardInfo(csboardVO);
		return "redirect:CSboardList";
	}

	// CS게시글수정폼
	@GetMapping("CSboardUpdate")
	public String CSboardUpdateForm(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("CSboardInfo", csboardService.getCSBoardInfo(csboardVO.getCsNumber()));
		model.addAttribute("scri", scri);
		return "CSboard/CSboardUpdate";
	}
	
	// CS게시글수정
	@PostMapping("CSboardUpdate")
	public String CSboardUpdate(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) {
		csboardService.UpdateCSBoard(csboardVO);
		
		/* �����̷�Ʈ �Ŀ��� �˻�����, �˻�� �����ϱ� ���� ���, ����
		 * rttr.addAttribute("page", scri.getPage()); rttr.addAttribute("perPageNum",
		 * scri.getPerPageNum()); rttr.addAttribute("searchType", scri.getSearchType());
		 * rttr.addAttribute("keyword", scri.getKeyword());
		 */
		
		return "redirect:CSboardList";
		
	}

	// CS게시글삭제
	@PostMapping("CSboardDelete")
	public String CSboardDelete(CSBoardVO csboardVO) {
		
		csboardService.deleteCSboardInfo(csboardVO.getCsNumber());
		return "redirect:CSboardList";
	}

	
	
	//��� �ۼ�
	
	// ÷�� ���� ���ε�
	@PostMapping("uploadAjax")
	@ResponseBody
	public void uploadImg(MultipartFile[] csImgName) {
		String uploadFolder = "C:\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		// ���� ����
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : csImgName) {
			
			//���� �� 
			String uploadFileName = multipartFile.getOriginalFilename();			
			
			//uuid ���� ���ϸ��� ���ϸ� �ߺ�����
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			

			// ���� ��ġ, ���� �̸��� ��ģ File ��ü 
			File saveFile = new File(uploadPath, uploadFileName);
			
			// ���� ����
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	

	@RequestMapping(value="ajax/upload")
	@ResponseBody
	public Map<String , Object> image(@RequestParam Map<String, Object> map, MultipartHttpServletRequest request) throws Exception{
		Map<String , Object> mv = new HashMap<String , Object>();

		List<MultipartFile> fileList = request.getFiles("upload");

		String imgPath = null;

		for (MultipartFile mf : fileList) {
			if (fileList.get(0).getSize() > 0) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				// log.debug("originFileName==" + originFileName);
				String ext = FilenameUtils.getExtension(originFileName);
				String newInfImgFileName = "img_" + UUID.randomUUID() + "." + ext;

				imgPath = loadUrl + newInfImgFileName;

				File file = new File(saveUrl + newInfImgFileName);

				mf.transferTo(file);

				if(!"local".equals(mode)) {
					Runtime.getRuntime().exec("chmod 666 " + file);
				}

			}

		}

	    mv.put("uploaded", true);
	    mv.put("url", imgPath);
	    return mv;
	}
	
	
	
}
