<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Data Display</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .data-container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #007BFF;
        }
        p {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="data-container">
        <h2>Submitted Data</h2>
        <%
            // Retrieve form data from the request
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String age = request.getParameter("age");
        %>
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Age:</strong> <%= age %></p>
    </div>
</body>
</html>
