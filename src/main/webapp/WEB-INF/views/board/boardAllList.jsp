<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board All List</title>
<style type="text/css">
	table{margin:auto; margin-top:30px; text-align:center;}
	table caption{font-size:40px; font-family:Gabriola; color:#34597F; text-align:center;}
	table tr:nth-child(odd){background-color:#EBF3F9;}
	table tr th{font-size:17px; color:#34597F; background-color:#D1DCE8; padding:2px 25px; }
	table tr td{color:#183755; padding:2px 25px;}
	button{color:#183755; background-color:#B7CDE4; margin-top:20px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
	<div class="wrap">
	<table>
		<caption><b>Board</b>
		<tr>
			<th>No.</th>
			<th>ID</th>
			<th>Title</th>
			<th>Date</th>
			<th>Hit</th>
			<th>image_file_name</th>
		</tr>
	</table>
	<button type="button" onclick="location.href='writeForm'">WRTIE</button>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>