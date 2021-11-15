<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/successLogin</title>
<style type="text/css">
	h3{color:#34597F; margin-top:20px;}
	label{color:#183755;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<h3>  Login successful </h3>
		<label> Welcome, ${loginUser }! </label>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>