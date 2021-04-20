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
	
<!-- jQuery -->
<script src="<c:url value="/assets/javascript/jquery/jquery-3.6.0.js" /> "></script>

<!-- 스크립트 삽입 -->
<script src="<c:url value="/assets/javascript/members.js" /> "></script>

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
			
			<label for="userName">이름</label><br>
			<input name="userName" type="text"><br>
		
			<label for="id">아이디</label><br>
			<input type="text" name="id">
			<!-- 아이디 체크 버튼 -->
			<input type="button" 
					value="중복 체크" 
					onclick="checkid(this.form.id, `<c:url value="/users/idcheck" />`) " /><br>
			
			
			<label for="password">비밀번호</label><br>
			<input name="password" type="password"><br>
			
			
			<label for="gender">약관동의</label><br>
			<input type="checkbox" name="agree" value="agree">서비스 약관에 동의합니다.<br>
			<input type="submit" value="전송" >
			<!-- input type="button" value="폼 검증" onclick="checkForm(this.form)" --> 
		
		</form>
	
	<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
	
</body>
</html>