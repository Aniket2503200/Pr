<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>

<%
    // request object
    String name = request.getParameter("name");
    if (name != null) {
        out.println("Welcome, " + name + "!");
    }

    // response object
    response.setHeader("X-Custom-Header", "My Custom Header");

    // session object
    HttpSession mySession = request.getSession();
    if (mySession.isNew()) {
        mySession.setAttribute("visitCount", 1);
    } else {
        Integer count = (Integer) mySession.getAttribute("visitCount");
        if (count == null) {
            count = 1;
        }
        count++;
        mySession.setAttribute("visitCount", count);
        out.println("You have visited this page " + count + " times.");
    }

    // application object
    ServletContext myApplication = getServletContext();
    Integer appCount = (Integer) myApplication.getAttribute("appCount");
    if (appCount == null) {
        myApplication.setAttribute("appCount", 1);
    } else {
        appCount++;
        myApplication.setAttribute("appCount", appCount);
    }
    out.println("<br>Total visits to the application: " + appCount);

    // pageContext object
    pageContext.setAttribute("myAttribute", "Hello from pageContext");
    Object attributeValue = pageContext.getAttribute("myAttribute");
    out.println("<br>PageContext attribute: " + attributeValue);
%>

</body>
</html>
