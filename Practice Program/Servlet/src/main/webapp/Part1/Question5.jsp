<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Scripting Elements</title>
</head>
<body>

<%!
    int count = 0;
    public void incrementCount() {
        count++;
    }
%>

<%
    incrementCount();
    String name = "Alice";
%>

<h1>Scripting Elements</h1>

<p>Current count: <%= count %></p>
<p>Hello, <%= name %>!</p>

</body>
</html>