<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/modify_form</title>
<style type="text/css">
	h2{font-size:40px; font-family:Gabriola; color:#34597F; margin-top:35px;}
	.bold{color:#34597F; font-size:15px; font-weight:bold;}
	.line{width:400px; margin-top:10px; margin-bottom:10px; margin-left:300px;}
	.btn{color:#183755; background-color:#B7CDE4; margin-top:20px;}
	</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0] //파일에 대한 정보
		console.log(file)
		if (file != '') {
			var reader = new FileReader();
			reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
			reader.onload = function(e) { // 파일 로드한 값을 표현한다
				//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
				$('#preview').attr('src', e.target.result);
			}
		}
	}
</script>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
		<h2>Modify</h2>
		<form action="${contextPath}/board/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="writeNo" value="${personalData.writeNo}">
			<input type="hidden" name="originFileName" value="${personalData.imageFileName}"> <!-- 기존에 있던 이미지가 수정될 수 있기 때문에 가져가야하는 정보  -->
			<label class="bold" style="margin-right:335px;">Title</label><br>
			<input type="text" name="title" value="${personalData.title}" style="width:350px;  margin-right:10px;">
			<hr class="line">
			<label class="bold" style="margin-right:314px;">Content</label><br>
			<textarea rows="10" cols="50" name="content">${personalData.content}</textarea>
			<hr class="line">
			<label class="bold" style="margin-right:300px;">ImageFile</label><br>
			<input type="file" name="image_file_name" onchange="readURL(this);" style="font-size:11px;">
			<c:if test="${ personalData.imageFileName != 'nan' }">
				<img width="150px" height="100px" id="preview"
					src="${contextPath}/board/download?imageFileName=${personalData.imageFileName}">
			</c:if>
			<hr class="line">
			<input type="submit" value="MODIFY" class="btn"> 
			<input type="button" onclick="history.back()" value="CANCEL" class="btn">
		</form>
	</div>
	<c:import url="../default/footer.jsp" />

</body>
</html>