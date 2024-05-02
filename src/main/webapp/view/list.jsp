<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Posts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            color: #333;
            margin-top: 0;
        }
        .post {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }
        h2 {
            margin-top: 0;
            margin-bottom: 10px;
        }
        p {
            color: #666;
            margin-bottom: 10px;
        }
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .create-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
        .create-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>List of Posts</h1>
    <c:forEach var="post" items="${posts}">
        <div class="post">
            <h2>${post.title}</h2>
            <p>${post.shortdescription}</p>
            <div class="actions">
                <a href="posts?action=view&id=${post.id}">View</a>
                <a href="posts?action=edit&id=${post.id}">Edit</a>
                <a href="posts?action=delete&id=${post.id}">Delete</a>
            </div>
        </div>
    </c:forEach>
    <a class="create-link" href="posts?action=create">Create New Post</a>
</div>
</body>
</html>
