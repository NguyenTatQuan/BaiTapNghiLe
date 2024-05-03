<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List of Posts</title>
</head>
<body>
<div align="center">
    <h1>List of Posts</h1>
    <a href="/posts?action=create">Add New Post</a>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>Short Destination</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="post" items="${listPost}">
            <tr>
                <td><c:out value="${post.id}"/></td>
                <td><c:out value="${post.title}"/></td>
                <td><c:out value="${post.content}"/></td>
                <td><c:out value="${post.shortdescription}"/></td>
                <td><img src="<c:out value='${post.img}'/>" alt="Post Image" style="width: 100px; height: auto;"/></td>
                <td>
                    <a href="/posts?action=edit&id=${post.id}">Edit</a>
                    <a href="/posts?action=delete&id=${post.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>