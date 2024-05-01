<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Post</title>

</head>
<body>
<h1>Delete Post</h1>
<p>Are you sure you want to delete this post?</p>
<form action="posts" method="post">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" name="id" value="${post.id}">
    <input type="submit" value="Delete">
</form>
</body>
</html>
