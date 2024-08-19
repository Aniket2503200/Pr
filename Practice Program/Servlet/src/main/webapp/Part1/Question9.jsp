<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Handling Demo</title>
</head>
<body>
<h1>Error Handling Demo</h1>
<%
    // Throw an exception
    if (true) {
        throw new RuntimeException("Intentional Exception for Testing");
    }
%>
</body>
</html>