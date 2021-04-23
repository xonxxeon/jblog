<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c" %>
	
<!-- Date Format taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"
	prefix="fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<style>

	#lb{
		border-right: 0;
	}
	
	.blog{
		margin:0 auto;
	}
	
	#postul{
		width: 400px;
		margin: 10px auto;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/includes/blogHeader.jsp" />
	<jsp:include page="/WEB-INF/views/includes/blogNav.jsp" />
	
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h3 class="display-4">
			<c:if test="${ empty mainPost }">
				<h6>등록된 글이 없습니다.</h6>
			</c:if>
			<h3>${mainPost.postTitle}</h3>
		</h3>
	    <p class="lead">
			<c:if test="${ empty mainPost }">
			</c:if>
			<h6>${mainPost.postContent}</h6>
		</p>
	  </div>
	</div>
	
	
	<c:forEach items="${ mainList }" var="vo">
		<c:if test="${ not empty vo.postTitle }">
			<ul class="list-group" id="postul">
			  <li class="list-group-item d-flex justify-content-between align-items-center">
			    <form method="POST" action="${ pageContext.request.contextPath }/${id}" >
					<input type = "hidden" type="number" name = "postNo" value = ${ vo.postNo } />
					<input type = "hidden" type="number" name = "cateNo" value = ${ vo.cateNo } />
			  		<input type="submit" id="lb" class="list-group-item" value="${vo.postTitle }">
			  	</form>
			    <span class="badge badge-primary badge-pill"><fmt:formatDate value="${ vo.regDate }" pattern="yyyy-MM-dd"/></span>
			  </li>
			</ul>
		</c:if>
	</c:forEach>
		
	
	<jsp:include page="/WEB-INF/views/includes/blogFooter.jsp" />
	
</body>
</html>