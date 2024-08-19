<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Personalized Greeting</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        if (name != null && !name.trim().isEmpty()) {
            String greeting = "Hello, " + name + "!";
            out.println("<h1>" + greeting + "</h1>");
        } else {
            out.println("<h1>Please enter your name.</h1>");
        }
    %>
</body>
</html>
