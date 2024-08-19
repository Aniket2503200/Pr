<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Locale, java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
    <title>Internationalization Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        h1 {
            color: #007BFF;
            text-align: center;
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        select, input[type="submit"] {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%
        // Get the selected locale from the request, default to English
        String lang = request.getParameter("lang");
        if (lang == null || lang.isEmpty()) {
            lang = "en";
        }
        Locale locale = new Locale(lang);
        ResourceBundle messages = ResourceBundle.getBundle("messages", locale);
    %>

    <h1><%= messages.getString("greeting") %></h1>
    <p><%= messages.getString("message") %></p>

    <form action="Question13.jsp" method="get">
        <label for="lang"><%= messages.getString("selectLanguage") %></label>
        <select name="lang" id="lang">
            <option value="en" <%= "en".equals(lang) ? "selected" : "" %>>English</option>
            <option value="fr" <%= "fr".equals(lang) ? "selected" : "" %>>French</option>
            <!-- Add more languages as needed -->
        </select>
        <input type="submit" value="Change Language">
    </form>
</body>
</html>
