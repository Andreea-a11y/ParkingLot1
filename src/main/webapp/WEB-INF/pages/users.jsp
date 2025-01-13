<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/25/2024
  Time: 8:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.UserDto" %>
<html>
<head>
    <title>Users</title>
</head>
<body>
<h2>List of Users</h2>
<table border="1">
    <tr>
        <th>Username</th>
        <th>Email</th>
    </tr>
    <%
        List<UserDto> users = (List<UserDto>) request.getAttribute("usersList");
        for (UserDto user : users) {
    %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getEmail() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
