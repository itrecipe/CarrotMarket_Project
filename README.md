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

## CarrotMarket - 중고차 직거래 실행 화면
<details>
  <summary>접기 & 상세보기</summary><br><br>
  
  <summary>메인</summary><br>
  
  ![carrotmarket_메인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/0459cb81-e3bb-44f4-81bc-2209f6e12ddc)

  <summary>로그인</summary><br>

  ![carrotmarket_로그인](https://github.com/itrecipe/carrotmarket_project/assets/40875025/8915a1f1-ae69-45a8-8c2a-f48b08a2c27e)

  <summary>회원가입</summary><br>
  
  ![carrotmarket_회원가입](https://github.com/itrecipe/carrotmarket_project/assets/40875025/6409ab06-9c6e-4c82-a8ef-abff16012c26)

</details>


