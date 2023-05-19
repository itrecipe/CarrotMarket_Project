package org.ezen.carrotmarket_test.service;

import java.util.List;

import org.ezen.carrotmarket_test.domain.CarVO;

import lombok.AllArgsConstructor;

public interface CarService {
	
	public List<CarVO> listAll();
}
