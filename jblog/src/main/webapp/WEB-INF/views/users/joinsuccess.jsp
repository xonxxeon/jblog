<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>

<style>
		#bt{
             width: 300px;
             margin: 30px auto;
         }
         .joinsuccess {
         	 margin: 50px auto;
             text-align: center;
         }
         h5{
         	margin: 30px;
         }
</style>

</head>
</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/header.jsp" />
		
		<div class="joinsuccess">
			<h5>회원가입을 축하드립니다 !</h5>
			<h5>로그인 후 개인블로그 서비스를 이용하실 수 있습니다 !</h5>
		    <a id="bt" href="<c:url value="/users/login" /> " 
						class="btn btn-lg btn-secondary btn-block" 
						role="button" aria-pressed="true">로그인</a>
		</div>

	
</body>
</html>