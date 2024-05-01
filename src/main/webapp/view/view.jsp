<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Post</title>
</head>
<body>
<h1>${post.title}</h1>
<p>${post.content}</p>
<p>${post.shortdescription}</p>
<img src="${post.img}" alt="Post Image">
<a href="posts?action=edit&id=${post.id}">Edit</a>
<a href="posts?action=delete&id=${post.id}">Delete</a>
</body>
</html>
