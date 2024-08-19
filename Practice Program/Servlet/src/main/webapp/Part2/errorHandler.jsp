<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h2>Oops! Something went wrong.</h2>
    <p>Sorry, an error occurred while processing your request.</p>
    <p>Error Details:</p>
    <pre>
        <%= exception.getMessage() %>
    </pre>
    <p><a href="Question5.jsp">Go back to the error page</a></p>
</body>
</html>
