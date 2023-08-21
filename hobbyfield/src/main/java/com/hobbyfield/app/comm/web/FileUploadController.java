package com.hobbyfield.app.comm.web;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
		
	@GetMapping("uploadForm")
	public String uploadAjax() {
		return "club/uploadForm";
	}
	
	@PostMapping("/uploadAjax")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		System.out.println("ajax 파일전송");
		
		String uploadFolder = "C:\\upload\\temp";
		
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("=========");
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename()); 
			System.out.println("파일 사이즈 : " + multipartFile.getSize()); 
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("유일 파일 명 : " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch(Exception e){
				System.out.println(e.getMessage());
			} // catch문 종료
		} // for문 종료 
	}
	
	
	
}
