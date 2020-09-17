<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<h2>사진 게시판</h2>
<table class="table table-bordered">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이미지</th>
		<th>생성일</th>
	</tr>
	<c:if test="${empty pbList}">
		<tr>
			<td colspan="4">내용이 없습니다.</td>
		</tr>
	</c:if>
<c:if test="${!empty pbList}">
<c:forEach var="pbList" items="${pbList}">
	<tr>
		<td>${pbList.pbNum}</td>
		<td>${pbList.pbTitle}</td>
		<td><a href="/resources/${pbList.pbPhotoPath}" target="blank"><img src="/resources/${pbList.pbPhotoPath}" width="50px"></a></td>
		<td>${pbList.credat}</td>
	</tr>
</c:forEach>
</c:if>
</table>
<a href="/photo/list?page.pageNum=${page.pageNum -1}">◀</a>
<c:forEach begin="${page.startBlock }" end="${page.endBlock}" var="idx">
	<a href="/photo/list?page.pageNum=${idx}">[${idx}]</a>
	<c:if test="${page.pageNum == idx}">
		<b>${page.pageNum}</b>
	</c:if>
</c:forEach>
<a href="/photo/list?page.pageNum=${page.pageNum +1}">▶</a>
<a href="/photo/write"><button class="btn btn-primary">글쓰기</button></a>
</body>
</html>