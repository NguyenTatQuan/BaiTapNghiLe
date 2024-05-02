<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Post</title>
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
        p {
            color: #666;
        }
        img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-top: 10px;
        }
        .action-links a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${post.title}</h1>
    <p>${post.content}</p>
    <p>${post.shortdescription}</p>
    <img src="${post.img}" alt="Post Image">
    <div class="action-links">
        <a href="posts?action=edit&id=${post.id}">Edit</a>
        <a href="posts?action=delete&id=${post.id}">Delete</a>
    </div>
</div>
</body>
</html>
