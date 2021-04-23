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

<title>JBlog</title>

 	<style>
		#bt{
             width: 300px;
             margin: 0 auto;
         }
    </style>

</head>

<body class="text-center">
	<jsp:include page="/WEB-INF/views/includes/header.jsp" />

	<form id="loginform" 
					class="form-signin"
					name="loginform" 
					method="POST" 
					action=" <c:url value="/users/login" /> " >
					
		<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
		
		<label class="sr-only" for="id">아이디</label> 
		<input id="bt" name="id" type="text" class="form-control" placeholder="아이디" required autofocus> 

		<label class="sr-only">패스워드</label> 
		<input id="bt" name="password" type="password" class="form-control" placeholder="비밀번호" required>
		<br/>
		
		<input id="bt" class="btn btn-lg btn-secondary btn-block" type="submit" value="로그인">
	</form>

</body>
</html>