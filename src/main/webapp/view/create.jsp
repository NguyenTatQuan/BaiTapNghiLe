<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
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
    <h2>Tạo Bài Viết Mới</h2>
    <form action="/posts" method="post">
        <input type="hidden" name="action" value="create">
        <div>
            <label for="id">ID:</label>
            <input type="number" id="id" name="id" required>
        </div>
        <div>
            <label for="title">Tiêu đề:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div>
            <label for="content">Nội dung:</label>
            <textarea id="content" name="content" required></textarea>
        </div>
        <div>
            <label for="shortdescription">Mô tả ngắn:</label>
            <input type="text" id="shortdescription" name="shortdescription" required>
        </div>
        <div>
            <label for="img">Đường dẫn hình ảnh:</label>
            <input type="text" id="img" name="img" required>
        </div>
        <div>
            <button type="submit">Tạo</button>
        </div>
    </form>
</div>
</body>
</html>
