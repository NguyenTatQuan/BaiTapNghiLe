<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm bài viết mới</title>
</head>
<body>
<h1>Thêm bài viết mới</h1>
<form action="posts" method="post">
    <input type="hidden" name="action" value="new"/>
    Tiêu đề: <input type="text" name="title"/><br/>
    Nội dung: <textarea name="content"></textarea><br/>
    Mô tả ngắn: <input type="text" name="shortdescription"/><br/>
    Hình ảnh: <input type="text" name="img"/><br/>
    <input type="submit" value="Thêm"/>
</form>
</body>
</html>
