<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<html>
<head>
    <title>Danh sách bài viết</title>
</head>
<body>
<h1>Danh sách bài viết</h1>
<a href="posts?action=new">Thêm bài viết mới</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tiêu đề</th>
        <th>Nội dung</th>
        <th>Mô tả ngắn</th>
        <th>Hình ảnh</th>
        <th>Thao tác</th>
    </tr>
    <%
        List<Post> listPost = (List<Post>) request.getAttribute("listPost");
        for (Post post : listPost) {
    %>
    <tr>
        <td><%= post.getId() %></td>
        <td><%= post.getTitle() %></td>
        <td><%= post.getContent() %></td>
        <td><%= post.getShortdescription() %></td>
        <td><%= post.getImg() %></td>
        <td>
            <a href="posts?action=edit&id=<%= post.getId() %>">Chỉnh sửa</a>
            |
            <a href="posts?action=delete&id=<%= post.getId() %>" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</a>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
