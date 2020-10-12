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
	<h1>사진 게시판</h1>
	<div class="search">
		<form action="/photo/list">
			제목 : <input type="text" name="pbTitle" value="${param.pbTitle}"><br>
			내용 : <input type="text" name="pbContent" value="${param.pbContent}"><br>
			일자 : <input type="date" name="credat1" value="${param.credat1}">
			- <input type="date" name="credat2" value="${param.credat2}"><br>
			<input type="hidden" name="page.pageNum" value="1">
			<button>검색</button>
		</form>
	</div>
	<form method="POST" action="/photo/delete">
		<table class="table table-bordered">
			<tr>
				<th><input type="checkbox" id="allChk"
					onchange="allCheck(this)"></th>
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
					<tr onclick="goView(${pbList.pbNum})">
						<td><input type="checkbox" value="${pbList.pbNum}"
							name="pbNums"></td>
						<td>${pbList.pbNum}</td>
						<td>${pbList.pbTitle}</td>
						<c:if test="${pbList.pbPhotoPath ==null}">
							<td></td>
						</c:if>
						<c:if test="${pbList.pbPhotoPath !=null}">
							<td><a href="/resources/${pbList.pbPhotoPath}"
								target="blank"><img src="/resources/${pbList.pbPhotoPath}"
									width="50px" onmouseover="showImg(this.src)" onmouseout="offImg()"></a></td>
						</c:if>
						<td>${pbList.credat}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<a href="/photo/write"><button type="button"
				class="btn btn-primary">글쓰기</button></a>
		<button class="btn btn-primary">삭제</button>
	</form>
	<div class="container text-center" style="font: bold 1.5em/0.5em 맑은고딕;">
		<c:choose>
			<c:when test="${page.pageNum > 1}">
				<a
					href="/photo/list?page.pageNum=1&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${credat1}&credat2=${credat2}">처음페이지</a>
			</c:when>
			<c:when test="${page.pageNum == 1 }"></c:when>
		</c:choose>

		<c:choose>
			<c:when test="${page.pageNum > 1}">
				<a
					href="/photo/list?page.pageNum=${page.pageNum -1}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${credat1}&credat2=${credat2}">◀</a>
			</c:when>
			<c:when test="${page.pageNum == 1 }"></c:when>
		</c:choose>

		<c:forEach begin="${page.startBlock }" end="${page.endBlock}"
			var="idx">
			<c:if test="${page.pageNum == idx}">
				<b>${page.pageNum}</b>
			</c:if>
			<c:if test="${page.pageNum != idx}">
				<a
					href="/photo/list?page.pageNum=${idx}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${credat1}&credat2=${credat2}">[${idx}]</a>
			</c:if>
		</c:forEach>

		<c:choose>
			<c:when test="${page.pageNum == page.totalPageSize}"></c:when>
			<c:when test="${page.pageNum != page.totalPageSize}">
				<a
					href="/photo/list?page.pageNum=${page.pageNum +1}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${credat1}&credat2=${credat2}">▶</a>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${page.pageNum == page.totalPageSize}"></c:when>
			<c:when test="${page.pageNum != page.totalPageSize}">
				<a
					href="/photo/list?page.pageNum=${page.totalPageSize}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${credat1}&credat2=${credat2}">마지막페이지</a>
			</c:when>
		</c:choose>
	</div>
</body>
<img src="" style="display:none" id="sImg">
<script>
	function showImg(src) {
		document.querySelector('#sImg').src = src;
		document.querySelector('#sImg').style.display = '';
	}
	function offImg() {
		document.querySelector('#sImg').style.display = 'none';
	}
	function allCheck(obj) {
		var chkObjs = document.querySelectorAll('input[name=pbNums]');
		for (var i = 0; i < chkObjs.length; i++) {
			chkObjs[i].checked = obj.checked;
		}
	}
	function goView(pbNum){
		if(event.target.type=='checkbox') return;
		location.href='/photo/view?pbNum=' + pbNum;
	}
</script>
</html>