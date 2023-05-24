<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="register_car" method="post">
	
	<div class="form-group">
		<label for="writer">작성자 : </label>
		<input type="text" class="form-control" id="writer" name="writer" placeholder="Writer" required="required">
	</div>

	<div class="form-group">
		<label for="title">제목 : </label>
		<input type="text" class="form-control" id="title" name="title" placeholder="Title" required="required">
	</div>

	<div class="form-group">
		<label for="content">내용 : </label>
		<textarea class="form-control" id="content" rows="10" name="content" required="required"></textarea>
	</div>

	<div class="form-group">
		<label for="carName">차량명 : </label>
		<input type="text" class="form-control" id="carName" name="carName" placeholder="carname" required="required">
	</div>

	<div class="form-group">
		<label for="carType">차종 : </label>
		<input type="text" class="form-control" id="carType" name="carType" placeholder="cartype" required="required">
	</div>
	
	<div class="form-group">
		<label for="carYear">연식 : </label>
		<input type="text" class="form-control" id="carYear" name="carYear" placeholder="caryear" required="required">
	</div>

	<div class="form-group">
		<label for="carPrice">금액 : </label>
		<input type="text" class="form-control" id="carPrice" name="carPrice" placeholder="carprice" required="required">
	</div>
	
	<div class="form-group">
		<label for="carDate">등록일 : </label>
		<input type="text" class="form-control" id="carDate" name="carDate" placeholder="cardate" required="required">
	</div>

	<div class="form-group">
		<label for="fuel">연료 : </label>
		<input type="text" class="form-control" id="fuel" name="fuel" placeholder="fuel" required="required">
	</div>

	<div class="form-group">
		<label for="disp">배기량 : </label>
		<input type="text" class="form-control" id="disp" name="disp" placeholder="disp" required="required">
	</div>

	<div class="form-group">
		<label for="kilos">배기량 : </label>
		<input type="text" class="form-control" id="kilos" name="kilos" placeholder="kilos" required="required">
	</div>
	
	<div class="form-group">
		<label for="mission">변속기 : </label>
		<input type="text" class="form-control" id="mission" name="mission" placeholder="mission" required="required">
	</div>

	<button type="submit" class="btn btn-success">작성</button>&nbsp;&nbsp;
	<button type="reset" class="btn btn-danger">취소</button>&nbsp;&nbsp;
	<a id="listLink" href="list_car" class="btn btn-primary">목록보기</a>
</form>

</body>
</html>