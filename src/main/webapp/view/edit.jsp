<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
</head>
<body>
<h1>Edit Post</h1>
<form action="posts" method="post">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${post.id}">
    Title: <input type="text" name="title" value="${post.title}"><br>
    Content: <textarea name="content">${post.content}</textarea><br>
    Short Description: <input type="text" name="shortdescription" value="${post.shortdescription}"><br>
    Image URL: <input type="text" name="img" value="${post.img}"><br>
    <input type="submit" value="Save Changes">
</form>
</body>
</html>
