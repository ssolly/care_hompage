<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info</title>
<style type="text/css">
	table{margin:auto; margin-top:30px; text-align:center; width:300px;}
	table caption{font-size:40px; font-family:Gabriola; color:#34597F; text-align:center; }
	table tr td b{font-size:15px; color:#34597F; padding:2px 20px;}
	table tr td{color:#183755; padding:2px 20px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="wrap">
		<table>
			<caption><b>Member Information</b></caption>
			<tr>
				<td><b>ID</b></td><td>${info.id }</td>
			</tr>
			<tr>
				<td><b>Password</b></td><td>${info.pw }</td>
			</tr>
			<tr>
				<td><b>Address</b></td><td>${info.addr }</td>
			</tr>
		</table>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>