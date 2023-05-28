package org.ezen.carrotmarket.controller;

import java.io.File;

import org.ezen.carrotmarket.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/car")
@Log4j
public class UploadController {

	@GetMapping("/uploadForm")
		public void uploadForm() {
			log.info("GetMapping uploadForm Test");
			//car 폴더의 uploadForm.jsp로 이동한다.
		}
	/*
	@PostMapping("/uploadFormAction")
		public void uplodFormPost(MultipartFile[] uploadFile, Model model) {
		//name속성과 파라메터형이 다를시는 @Requestparam에 보내는 속성 이름 사용
		//uploadFile은 name속성값이고 muptiple일시 배열로 처리 한다.

		log.info("PostMapping uploadFormAction");
		
		String uploadFolder = "c:/upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			
		}
		
	 */		
		
	}

