<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				
				<h4 class="text-center text-success">게시글 수정</h4>
  				
  				<form id="mform" name="mform" action="modify_car" method="post">
  				
  				 	<br/><br/>
				
				 	<div class="form-group">
  				 		<label for="cno">번호 : </label>
  				 		<input type="text" class="form-control" id="cno" name="cno" readonly
  				 			value='<c:out value="${car.cno}"/>' />
  				 	</div>
  				 	
  				 	<div class="form-group">
  				 		<label for="writer">작성자 : </label>
  				 		<input type="text" class="form-control" id="writer" name="writer" readonly
  				 			value='<c:out value="${car.writer}"/>' />
  				 	</div>

  				 	<div class="form-group">
  				 		<label for="title">제목 : </label>
  				 		<input type="text" class="form-control" id="title" name="title" required="required"
  				 			value='<c:out value="${car.title}"/>' />
  				 	</div>
  				 	
  				 	<div class="form-group">
  				 		<label for="content">내용 : </label>
<textarea class="form-control" id="content" name="content" rows="10" required="required"><c:out value="${car.content}"/></textarea>
  				 	</div>

	  				<br/><br/>
	  					 
	  				<div class="form-group">
						<label for="carName">차량명 : </label>
						<input type="text" class="form-control" id="carName" name="carName" 
							required="required" value='<c:out value="${car.carName}"/>' />
					</div>

	  				<div class="form-group">
						<label for="carType">차종 : </label>
						<input type="text" class="form-control" id="carType" name="carType" 
							required="required" value='<c:out value="${car.carType}"/>' />
					</div>
	  				
	  				<div class="form-group">
						<label for="carYear">연식 : </label>
						<input type="text" class="form-control" id="carYear" name="carYear" 
							required="required" value='<c:out value="${car.carType}"/>' />
					</div>
	  				
	  				<div class="form-group">
						<label for="carPrice">금액 : </label>
						<input type="text" class="form-control" id="carPrice" name="carPrice" 
							required="required" value='<c:out value="${car.carPrice}"/>' />
					</div>

	  				<div class="form-group">
						<label for="carDate">차량 등록일 : </label>
						<input type="text" class="form-control" id="carDate" name="carDate" 
							required="required" value='<c:out value="${car.carDate}"/>' />
					</div>

	  				<div class="form-group">
						<label for="fuel">연료 : </label>
						<input type="text" class="form-control" id="fuel" name="fuel" 
							required="required" value='<c:out value="${car.fuel}"/>' />
					</div>
					
	  				<div class="form-group">
						<label for="disp">배기량 : </label>
						<input type="text" class="form-control" id="disp" name="disp" 
							required="required" value='<c:out value="${car.disp}"/>' />
					</div>

	  				<div class="form-group">
						<label for="kilos">키로수 : </label>
						<input type="text" class="form-control" id="kilos" name="kilos" 
							required="required" value='<c:out value="${car.kilos}"/>' />
					</div>

	  				<div class="form-group">
						<label for="mission">변속기 : </label>
						<input type="text" class="form-control" id="mission" name="mission" 
							required="required" value='<c:out value="${car.mission}"/>' />
					</div>
					
					<div class="form-group">
  				 		<label for="regDate">게시글 등록일 : </label>
  				 		<input type="text" class="form-control" id="regDate" name="regDate" readonly
  				 			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${car.regDate}"/>' />
  				 	</div>

  				 	<div class="form-group">
  				 		<label for="updateDate">게시글 수정일 : </label>
  				 		<input type="text" class="form-control" id="updateDate" name="updateDate" readonly
  				 			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${car.updateDate}"/>' />
  				 	</div>
  				
  				</form>
  				
  				<button type="button" data-oper='modify_car' class="btn btn-info">수정</button>&nbsp;&nbsp;
  				<button type="button" data-oper='remove_car' class="btn btn-danger">삭제</button>&nbsp;&nbsp;
  				<button data-oper='list_car' class="btn btn-primary">목록</button>
  				
  				<!-- data-oper 속성은 HTML 요소에 사용자 정의 데이터를 저장하기 위해 사용되는 속성으로, 
  					클라이언트 측 스크립트에서 해당 속성값을 활용하여 작업을 수행하거나 조건을 확인하는 데 활용 한다. 
  				-->
  				
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

<script type="text/javascript">
$(function(){
	let formObj = $("#mform");
	
	$("button").on("click",function(e){
		e.preventDefault(); //이벤트가 일어난 버튼의 기본 동작을 제거
		
		let operation = $(this).data("oper");
		//data(data-의 뒷이름)메서드는 속성이 html5에 새롭게 추가된 data-속성값을 참조하여 값을 반환
		console.log("operation : "  + operation);
		
		if(operation == "remove_car") {
			if(confirm("정말 삭제 하시겠습니까? 삭제시 복구는 불가 합니다.")){
				alert("삭제 성공!");
				
			} else {
				alert("삭제 취소!");
				return false;
			}
			formObj.attr("action", "remove_car");
		}
		
		else if(operation == "list_car") {
			formObj.attr("action", "list_car").attr("method","get");
		}
		formObj.submit();
	});
	
});
</script>

<%@ include file="../include/footer.jspf" %>
</body>
</html>