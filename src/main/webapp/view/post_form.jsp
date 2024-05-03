<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create New Post</title>
</head>
<body>
<div align="center">
    <h1>Create New Post</h1>
    <form action="/posts" method="post">
        <!-- Hidden field to specify the action to be taken by the servlet -->
        <input type="hidden" name="action" value="insert" />
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td>Content:</td>
                <td><textarea name="content"></textarea></td>
            </tr>
            <tr>
                <td>Short Description:</td>
                <td><input type="text" name="shortdescription" /></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td><input type="text" name="img" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Create" /></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
