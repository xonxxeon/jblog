<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!-- jQuery -->
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js" /> "></script>

<style>

	.basic-cont{
		margin:10px;
	}
	#basicBt{
		margin: 10px auto;
	}
	.card-text{
		color: black;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/blogHeader.jsp" />
	<jsp:include page="/WEB-INF/views/includes/adminNav.jsp" />
	
	<br>
	<div class="basic-cont">
	<form method="POST" action="${ pageContext.request.contextPath }/upload"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${vo.getId() }" >
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">블로그 제목</span>
		  </div>
		  <input type="text" class="form-control" name="blogTitle" value="${ vo.getBlogTitle() }">
		</div>
		
		
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroupFileAddon01">로고이미지</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" name="multipartFile" class="custom-file-input" id="inputGroupFile01">
		    <label class="custom-file-label" for="inputGroupFile01">이미지 파일을 선택하세요</label>
		  </div>
		</div>
		
		<div class="card" style="width: 18rem;">
		  <img src="${ pageContext.request.contextPath }/upload-images/${ vo.getLogoFile() }" class="card-img-top" alt="...">
		  <div class="card-body">
		    <p class="card-text">현재 등록된 이미지</p>
		  </div>
		</div>
		
		<!-- 반드시 multipart/form-data 로 전송 -->
		<input class="btn btn-secondary" id="basicBt" type="submit" value="기본설정변경">
	</form>
	</div>
	<jsp:include page="/WEB-INF/views/includes/blogFooter.jsp" />
	
</body>
</html>