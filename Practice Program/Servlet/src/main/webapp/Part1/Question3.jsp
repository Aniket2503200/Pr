<%@ page contentType="text/html;charset=UTF-8" language="java" isThreadSafe="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Single JSP Example</title>
</head>
<body>
    <h1>This is an example of using JSP directives in a single file</h1>
    
    <!-- Using a JSTL tag -->
    <c:out value="Hello, World!" />
    
    <!-- Content included from header.jsp -->
    <p>The header content is included above.</p>
</body>
</html>
