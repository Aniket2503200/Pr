<%@ page isErrorPage="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
<h1>An Error Occurred</h1>
<p>Error Message: <%= exception.getMessage() %></p>
<p>Exception Type: <%= exception.getClass().getName() %></p>
</body>
</html>