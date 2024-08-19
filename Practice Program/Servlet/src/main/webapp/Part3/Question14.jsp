<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session Management with User Roles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        form, .restricted-content {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="password"], input[type="submit"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .logout {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String lang = request.getParameter("lang");

        if ("logout".equals(action)) {
            session.invalidate();
            response.sendRedirect("Question14.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        if (role == null) {
            if (username != null && password != null) {
                // Dummy authentication; replace with real authentication logic
                if ("admin".equals(username) && "adminpass".equals(password)) {
                    session.setAttribute("role", "admin");
                    role = "admin";
                } else if ("user".equals(username) && "userpass".equals(password)) {
                    session.setAttribute("role", "user");
                    role = "user";
                } else {
                    out.println("<p>Invalid username or password</p>");
                }
            }
        }
    %>

    <%
        if (role == null) {
    %>
        <h1>Login</h1>
        <form action="Question14.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
    <%
        } else {
    %>
        <h1>Welcome, <%= role %>!</h1>
        <div class="restricted-content">
            <p>You have access to this page because of your role.</p>
            <%
                if ("admin".equals(role)) {
                    out.println("<p>Admin-specific content goes here.</p>");
                } else if ("user".equals(role)) {
                    out.println("<p>User-specific content goes here.</p>");
                }
            %>
            <div class="logout">
                <a href="Question14.jsp?action=logout">Logout</a>
            </div>
        </div>
    <%
        }
    %>
</body>
</html>
