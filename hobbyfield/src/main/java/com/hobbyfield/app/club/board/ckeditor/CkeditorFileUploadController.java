//package com.hobbyfield.app.club.board.ckeditor;
//
////import java.nio.charset.StandardCharsets;
//import java.io.File;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.UUID;
//
//import org.apache.commons.io.FilenameUtils;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.core.io.FileSystemResource;
//import org.springframework.core.io.Resource;
//import org.springframework.http.ContentDisposition;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import com.google.common.net.HttpHeaders;
//
//@Controller
//public class CkeditorFileUploadController {
//	
//	@Value("${editor.img.save.url}")
//	private String saveUrl;
//
//	@Value("${editor.img.load.url}")
//	private String loadUrl;
//
//	@Value("${editor.mode}")
//	private String mode;
//	
//	@RequestMapping(value="ajax/upload")
//	@ResponseBody
//	public Map<String , Object> image(@RequestParam Map<String, Object> map, MultipartHttpServletRequest request) throws Exception{
//		Map<String , Object> mv = new HashMap<String , Object>();
//
//		List<MultipartFile> fileList = request.getFiles("upload");
//
//		String imgPath = null;
//		String imgUUID = null;
//		
//		for (MultipartFile mf : fileList) {
//			if (fileList.get(0).getSize() > 0) {
//				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//				// log.debug("originFileName==" + originFileName);
//				String ext = FilenameUtils.getExtension(originFileName);
//				imgUUID = UUID.randomUUID().toString();
//				// UUID.randomUUID()
//				String newInfImgFileName = "img_" + imgUUID + "." + ext;
//				
//				imgPath = loadUrl + newInfImgFileName;
//
//				File file = new File(saveUrl + newInfImgFileName);
//
//				mf.transferTo(file);
//
//				if(!"local".equals(mode)) {
//					Runtime.getRuntime().exec("chmod 666 " + file);
//				}
//
//			}
//
//		}
//
//	    mv.put("uploaded", true);
//	    mv.put("url", imgPath);
//	    mv.put("UUID", imgUUID);
//	    System.out.print(mv);
//	    return mv;
//	}
//	
//	  @GetMapping(value="/download/img/{filename}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
//	  public ResponseEntity<Resource> downloadImg(@PathVariable String filename) {
//		  System.out.println(filename);
//	    return ResponseEntity.ok()
//	       // .contentType(MediaType.IMAGE_PNG) // (3)
//	        .header(HttpHeaders.CONTENT_DISPOSITION, ContentDisposition.inline() // (4)
//	          //  .filename(filename, StandardCharsets.UTF_8)
//	            .build()
//	            .toString())
//	        .body(new FileSystemResource(saveUrl + filename));
//	  }
//}