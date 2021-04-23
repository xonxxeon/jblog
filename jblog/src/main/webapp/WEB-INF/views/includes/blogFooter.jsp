<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<style>
	.footer{
        margin: 0px auto;
        clear:both;
        width: 100%;
    }

    p {
        color: white;
        margin: 0px auto;
    }
</style>
  </head>

    <div class="footer">
    	<nav class="navbar navbar-dark bg-dark">
        	<p>${ vo.getBlogTitle() }&nbsp;&nbsp;is Powered by JBlog &copy;2021</p>
    	</nav>
    </div>
    
</html>