//package com.hobbyfield.app.club.web;
//
//import java.io.File;
//import java.io.IOException;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.UUID;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestPart;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//
//@Controller
//public class UploadController {
//	
//	@Value("${file.upload.path}")
//	private String uploadPath;
//	
//	// 페이지 
//		@GetMapping("upload")
//		public void getUploadPage() {}
//		
//		// 처리
//		@PostMapping("/uploadsAjax")
//		@ResponseBody
//		public List<String> uploadFile(@RequestPart MultipartFile[] uploadFiles) {
//		    
//			List<String> imageList = new ArrayList<>(); //내부에서 처리된 파일들에 대한 정보 저장 ->db저장
//			
//		    for(MultipartFile uploadFile : uploadFiles){//이미지에 대한 컨텐츠 타입을 확인하는 항목
//		    	
//		    	if(uploadFile.getContentType().startsWith("image") == false){
//		    		System.err.println("this file is not image type");
//		    		return null;
//		        }
//		    	//여기서부터 null까지가 경로 설정하는 구문 
//		    	//사용자가 보내온 정보에대해서 저장하는 코드 / 파일이 정확하게 무엇인지 확인 체크하고 중간 경로가 있다면 제외
//		        String originalName = uploadFile.getOriginalFilename();
//		        String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
//		        
//		        System.out.println("fileName : " + fileName); //오리지널 경로를 가져온다
//		    
//		        //중복되는 파일에대한 처리가 필요하다 -> 그것을 아래의 항목으로 처리 한다는 의미다
//		        //날짜 폴더 생성 
//		        String folderPath = makeFolder();
//		        
//		        //중복되는 값을 제거하기 위해 랜덤이라는 값을 이용한다. //시간(초기준)을 기준으로 유니크한 값을 가져옴
//		        //UUID
//		        String uuid = UUID.randomUUID().toString();
//		        //저장할 파일 이름 중간에 "_"를 이용하여 구분
//		        
//		        String uploadFileName = folderPath +File.separator + uuid + "_" + fileName;
//		        //실제 파일 경로 saveName를 기준으로 자바가 인지하는 경로를 가져온다
//		        
//		        String saveName = uploadPath + File.separator + uploadFileName;
//		        //자바는 String 을 인식 못하니 Path(타입)를 설정
//		        
//		        Path savePath = Paths.get(saveName);
//		        //Paths.get() 메서드는 특정 경로의 파일 정보를 가져옵니다.(경로 정의하기)
//		        System.out.println("path : " + saveName);
//		        
//		        //try catch구문이 돌면 이제 이에대한 후속처리가 진행 된다 ->DB행
//		        try{
//		        	uploadFile.transferTo(savePath);
//		            //uploadFile에 파일을 업로드 하는 메서드 transferTo(file)
//		        } catch (IOException e) {
//		             e.printStackTrace();	             
//		        }
//		        
//		        //DB저장
//		        // - upload fileName
//		        imageList.add(setImagePath(uploadFileName));
//		     }
//		    
//		    return imageList; //경로설정 구문 끝
//		}
//		private String makeFolder() {
//			String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")); //위의 날짜 폴더를 이 코드를 통해 처리 년/월/일
//			// LocalDate를 문자열로 포멧
//			String folderPath = str.replace("/", File.separator); //자바는 윈도우와 달리 '/'를 인식하지 못하기 때문에 이렇게 따로 설정
//			File uploadPathFoler = new File(uploadPath, folderPath); //바로 윗행의 String folderPath를 경로로 붙여버린다.
//			// File newFile= new File(dir,"파일명");
//			if (uploadPathFoler.exists() == false) { // 해당경로가 실존하는지 확인하는 메소드이며 아래는 존재치 않으면 새로 만드는 코드다.
//				uploadPathFoler.mkdirs();
//				// 만약 uploadPathFolder가 존재하지않는다면 makeDirectory하라는 의미입니다.
//				// mkdir(): 디렉토리에 상위 디렉토리가 존재하지 않을경우에는 생성이 불가능한 함수
//				// mkdirs(): 디렉토리의 상위 디렉토리가 존재하지 않을 경우에는 상위 디렉토리까지 모두 생성하는 함수
//			}
//			return folderPath;
//		}
//		
//		private String setImagePath(String uploadFileName) {
//			return uploadFileName.replace(File.separator, "/");
//		}
//		
//}
