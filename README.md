# Spring Final Project - CarrotMarket

## 주제 : 당근마켓 웹 클론코딩(Back-End) 팀 프로젝트 - 중고차 직거래 파트 구현
<details>
  <summary>프로젝트 소개</summary>

  - 국비 교육원 시절 파이널 프로젝트를 진행하며, 팀원들과 협의하여 무엇을 만들어 볼까?<br>
  하고 고민하다가 모두가 FE 보다는 BE쪽에 더 많은 흥미를 느끼고 있어서,<br>
  만들어 보고 싶은 기능들을 토론하여 정리하고 추려 보니<br>
  중고거래 플랫폼으로 유명한 "**당근마켓**" 웹 사이트가 적합 하겠다는<br>
  결론이 나오게 되어 진행하게 되었습니다.<br>

  - 해당 프로젝트는 프론트엔트 부분은 원본 사이트와 유사하게 개발 되었고,<br>
    백엔드 부분을 더 중점적으로 개발하게 된 첫 클론 코딩 팀 프로젝트 입니다.

  - **본 ReadMe 파일은 전체 프로젝트의 일부만 있으며,<br>
    필자 본인이 작업한 파트에 대한 내용만 게시되어 있음을 알려드립니다.**
  
  - **개발기간 : 23.05.15 ~ 23.6.13**

</details>

## Development Environment & Libraly
<details>
  <summary>프로젝트에 적용한 기술 목록</summary>
  
- **BE : Java(jdk15.0.2 version), SpringFramework(5.3.26 version) - Spring Legacy Project, Mybatis, Maven**
- **FE : HTML5, CSS3, JSP(Servlet), J-Query(A-Jax), JavaScript, BootStrap4**
- **DB : Oracle (DB & SQL)**
- **Server(WAS) : Apache Tomcat 9.0**
- **IDE(TOOL) : STS(3.9.18 version), SQLDEVELOPER(Oracle11g)**

</details>

## 설계의 주안점
<details>
  <summary>접기 & 상세보기</summary><br>

  - **당근마켓 웹 사이트에는 로그인/회원가입 기능이 QR코드로 인증받아서 앱과 연동되도록<br>
      처리 되어 있어서 별도로 로그인/회원가입 기능을 추가하였습니다.**
  - 프론트단 디자인은 벤치마킹한 원본 사이트와 최대한 비슷하게 구현 하였습니다.
  - 백엔드 부분을 중점적으로 개발 하였습니다.
</details>

## 중고차 직거래 파트 구현 기능
<details>
  <summary>접기 & 상세보기</summary><br>
  
- **로그인/회원가입**
- **게시판 (C, R, U, D) 기능 구현 (쇼핑몰 이미지 리스트 형식)**
- **파일 업로드 & 다운로드 기능 구현, 업로드 이미지 썸네일 형식으로 출력 (구현)**
- **페이징 처리**
- **카카오맵 api 연동**

</details>

## CarrotMarket - 중고차 직거래 테이블 구조
<details>
<summary>테이블명 : Carrot_Car 구조</summary><br><br>
  
