<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Deliberate Exception</title>
</head>
<body>
    <h2>This Page Throws an Exception</h2>
    <%
        // Deliberately throw an exception to test error handling
        throw new RuntimeException("This is a deliberate exception!");
    %>
</body>
</html>


//errorHandler.jsp run 1st