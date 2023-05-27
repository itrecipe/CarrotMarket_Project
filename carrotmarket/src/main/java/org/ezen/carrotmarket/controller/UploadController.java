package org.ezen.carrotmarket.controller;

import java.io.File;

import org.ezen.carrotmarket.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/upload")
@Log4j
public class UploadController {

	public UploadService service;
	
	@PostMapping("/uploadAjaxAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		// servlet제공 업로드는 MultipartFile클래스 객체로 처리,multiple이므로 배열, 파라메터 이름은 form의 name속성
		// 다를때는 @RequestParam사용

		String uploadFolder = "C:/upload";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename()); // 파일 이름
			log.info("Upload File Size: " + multipartFile.getSize()); // 파일 크기

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			// 경로와 파일이름을 사용하는 File객체 생성

			try {
				multipartFile.transferTo(saveFile); // 해당 경로에 file객체 저장
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	
}
