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

<style>

</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/blogHeader.jsp" />
	<jsp:include page="/WEB-INF/views/includes/blogNav.jsp" />
	
	<ul class="list-group">
  		<li id="post" class="list-group-item">게시글</li>
  		<c:choose>
       		<c:when test=" ">
           		<a class="navbar-brand" 
           		href="${ pageContext.servletContext.contextPath }/">
           		로그인</a>
           	</c:when>
			<c:otherwise>	<!-- 로그인 한 상태 -->
				<a class="navbar-brand" 
           		href="${ pageContext.servletContext.contextPath }/">
           		로그아웃</a>
			</c:otherwise>
		</c:choose>
		<!-- 게시물 Loop -->
		<c:forEach items="${ list }" var="vo">
		<li>
			<a id="cate" href="#" class="list-group-item list-group-item-action list-group-item-primary">${ vo.cateName }</a>
		</li>
		</c:forEach>
	</ul>

	<jsp:include page="/WEB-INF/views/includes/blogFooter.jsp" />
	
</body>
</html>