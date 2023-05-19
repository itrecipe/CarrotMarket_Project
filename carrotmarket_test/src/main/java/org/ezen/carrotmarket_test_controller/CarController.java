package org.ezen.carrotmarket_test_controller;

import java.util.ArrayList;
import java.util.List;

import org.ezen.carrotmarket_test.domain.CarVO;
import org.ezen.carrotmarket_test.service.CarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/car")
@AllArgsConstructor
public class CarController {
	
	private CarService carservice; 
	
	@GetMapping("/list")
	public String ListPage(Model model) {
		
		List<CarVO> carVO = carservice.listAll();
		
	}
	
	
}
