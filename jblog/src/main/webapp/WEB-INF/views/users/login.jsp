<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet"
	href="<c:url value="/assets/css/main.css" /> " />
</head>
<body>
	<jsp:include page="/WEB-INF/views/includes/header.jsp" />

	<div id="loginBox">
		<form id="loginform" 
						name="loginform" 
						method="POST" 
						action=" <c:url value="/users/login" /> " >
						
						<label class="block-label" for="id">아이디</label> 
						<input id="id" name="id" type="text" value=""> 
				
						<label class="block-label">패스워드</label> 
						<input name="password" type="password" value="">
				
						<input type="submit" value="로그인">
					</form>
	</div>

	<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</body>
</html>