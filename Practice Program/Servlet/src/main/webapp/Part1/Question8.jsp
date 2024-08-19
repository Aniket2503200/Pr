<%-- Expression Language Example --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language Example</title>
</head>
<body>
<%-- Setting attribute in request scope --%>
<%
    request.setAttribute("message", "Hello, EL!");
%>
<h1>${message}</h1>
</body>
</html>