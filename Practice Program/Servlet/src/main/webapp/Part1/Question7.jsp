<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>JSTL Example</title>
</head>
<body>

<c:forEach var="i" begin="1" end="5">
    The count is <c:out value="${i}"></c:out><br>
</c:forEach>

<c:if test="${5 > 3}">
    5 is greater than 3
</c:if>

</body>
</html>
