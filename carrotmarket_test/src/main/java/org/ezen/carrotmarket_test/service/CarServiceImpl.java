package org.ezen.carrotmarket_test.service;

import java.util.List;

import org.ezen.carrotmarket_test.domain.CarVO;
import org.ezen.carrotmarket_test.mapper.CarMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CarServiceImpl implements CarService{

	private CarMapper carmapper;
	
	@Override
	public List<CarVO> listAll() {
		
		List<CarVO> list = carmapper.listAll(); 
		
		return list;
	}
	
}
