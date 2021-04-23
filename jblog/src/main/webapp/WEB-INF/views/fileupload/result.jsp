<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>업로드된 이미지</h1>
	<img src="${ pageContext.request.contextPath }/${ urlImage }">
	
	<p>
		<a href="${ pageContext.request.contextPath }/fileupload/form">다시 업로드</a>
	</p>

</body>
</html>