<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .logout-message {
            text-align: center;
        }
    </style>
</head>
<body>
    <%
        session.invalidate();
        out.println("<div class='logout-message'><h1>You have been logged out.</h1><a href='login.jsp'>Login Again</a></div>");
    %>
</body>
</html>
