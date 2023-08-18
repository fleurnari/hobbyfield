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
	
	//CS�Խñ� �����ȸ
	  @GetMapping("CSboardList") 
	  public String CSboardList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		  model.addAttribute("CSboardList", csboardService.getCSBoardList(scri));
		  PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		  pageMaker.setTotalCount(csboardService.csCount(scri));
		  
		  model.addAttribute("pageMaker", pageMaker); 
		  return "CSboard/CSboardList";
	  }


	// CS�Խñ� �󼼺���
	@GetMapping("CSboardInfo")
	public String CSboardInfo(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("CSboardInfo", csboardService.getCSBoardInfo(csboardVO.getCsNumber()));
		model.addAttribute("scri", scri);
		
		return "CSboard/CSboardInfo";
	}

	// CS�Խñ� ���������
	@GetMapping("CSboardInsert")
	public String CSboardInsertForm() {
		return "CSboard/CSboardInsert";
	}
	
	// CS�Խñ� ���
	@PostMapping("CSboardInsert")
	public String CSboardInsertProcess(CSBoardVO csboardVO) {
		csboardService.insertCSboardInfo(csboardVO);
		return "redirect:CSboardList";
	}

	// CS�Խñ� ����������
	@GetMapping("CSboardUpdate")
	public String CSboardUpdateForm(CSBoardVO csboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("CSboardInfo", csboardService.getCSBoardInfo(csboardVO.getCsNumber()));
		model.addAttribute("scri", scri);
		return "CSboard/CSboardUpdate";
	}
	
	// CS�Խñ� ����
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

	// CS�Խñ� ����
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
	
	
}
