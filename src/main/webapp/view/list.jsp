<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Posts</title>
</head>
<style></style>
<body>
<h1>List of Posts</h1>
<c:forEach var="post" items="${posts}">
    <div>
        <h2>${post.title}</h2>
        <p>${post.shortdescription}</p>
        <a href="posts?action=view&id=${post.id}">View</a>
        <a href="posts?action=edit&id=${post.id}">Edit</a>
        <a href="posts?action=delete&id=${post.id}">Delete</a>
    </div>
</c:forEach>
<a href="posts?action=create">Create New Post</a>
</body>
</html>
