<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writeForm</title>
<style type="text/css">
	h2{font-size:40px; font-family:Gabriola; color:#34597F;}
	.bold{color:#34597F; font-size:15px; font-weight:bold;}
	hr{width:400px; margin-top:10px; margin-bottom:10px; margin-left:300px;}
	button{color:#183755; background-color:#B7CDE4; margin-top:20px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="wrap">
	<h2>Write</h2>
	<label class="bold" style="margin-right:320px;">Writer</label><br>
	<input type="text" id="#" style="margin-right:190px;">
	<hr>
	<label class="bold" style="margin-right:335px;">Title</label><br>
	<input type="text" id="#" style="width:350px;  margin-right:10px;">
	<hr>
	<label class="bold" style="margin-right:314px;">Content</label><br>
	<textarea rows="10" cols="50"></textarea>
	<hr>
	<label class="bold" style="margin-right:300px;">ImageFile</label><br>
	<button type="button">search File</button>
	<hr>
	<button type="button">SAVE</button>
	<button type="button">LIST</button>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>