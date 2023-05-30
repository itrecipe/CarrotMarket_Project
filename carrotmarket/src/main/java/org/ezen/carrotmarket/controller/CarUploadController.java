package org.ezen.carrotmarket.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.tomcat.util.http.parser.MediaType;
import org.ezen.carrotmarket.domain.CarAttachFileDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/car")
@Log4j
public class CarUploadController {

	@GetMapping("/uploadForm")
		public void uploadForm() {
			log.info("GetMapping uploadForm Test");
			//car 폴더의 uploadForm.jsp로 이동한다.
		}
	
	@PostMapping("/uploadFormAction")
		public void uplodFormPost(MultipartFile[] uploadFile, Model model) {
		//name속성과 파라메터형이 다를시는 @Requestparam에 보내는 속성 이름 사용
		//uploadFile은 name속성값이고 muptiple일시 배열로 처리 한다.

		log.info("PostMapping uploadFormAction");
		
		String uploadFolder = "c:/upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("----------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename()); //원본 파일명
			log.info("Upload File size : " +  multipartFile.getSize()); //파일의 크기
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			//경로와 파일명을 사용하는 File 객체를 생성한다.
			
			try {
				multipartFile.transferTo(saveFile); //해당 경로에 file 객체를 저장한다.
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			}
		}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	//브라우저에서 업로드 된 결과를 보여주기 위해 JSON을 첨부파일 관련 객체인(AttachFileDTO) 보내기
	@PostMapping(value = "/uplaodAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<CarAttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		log.info("update ajax post... 호출");
		
		List<CarAttachFileDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:/upload";
		
		String uploadFolderPath = getFolder();
		
		//날짜별로 되어있는 폴더를 이용한 경로
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
		   uploadPath.mkdirs(); //파일 객체의 경로를 이용해 폴더를 생성 한다.
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("---------------------------------");
			log.info("Upload File Name 호출 : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size 호출 : " + multipartFile.getSize());
			log.info("---------------------------------");
			
			//Car 첨부파일DTO 객체 생성
			CarAttachFileDTO attachDTO = new CarAttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			System.out.println("파일명 : " + uploadFileName);
			
			//순수 파일명
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
			
			log.info("only file name : " + uploadFileName);
			
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			//임의의 UUID 객체 생성
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName); //날짜 형식의 경로, 객체 생성
			
			try {
				multipartFile.transferTo(saveFile); //원본 파일 저장
			
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				//이미지 파일인지 아닌지를 체크
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					//섬네일 이라는 이름의 출력 스트림 객체를 생성 해준다.
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				
					//출력 스트림에 저장되는 섬네일 먼저 읽어와서 크기가 100*100인 섬네일 파일을 생성 해준다.
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				
				list.add(attachDTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	private String getFolder() {
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date); //날짜를 yyyy/MM/dd형식으 문자열로 변환 시켜준다.
		
		return str.replace("-", File.separator); //파일 구분자로 - 문자를 변경한다.
	}
	
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			//Path객체를 이용해서 파일의 content형식을 반환 해준다.
			
			return contentType.startsWith("image");
			//image일때 true를 반환 해준다.
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
}