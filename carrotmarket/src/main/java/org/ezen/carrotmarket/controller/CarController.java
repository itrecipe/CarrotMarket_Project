package org.ezen.carrotmarket.controller;

import org.ezen.carrotmarket.domain.CarVO;
import org.ezen.carrotmarket.service.CarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller //컨트롤러 클래스로서 스프링 빈으로 등록한다.
@Log4j //log를 출력하기 위해 사용
@RequestMapping("/car") //받은 요청을 해당 메서드로 연결하며 클래스로 지정할시에는 공통 경로가 된다.
@AllArgsConstructor //lombok의 모든 멤버변수를 파라미터로 갖는 생성자를 생성해준다, 멤버변수가 하나일때 사용한다.
public class CarController {
	private CarService service;
	
	@GetMapping("/list") //보통 보여주는 페이지는 getmapping으로 처리 해준다.
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
		
	}
	
	@PostMapping("/register")
	public String register(CarVO car, RedirectAttributes rttr) {
		
		log.info("register : " + car);
		
		service.register(car);
		
		rttr.addFlashAttribute("result", car.getCno());
		
		return "redirect:list";
	}

}
