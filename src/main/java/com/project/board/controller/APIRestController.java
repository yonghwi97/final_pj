package com.project.board.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.board.service.OCRService;
import com.project.board.service.ChatbotService;


@RestController
public class APIRestController {

	@Autowired
	private ChatbotService chatService;	
	
	
	@Autowired
	private OCRService ocrService;
		

	@RequestMapping("/chatbotCall")
		public String  chatbotCall(@RequestParam("message") String message ) {
			String results = chatService.main(message);
			//System.out.println("2:" + result);
			return results;
		}
		
		
		
		

	
	@RequestMapping("/clovaOCRForm")
	public String clovaOCRForm() {
		System.out.println("clovaOCRForm");
		return "ocrView";
	}
		
		@RequestMapping("/clovaOCR")
		public String  faceRecogCel(@RequestParam("uploadFile") MultipartFile file) {		
			String result = "";
			
			try {
				// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
				String uploadPath = "D:/upload/";
				
				// 2. 원본 파일 이름 알아오기
				String originalFileName = file.getOriginalFilename();
				String filePathName = uploadPath + originalFileName;
				
				// 3. 파일 생성
				File file1 = new File(filePathName);
				
				// 4. 서버로 전송
				file.transferTo(file1);				
				
				// 서비스에 파일 path와 파일명 전달  -> 서비스 메소드에서 변경
				// 서비스에서 반환된 텍스트를 result에 저장
				result = ocrService.clovaOCRService(filePathName);
				//System.out.println(result);
				
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return result;
		}
}
