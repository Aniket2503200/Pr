<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Save User Data</title>
</head>
<body>
    <h2>Save User Data</h2>
    <%
        // Get the session or create a new one
        jakarta.servlet.http.HttpSession userSession = request.getSession(true);
        
        // Retrieve form parameters and store them in the session
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        
        userSession.setAttribute("name", name);
        userSession.setAttribute("email", email);
        userSession.setAttribute("age", age);
    %>
    <p>Data has been saved to the session.</p>
    <a href="sessionDisplay.jsp">Go to Display Page</a>
</body>
</html>
