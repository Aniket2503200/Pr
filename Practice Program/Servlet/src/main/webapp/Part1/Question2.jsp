<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Lifecycle Example</title>
</head>
<body>
    <h1>JSP Lifecycle Example</h1>
    <%
        // Initialization (similar to jspInit)
        application.setAttribute("initialized", true);
        out.println("<p>Initialization completed.</p>");

        // Execution (similar to _jspService)
        String message = "Welcome to the JSP lifecycle demonstration.";
        out.println("<p>Message: " + message + "</p>");

        // Cleanup (similar to jspDestroy)
        application.setAttribute("cleanedUp", true);
        out.println("<p>Cleanup set to true.</p>");
    %>
</body>
</html>
