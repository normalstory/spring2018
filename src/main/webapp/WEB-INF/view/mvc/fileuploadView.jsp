<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>file upload View</title>
</head>
<body>
	<h2>File Upload View</h2>
<form action="/mvc/fileupload" method="post" enctype="multipart/form-data">
	<input type="file" name="uploadFile"><br/>
	<input type="text" name="userId" value="brown">
	<input type="submit" value="전송">
</form>

</body>
</html>