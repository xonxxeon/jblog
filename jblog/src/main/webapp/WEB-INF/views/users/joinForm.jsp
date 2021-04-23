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
<link rel="stylesheet"
	href="<c:url value="/assets/css/main.css" /> " />
	
<!-- jQuery -->
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js" /> "></script>

<!-- 스크립트 삽입 -->
<script src="<c:url value="/assets/javascript/users.js" /> "></script>

<style>

		* {
			margin: 0px;
			padding: 0px;
		}

        form{
            border: 1px solid gray;
            width: 400px;
            height: 410px;
            margin: 10px auto;
        }

        .form-group{
            margin: 5px;
        }

        .btn btn-outline-secondary{
            margin: 3px;
        }
	</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		
		<form
			id="join-form"
			name="registerForm" 
			action="<c:url value="/users/join" /> "
			method="POST" onsubmit="return checkForm(this)"
			>
			
			<input type="hidden" name="a" value="join">
			<input type="hidden" name="check" value="f">
			
			<div class="form-group">
          	<label for="userName">이름</label>
          	<input name="userName" type="text" class="form-control">
        	</div>
		
			<div class="form-group">
            <label for="id">아이디</label>
            <input name="id" type="text" class="form-control">
			<!-- 아이디 체크 버튼 -->
			<input type="button" 
					class="btn btn-outline-secondary"
					value="중복 체크" 
					onclick="checkid(this.form.id, `<c:url value="/users/idcheck" />`) " /><br>
			</div>
			
			<div class="form-group">
          	<label for="password">비밀번호</label>
          	<input name="password" type="password" class="form-control">
       		</div>
			
			
			<div class="form-group form-check">
          	<input type="checkbox" class="form-check-input" id="agree" name="agree">
         	<label class="form-check-label">서비스 약관에 동의합니다.</label>
       		</div>

       		<button type="submit" class="btn btn-outline-secondary">회원가입</button>
		
		</form>
	
	
</body>
</html>