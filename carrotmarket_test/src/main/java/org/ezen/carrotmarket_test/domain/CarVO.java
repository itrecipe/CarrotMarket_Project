package org.ezen.carrotmarket_test.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CarVO {
	
	//로그인시 ID정보를 받아올 PK
	private int id; //pk
	
	//차량 정보
	private String carName; //차량명
	private String carType; //차량 종류
	private String carKilos; //차량 키로수
	private String carDisp; //차량 배기량
	private String carfuel; //차량 연료
	private String carYear; //차량 연식
	private String carMission; //차량 변속기
	private String carPrice; //차량 금액
	private String carDate; //차량 등록일
	
	//게시글 정보
	private int carNo; //게시글 번호
	private String Title; //게시글 제목
	private String Content;//게시글 내용
	private Date Date; //게시글 등록 날짜
	
	
	//게시글 상세페이지에 들어가야할 내용들
	//제목,내용,가격,날짜,금액,조회수,관심,채팅수,지역,게시글 등록일자,
	
	//가격 정보
	
//	  private
//	  
//	  private String priceInfo; //차량 가격 정보
//	  
//	  
//	  private String info; //차량 정보
//	  
//	  private String insuranceInfo; //보험이력 정보 private String option; //차량 옵션
//	  private String intro; //차량 소개 private String location; //차량 거래 위치
	 
}
