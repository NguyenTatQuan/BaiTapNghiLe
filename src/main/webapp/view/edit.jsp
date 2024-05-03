<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Post</title>
</head>
<body>
<div align="center">
    <h1>Edit Post</h1>
    <form action="/posts?action=edit" method="post">
        <input type="hidden" name="id" value="${post.id}" />
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" value="${post.title}" /></td>
            </tr>
            <tr>
                <td>Content:</td>
                <td><textarea name="content">${post.content}</textarea></td>
            </tr>
            <tr>
                <td>Short Destination:</td>
                <td><input type="text" name="shortdestination" value="${post.shortdestination}" /></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td><input type="text" name="img" value="${post.img}" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save" /></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>