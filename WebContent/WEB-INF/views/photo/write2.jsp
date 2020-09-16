<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/photo/write2" enctype="multipart/form-data">
제목 : <input type="text" name="pbTitle"><br>
내용 : <textarea name="pbContent"></textarea><br>
이미지 : <input type="file" name="pbFile"><br>
<button>글 올리기</button>
</form>
</body>
</html>