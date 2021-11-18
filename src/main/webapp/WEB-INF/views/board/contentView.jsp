<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/contentView</title>
<style type="text/css">
	table{margin:auto; margin-top:30px; text-align:center;}
	table caption{font-size:40px; font-family:Gabriola; color:#34597F; text-align:center;}
	table tr th{font-size:17px; color:#34597F; background-color:#D1DCE8; padding:2px 25px; }
	table tr td{color:#183755; padding:2px 25px;}
	table tr td a{font-size:10px; color:#183755;}
	.btn{color:#183755; background-color:#B7CDE4; margin-top:20px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
	<table>
		<caption> <b>Personal Data</b></caption>
		<tr>
			<th width="100">No.</th>
			<td width="200">${personalData.writeNo}</td>
			<th width="100">Writer</th>
			<td width="200">${personalData.id}</td>
		</tr>
		<tr>
			<th>Title</th>
			<td>${personalData.title}</td>
			<th>Date</th>
			<td>${personalData.saveDate}</td>
		</tr>
		<tr>
			<th>Content</th>
			<td>${personalData.content}</td>
			<td colspan="2">
				<c:if test="${ personalData.imageFileName == 'nan' }">
					<b>No Image</b>
				</c:if> 
				<c:if test="${ personalData.imageFileName != 'nan' }">
					<a href="${contextPath}/board/download?imageFileName=${personalData.imageFileName}">
					<img width="200px" height="100px" 
					src="${contextPath}/board/download?imageFileName=${personalData.imageFileName}">
					<br>
					${personalData.imageFileName}
					</a>
				</c:if>
			</td>
		</tr>
		</table>
		<c:if test="${ loginUser == personalData.id }">
			<input type="button" onclick="" value="MODIFY" class="btn">
			<input type="button" onclick="location.href='${contextPath }/board/delete?writeNo=${personalData.writeNo }&imageFileName=${personalData.imageFileName}'" value="DELETE" class="btn">
		</c:if> 
			<input type="button" onclick="" 
					value="REPLY" class="btn"> 	<!-- writeNo : DB의 내용 삭제, imageFileName : 저장소에서 파일 삭제 -->
			<input type="button" onclick="location.href='${contextPath}/board/boardAllList'" value="LIST" class="btn">
		
	
	</div>
	<c:import url="../default/footer.jsp" />

</body>
</html>