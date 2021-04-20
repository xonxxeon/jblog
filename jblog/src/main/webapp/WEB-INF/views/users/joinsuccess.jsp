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
		
		<p>회원가입을 축하드립니다 !</p>
		<p>로그인 후 개인블로그 서비스를 이용하실 수 있습니다 !</p>
		<a href="<c:url value="/users/login" /> ">로그인</a>
	
	
</body>
</html>