<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Post</title>
</head>
<body>
<h1>Create New Post</h1>
<form action="posts" method="post">
    <input type="hidden" name="action" value="create">
    Title: <input type="text" name="title"><br>
    Content: <textarea name="content"></textarea><br>
    Short Description: <input type="text" name="shortdescription"><br>
    Image URL: <input type="text" name="img"><br>
    <input type="submit" value="Create">
</form>
</body>
</html>