![carrot_car - DB 테이블 구조](https://github.com/itrecipe/carrotmarket_project/assets/40875025/5174a4fc-688b-47e5-b287-f3bcd23016b3)
</details>

## CarrotMarket - 중고차 직거래 구현 코드

### Domain
<details>
  <summary>CarVO</summary>

  ```java
  package org.ezen.ex02.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

//bean class(DTO, VO) -> getter/setter, toString, equals 자동생성
@Data
public class CarVO {

	//로그인시 carrot_member 테이블의 ID 정보를 받아올 PK
	private int id; //pk

	//차량 게시글 정보
	private Long cno; //게시글 번호
	private String title; //게시글 제목
	private String writer; //게시글 작성자
	private String content; //게시글 내용
	private Date regDate; //게시글 등록 날짜
	private Date updateDate; //게시글 수정일
	
	private int replyCnt; //댓글 조회수 
	
	//게시판에서 특정 게시글에 첨부되는 첨부파일 리스트(여러개의 첨부 파일을 가져올수 있도록 List로 등록 한다.)
	private List<CarAttachVO> attachList; 
	
	//차량 정보
	private String carName; //차량명
	private String carType; //차종
	private String carYear; //차량 연식
	private String carPrice; //차량의 금액
	private String carDate; //차량 등록일
	private String fuel; //연료
	private String disp; //배기량
	private String Kilos; //키로수
	private String mission; //변속기(종류, 타입)
}
  ```
</details>

<details>
  <summary>CarPageDTO</summary>

  ```java
  package org.ezen.ex02.domain;

import lombok.Getter;
import lombok.ToString;

@Getter //getter 메서드 자동 생성 어노테이션
@ToString //toString을 자동으로 생성해주는 어노테이션
//페이징 관련 DTO
public class CarPageDTO {

	private int startPage; //표시할 페이지 번호중 가장 적은 번호
	private int endPage; //표시할 페이지 번호중 가장 큰 번호
	private boolean prev, next; 
	//prev는 이전 페이지로 이동이 가능한지 여부를 나타내는 boolean값
	//next는 다음 페이지로 이동이 가능한지 여부를 나타내는 boolean값
	
	private int total; //데이터 전체 개수
	private CarCriteria cri; //pageNum, amount

	public CarPageDTO(CarCriteria cri, int total) {
		
		this.cri = cri;
		
		this.total  = total;
		
		//페이징 끝 번호 계산
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		//ceil은 .0인 윗수로 올림을 한다.

		//페이징 시작 번호 계산
		this.startPage = this.endPage - 9;
		
		//total을 이용해 endPage를 재계산 처리하기
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전 페이지 처리
		this.prev = this.startPage > 1;
		
		//다음 페이지 처리
		this.next = this.endPage < realEnd;
	}
}
  ```
  
</details>

<details>
  <summary>CarCriteria</summary>
  
  ```java
  package org.ezen.ex02.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//페이징, 검색 관련 클래스
public class CarCriteria {

	//페이징 처리
	private int pageNum; //페이지 번호
	private int amount; //페이지당 레코드의 갯수
	
	//페이징 처리
	public CarCriteria() {
		this(1, 12);
	}
	
	//페이징 처리
	public CarCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
  ``` 
</details>

<details>
  <summary>CarAttachVO</summary>

  ```java
package org.ezen.ex02.domain;

import lombok.Data;

@Data
//carrot_attach 테이블과 매핑하는 VO 클래스
public class CarAttachVO {
	
	private String uuid;
	private String uploadPath; // YYYY/MM/DD형식
	private String fileName;
	private boolean fileType; //image는 true 아닌것은 false

	private Long cno; //carrot_car의 cno 값을 매핑하기 위한 변수
}

  ```
</details>

<details>
  <summary>CarAttachFileDTO</summary>

  ```java
  package org.ezen.ex02.domain;

import lombok.Data;

@Data
public class CarAttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
}

  ```
</details>

### Mapper
<details>
  <summary>Mapper</summary>
</details>

### Service
<details>
  <summary>Service</summary>
</details>

### Controller
<details>
  <summary>CarController</summary>

  ```java

  package org.ezen.ex02.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.ezen.ex02.domain.CarAttachVO;
import org.ezen.ex02.domain.CarCriteria;
import org.ezen.ex02.domain.CarPageDTO;
import org.ezen.ex02.domain.CarVO;
import org.ezen.ex02.service.CarService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //컨트롤러 클래스로서 스프링 빈으로 등록한다.
@Log4j //log를 출력하기 위해 사용
@RequestMapping("/car") //받은 요청을 해당 메서드로 연결하며 클래스로 지정할시에는 공통 경로가 된다.
@AllArgsConstructor //lombok의 모든 멤버변수를 파라미터로 갖는 생성자를 생성해준다, 멤버변수가 하나일때 사용한다.
public class CarController {
	private CarService service; //CarService 인터페이스를 구현한 구현체를 주입받는 멤버 변수
	
	//페이징 처리 후 - list(R)
	@GetMapping("/list_car")
	public void list(CarCriteria cri, Model model) {
		log.info("list_car");
		log.info(cri);
		log.info(service.getList(cri));
		model.addAttribute("list_car", service.getList(cri));
		
		//실제 게시글의 개수
		int total = service.getTotal(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new CarPageDTO(cri, total));
	}
	
	//게시글 등록창 보기
	@GetMapping("/register_car")
	public void registerForm() {
		log.info("registerForm : ");
	}
	
	//게시글 등록 처리 - 첨부파일 처리 후
	@PostMapping("/register_car")
	public String register(CarVO car, RedirectAttributes rttr) {
			
		log.info("register : " + car);
		
		if(car.getAttachList() != null) {
			car.getAttachList().forEach(attach -> log.info(attach));
		}
			
		service.register(car);
			
		rttr.addFlashAttribute("result", car.getCno());
			
		return "redirect:list_car";
		}
	
	@GetMapping({"/get_car", "/modify_car"})
	public void get(@RequestParam("cno") Long cno, @ModelAttribute("cri") CarCriteria cri, Model model) {
		log.info("get_car & modify");
		
		model.addAttribute("car", service.get(cno));
	}
	
	// 첨부파일, 페이징 처리 후
	@PostMapping("/modify_car")
	public String modify(CarVO car, CarCriteria cri, RedirectAttributes rttr) {
		
		log.info("modify_car" + car);
		
		if(service.modify(car)) {
			
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:list_car";
	}
	
	// 페이징, 첨부파일 처리 후
	@PostMapping("/remove_car")
	public String remove(@RequestParam("cno") Long cno, CarCriteria cri, RedirectAttributes rttr ) {
		
		log.info("remove_car : " + cno);
		
		List<CarAttachVO> attachList = service.getAttachList(cno);
		
		if(service.remove(cno)) {
			
			//폴더에 있는 파일들을 삭제 한다.
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addFlashAttribute("pageNum" + cri.getPageNum());
		rttr.addFlashAttribute("amount" + cri.getAmount());
		
		return "redirect:list_car";
	}
	
	//클라이언트에서 특정 게시물에 대한 첨부파일 정보를 요청하는 메서드
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<CarAttachVO>> getAttachList(Long cno) {
		log.info("getAttachList : " + cno);
		log.info(service.getAttachList(cno));
		return new ResponseEntity<>(service.getAttachList(cno), HttpStatus.OK);
	}

	@GetMapping(value = "/display/{cno}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<byte[]> getImage(@PathVariable("cno") Long cno) {
		
		CarAttachVO attach = service.getImage(cno);
		
		// 실제 이미지 데이터를 바이트 배열로 보냄(외부 경로에 있는 파일에는 직접 접근이 불가능해서 바이트 배열로 데이터를 보냄)
		// fileName은 전체 경로 보냄(YYYY/MM/DD/S_UUID/이름
		log.info("fileName: " + attach);

		File file = new File("c:/upload/" + attach.getUploadPath() + "\\s_" + attach.getUuid()+"_" + attach.getFileName());
		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			// header에 Content-Type에 MIME추가

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			// file객체를 byte배열로 변환하여 JSON으로 반환

		} catch (IOException e) {

			e.printStackTrace();
		}
		return result;
	}
	
	/*
	이 코드는 /display/{cno} 경로로 GET 요청이 들어왔을 때 이미지 파일을 서버에서 읽어와 클라이언트에게 전송하는 기능을 구현한 핸들러 메서드입니다.
	
	@GetMapping 어노테이션은 /display/{cno} 경로에 대한 GET 요청을 처리합니다.
	
	@PathVariable("cno") 어노테이션을 사용하여 경로 변수 cno를 매개변수 Long cno에 바인딩합니다.
	service.getImage(cno)를 호출하여 cno 값에 해당하는 이미지 파일 정보를 가져옵니다.
	이미지 파일의 실제 경로를 생성하기 위해 attach 객체의 정보를 사용합니다.
	
	File 객체를 생성하여 이미지 파일에 대한 전체 경로를 지정합니다.
	HttpHeaders 객체를 생성하여 Content-Type 헤더를 설정합니다. 
	Files.probeContentType() 메서드를 사용하여 파일의 MIME 타입을 확인하고,
	이를 Content-Type 헤더에 추가합니다.
	
	FileCopyUtils.copyToByteArray() 메서드를 사용하여 이미지 파일을 바이트 배열로 읽어옵니다.
	ResponseEntity 객체를 생성하여 바이트 배열과 헤더를 설정하고, 상태 코드는 HttpStatus.OK로 설정합니다.
	생성된 ResponseEntity 객체를 반환하여 클라이언트에게 이미지 파일 데이터를 전송합니다.
	이 코드는 클라이언트에서 /display/{cno} 경로로 GET 요청을 보내면,
	해당 cno 값을 사용하여 서버에 저장된 이미지 파일을 읽어와서 클라이언트에게 전송합니다.
	클라이언트는 응답을 받아 이미지 파일 데이터를 화면에 표시할 수 있습니다.
	*/
	
	//첨부파일을 삭제하는 메서드
	private void deleteFiles(List<CarAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;		
		}
		log.info("delete attach files...");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"c:/upload/" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("c:/uplaod/" + attach.getUploadPath() + "/s_" + attach.getUuid() + "_"
							+ attach.getFileName());
					
					Files.delete(thumbNail);
				}
			
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}

  ```
</details>


### View

<details>
  <summary>View</summary>
</details>


## CarrotMarket - 중고차 직거래 실행 화면
<details>
  <summary>접기 & 상세보기</summary><br><br>
  
  <summary>메인</summary><br>

  - CarrotMarket 메인 화면 입니다.
  
  ![carrotmarket_메인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/0459cb81-e3bb-44f4-81bc-2209f6e12ddc)

  <summary>로그인</summary><br>

  ![carrotmarket_로그인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/8915a1f1-ae69-45a8-8c2a-f48b08a2c27e)

  <summary>회원가입</summary><br>
  
  ![carrotmarket_회원가입](https://github.com/itrecipe/carrotmarket_project/assets/40875025/6409ab06-9c6e-4c82-a8ef-abff16012c26)

  <summary>중고차 직거래_메인</summary><br>
  - 메인 화면 상단은 BS4의 케러셀을 이용하였으며, 상품이 노출될 아래 페이지에는 이미지 리스트 형식으로 구현하였습니다.<br>
  - 케러셀 기능 하단에 "게시글 등록" 창으로 이동하여 매물 등록을 할 수 있도록 구현 하였습니다.<br><br>
  
  ![carrotmarket_중고차직거래_메인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/b3a0177b-b698-461f-abd3-e2a2cfae7114)

  <summary>중고차 직거래_게시글 등록 & 파일 업로드</summary><br>
  - 게시글 등록을 할 수 있는 페이지이며, 파일(사진) 업로드와 함께 수행 할 수 있도록 구현 되었습니다.<br><br>

  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/90b9a6be-1d6f-4858-bc18-3eb2a192e69d)

  <summary>중고차 직거래_상세보기(1)</summary><br>
  - 게시글 상세보기 페이지 입니다.<br>
  - 차량 등록에 필요한 정보들을 모두 입력하도록 구현 되었습니다.<br>
  - 아래쪽에 현재 매물의 위치를 알 수 있도록 카카오맵 api를 사용하여 구현 하였습니다.<br>
  - 댓글 기능이 구현 되어 있으나, 현재 미완성 입니다. (현재 작업 중)<br><br>
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/67d84119-9246-4d6f-b327-abf305f63231)
  
  <summary>중고차 직거래_상세보기(2)</summary><br>
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/6da0c9ce-45bb-416a-a7a5-6b5446fc0e05)
  
  <summary>중고차 직거래_상세보기(3)</summary><br>
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/ed88f0c5-8859-4eff-bf58-74b2d3f9b5e0)

  
  <summary>중고차 직거래_수정</summary><br>
  - 수정 버튼을 누르면 alert창이 뜨며 확인을 누를시 수정 페이지로 이동하게 되고,<br>
    취소를 누르면 종료가 되도록 구현하였습니다.<br><br>

  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/be801a1b-b0f6-4c2e-abc7-3e8ea0d5e484)
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/0ace3eda-8c50-453b-92fb-db0e30200cf5)
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/b30eb2ac-ec6f-45eb-904d-f5d3042f9904)
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/f2d234e4-ab08-47a0-8a3a-081d4b9c139c)

  <summary>중고차 직거래_삭제</summary><br>
  - 삭제 버튼도 수정 버튼과 동일하게 누르면 alert창이 뜨면서 삭제 처리가 수행되고,<br>
    취소를 누르면 해당 작업이 종료 되도록 구현 되어 있습니다.<br><br>
  
  
  ![image](https://github.com/itrecipe/carrotmarket_project/assets/40875025/d6e6eb03-5d32-49ab-aaf2-4758b28f7870)

</details>
