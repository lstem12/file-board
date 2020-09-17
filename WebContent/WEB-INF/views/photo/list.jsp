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
<h1>사진 게시판</h1>
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
		<c:if test="${pbList.pbPhotoPath ==null}"><td></td></c:if>
		<c:if test="${pbList.pbPhotoPath !=null}">
		<td><a href="/resources/${pbList.pbPhotoPath}" target="blank"><img src="/resources/${pbList.pbPhotoPath}" width="50px"></a></td>
		</c:if>
		<td>${pbList.credat}</td>
	</tr>
</c:forEach>
</c:if>
</table>
<a href="/photo/write"><button class="btn btn-primary">글쓰기</button></a>
<div class="container text-center" style="font: bold 1.5em/0.5em 맑은고딕;">
<c:choose>
<c:when test="${page.pageNum > 1}"><a href="/photo/list?page.pageNum=1">처음페이지</a></c:when>
<c:when test="${page.pageNum == 1 }"></c:when>
</c:choose>

<c:choose>
<c:when test="${page.pageNum > 1}"><a href="/photo/list?page.pageNum=${page.pageNum -1}">◀</a></c:when>
<c:when test="${page.pageNum == 1 }"></c:when>
</c:choose>

<c:forEach begin="${page.startBlock }" end="${page.endBlock}" var="idx">
	<c:if test="${page.pageNum == idx}">
		<b>${page.pageNum}</b>
	</c:if>
	<c:if test="${page.pageNum != idx}">
		<a href="/photo/list?page.pageNum=${idx}">[${idx}]</a>
	</c:if>
</c:forEach>

<c:choose>
<c:when test="${page.pageNum == page.totalPageSize}"></c:when>
<c:when test="${page.pageNum != page.totalPageSize}"><a href="/photo/list?page.pageNum=${page.pageNum +1}">▶</a></c:when>
</c:choose>

<c:choose>
<c:when test="${page.pageNum == page.totalPageSize}"></c:when>
<c:when test="${page.pageNum != page.totalPageSize}"><a href="/photo/list?page.pageNum=${page.totalPageSize}">마지막페이지</a></c:when>
</c:choose>
</div>
</body>
</html>