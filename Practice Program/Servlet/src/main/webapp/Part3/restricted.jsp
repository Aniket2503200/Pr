<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restricted Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .restricted {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .logout {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        String role = (String) session.getAttribute("role");
        if (role == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <div class="restricted">
        <h1>Welcome, <%= role %>!</h1>
        <p>You have access to this page because of your role.</p>
        <%
            if ("admin".equals(role)) {
                out.println("<p>Admin-specific content goes here.</p>");
            } else if ("user".equals(role)) {
                out.println("<p>User-specific content goes here.</p>");
            }
        %>
        <div class="logout">
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
