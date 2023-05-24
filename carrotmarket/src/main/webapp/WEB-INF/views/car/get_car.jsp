<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9" />

<style>
.card img {
	width : 150px;
	height : 150px;
}
</style>
</head>

<body>
<%@ include file="../include/header.jspf" %>

<div class="container mt-4 mb-4" id="mainContent">
	<div class="row">
	<div class="col-md-2">
		<div class="col-md-10">
			<div id="submain">
				<br/><br/>
				<br/><br/>
				<h4 class="text-center text-success">게시글 내용</h4>
  				<form>
  				 	<div class="form-group">
  				 		<label for="cno">번호 : </label>
  				 		<input type="text" class="form-control" id="cno" name="cno" readonly
  				 			value='<c:out value="${car.cno}"/>' />
  				 	</div>
  				 	<div class="form-group">
  				 		<label for="title">제목 : </label>
  				 		<input type="text" class="form-control" id="title" name="title" readonly
  				 			value='<c:out value="${car.title}"/>' />
  				 	</div>
  				 	<div class="form-group">
  				 		<label for="writer">작성자 : </label>
  				 		<input type="text" class="form-control" id="writer" name="writer" readonly
  				 			value='<c:out value="${car.writer}"/>' />
  				 	</div>
  				 	<div class="form-group">
  				 		<label for="content">내용 : </label>
  				 		<textarea class="form-control" id="content" name="content" rows="10" readonly>
  				 			<c:out value="${car.content}"/>
  				 		</textarea>
  				 	</div>
  				</form>
  				<button type="button" data-oper='modify_car' class="btn btn-info">수정</button>
  				&nbsp;&nbsp;
  				<button data-oper='list_car' class="btn btn-danger">목록</button>
  				
	  				<!-- 버튼 클릭을 처리하기 위해 form추가, 보이지 않게 설정해둠 -->
	  				<form id='operForm' action="modify_car" method="get">
	  					<input type="hidden" id="cno" name="cno"
	  						value='<c:out value="${car.cno}"/>'>
	  				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 게시판 상세보기 - 관련 이벤트 (동적)처리 -->
<script>
//페이지 로드시 실행 코드를 정의해주는 함수, 즉 페이지가 로드되면 아래 코드 블록이 실행됨.
$(document).ready(function(){
	let operForm = $("#operForm"); 
	//operForm이라는 변수를 선언하여 $("#operForm"); 을 선택자로 하여 id가 operForm인 요소를 가져온다
	
	$("button[data-oper='modify_car']").on("click", function(e){
		operForm.attr("action", "modify_car").submit();
	});
	
	$("button[data-oper='list_car']").on("click", function(e){
		operForm.find("#cno").remove();
		//id가 cno인 DOM 객체를 찾아서 제거한다.
		operForm.attr("action", "list_car");
		operForm.submit();
	});
});
</script>

<%@ include file="../include/footer.jspf" %>

<!-- 데이터를 잘 받아오는지 확인용으로 작성해본 테스트 코드 
<table style="margin-top:600px;">
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>내용</th>
  </tr>
  <tr>
    <td><c:out value="${car.cno}"/></td>
    <td><c:out value="${car.title}"/></td>
    <td><c:out value="${car.writer}"/></td>
    <td><c:out value="${car.content}"/></td>
  </tr>
</table>
-->

</body>
</html>