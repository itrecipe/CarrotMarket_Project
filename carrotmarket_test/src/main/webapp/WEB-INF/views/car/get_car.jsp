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

<%@ include file="../include/footer.jspf" %>

</body>
</html>