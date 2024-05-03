<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Post" %>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<h1>Chỉnh sửa bài viết</h1>
<%
    Post post = (Post) request.getAttribute("post");
%>
<form action="posts" method="post">
    <input type="hidden" name="action" value="update"/> <!-- Sửa đây: từ "edit" thành "update" để khớp với case trong Servlet -->
    <input type="hidden" name="id" value="<%= post.getId() %>"/>
    Tiêu đề: <input type="text" name="title" value="<%= post.getTitle() %>"/><br/>
    Nội dung: <textarea name="content"><%= post.getContent() %></textarea><br/>
    Mô tả ngắn: <input type="text" name="shortdescription" value="<%= post.getShortdescription() %>"/><br/>
    Hình ảnh: <input type="text" name="img" value="<%= post.getImg() %>"/><br/>
    <input type="submit" value="Cập nhật"/>
</form>
</body>
</html>
