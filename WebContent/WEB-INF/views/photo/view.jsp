<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body class="container">
<h1>조회하기</h1>
<form method="POST" action="/photo/update" enctype="multipart/form-data">
<input type="hidden" name="pbNum" value="${pbView.pbNum}">
	<table class="table table-borded">
		<tr>
			<th>번호</th>
			<td>${pbView.pbNum}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" value="${pbView.pbTitle}" name="pbTitle"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="pbContent">${pbView.pbContent}</textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<c:if test="${pbView.pbPhotoPath ==null}">
				<td><input type="file" name="pbFile"></td>
			</c:if>
			<c:if test="${pbView.pbPhotoPath !=null}">
				<td><a href="/resources/${pbList.pbPhotoPath}"
					target="blank"><img src="/resources/${pbView.pbPhotoPath}"
						width="50px" onmouseover="showImg(this.src)" onmouseout="offImg()"></a><input type="file" name="pbFile"></td>
			</c:if>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${pbView.credat}</td>
		</tr>
		<tr>
			<th>작성시간</th>
			<td>${pbView.cretim}</td>
		</tr>
	</table>

<button class="btn btn-primary">수정</button>
<button class="btn btn-primary">삭제</button>
</form>
<div><img src="" style="display:none" id="sImg"></div>
<script>
function showImg(src) {
	document.querySelector('#sImg').src = src;
	document.querySelector('#sImg').style.display = '';
}
function offImg() {
	document.querySelector('#sImg').style.display = 'none';
}
</script>
</body>
</html>