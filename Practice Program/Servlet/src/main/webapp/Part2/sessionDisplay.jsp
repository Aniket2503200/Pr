<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Data</title>
</head>
<body>
    <h2>User Data</h2>
    <%
        // Get the session
        jakarta.servlet.http.HttpSession userSession = request.getSession(false);
        
        if (userSession != null) {
            // Retrieve session attributes
            String name = (String) userSession.getAttribute("name");
            String email = (String) userSession.getAttribute("email");
            String age = (String) userSession.getAttribute("age");
    %>
            <p>Name: <%= name %></p>
            <p>Email: <%= email %></p>
            <p>Age: <%= age %></p>
    <%
        } else {
    %>
            <p>No session found.</p>
    <%
        }
    %>
    <a href="sessionSave.jsp">Go to Save Data Page</a>
</body>
</html>
