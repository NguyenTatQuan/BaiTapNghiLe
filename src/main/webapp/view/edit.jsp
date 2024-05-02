<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Post</h1>
    <form action="posts" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${post.id}">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${post.title}">
        <br>
        <label for="content">Content:</label>
        <textarea id="content" name="content">${post.content}</textarea>
        <br>
        <label for="shortdescription">Short Description:</label>
        <input type="text" id="shortdescription" name="shortdescription" value="${post.shortdescription}">
        <br>
        <label for="img">Image URL:</label>
        <input type="text" id="img" name="img" value="${post.img}">
        <br>
        <input type="submit" value="Save Changes">
    </form>
</div>
</body>
</html>
