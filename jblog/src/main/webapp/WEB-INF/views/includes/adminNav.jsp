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
	.adminBt > #adbt{
		margin: 0 auto;
	}
</style>



</head>
<body>
<br>

	
	<div class="adminBt">
	
		<div id="adbt" class="btn-group" role="group" aria-label="Basic example">
		  <a href="../" class="btn btn-secondary" 
			role="button" aria-pressed="true">홈</a>
			<a href="./basic" class="btn btn-secondary" 
			role="button" aria-pressed="true">기본설정</a>
			<a href="./category" class="btn btn-secondary" 
			role="button" aria-pressed="true">카테고리</a>
			<a href="./write" class="btn btn-secondary" 
			role="button" aria-pressed="true">글쓰기</a>
		</div>
	
	</div>

</body>