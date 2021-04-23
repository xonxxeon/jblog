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

    #cate {
        width: 200px;
        font-size: 13px;
    }
    
    #img {
    	width: 200px;
    	border: 1px solid lightgray;
    }

	.menu{
        width: 200px;
        height: auto;
        float: right;
    }
</style>

</head>
<body>

	<div class="menu">
		<img id="img" src="${ pageContext.request.contextPath }/upload-images/${ vo.logoFile }">
		
		<ul class="list-group">
	  		<li id="cate" class="list-group-item">카테고리</li>
			<!-- 게시물 Loop -->
			<c:forEach items="${ list }" var="vo">
			<form method="POST"
					action="${ pageContext.request.contextPath }/${vo.id}" >
				<input type = "hidden" type="number" name = "cateNo" value = ${ vo.cateNo } />
				<input type="submit" value="${ vo.cateName }" 
				
				class="list-group-item list-group-item-action list-group-item-dark" />
			</form>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>