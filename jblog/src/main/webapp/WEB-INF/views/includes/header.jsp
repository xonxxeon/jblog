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
<title>JBLOG</title>
<style>
	ul, li{
		list-style: none;
	}
	
	#nav{
		margin: 20px;
		text-align: center;
	}
	
	img{
		margin: 20px auto;
	}
	
	
</style>

</head>
	
	<body>
		
		
		<div id="nav">
		
			<img src="${ pageContext.request.contextPath }/upload-images/jblog.png">
				<br/>
			<c:choose>
				<c:when test="${ empty authUser }">   <!-- authUser == null : 로그인 안함 -->
					<a href="<c:url value="/users/login" /> " 
						class="btn btn-outline-secondary" 
						role="button" aria-pressed="true">로그인</a>
					<a href="<c:url value="/users/join" /> "
						class="btn btn-outline-secondary" 
						role="button" aria-pressed="true">회원가입</a>
				</c:when>
				<c:otherwise>	<!-- 로그인 한 상태 -->
					<a href="<c:url value="/users/logout" /> "
						class="btn btn-outline-secondary" 
						role="button" aria-pressed="true">로그아웃</a>
					<a href="<c:url value="${ authUser.getId() }" /> "
						class="btn btn-outline-secondary" 
						role="button" aria-pressed="true">내블로그</a>
				</c:otherwise>
			</c:choose>
			
			<br>
		</div>
	</body>
	

</html>