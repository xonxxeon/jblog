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

<!-- 스크립트 삽입 -->
<script src="<c:url value="/assets/javascript/users.js" /> "></script>

<style>
	.form-control{
		width: 500px;
		height: 500px;
	}
	
	#postBt{
		margin: 15px auto;
	}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/blogHeader.jsp" />
	<jsp:include page="/WEB-INF/views/includes/adminNav.jsp" />
	
	<br>
	<form id="writePost"	class="writePost"
					name="writePost" 
					method="POST" 
					action="<c:url value="/writePost" />" 
					onsubmit="return alertWrite(this)">
		
		<input type="hidden" name="userNo" value="${ authUser.getUserNo() }">
		<input type="hidden" name="id" value="${ authUser.getId() }">
					
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default" >제목</span>
		  <input type="text" name="postTitle" class="form-control" aria-label="Text input with dropdown button" >
		  <div class="input-group-append">
		    <select class="form-control" id="dropSelect" name="cateNo">
		    	<c:forEach items="${ list }" var="vo">
					<option name="cateNo" value="${ vo.cateNo }">${ vo.cateName }</option>
				</c:forEach>
		    </select>
		  </div>
			<div class="input-group mb-3">
			 <span class="input-group-text">내용</span>
			 <textarea class="form-control" aria-label="With textarea" name="postContent" ></textarea>
			</div>
		<input class="btn btn-secondary" id="postBt" type="submit" value="포스트 하기">
		<br>
	</form>
	<jsp:include page="/WEB-INF/views/includes/blogFooter.jsp" />

</body>
</html>