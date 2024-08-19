<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
</head>
<body>
    <h1>Your Cart</h1>
    <c:if test="${not empty sessionScope.cart}">
        <table border="1">
            <tr>
                <th>Item</th>
                <th>Price</th>
            </tr>
            <c:forEach var="cartItem" items="${sessionScope.cart}">
                <tr>
                    <td>${cartItem.item}</td>
                    <td>${cartItem.price}</td>
                </tr>
            </c:forEach>
        </table>
        <h2>Total Price: 
            <c:set var="total" value="0" />
            <c:forEach var="cartItem" items="${sessionScope.cart}">
                <c:set var="total" value="${total + cartItem.price}" />
            </c:forEach>
            ${total}
        </h2>
    </c:if>
    <c:if test="${empty sessionScope.cart}">
        <p>Your cart is empty.</p>
    </c:if>
    <a href="Question15.jsp">Continue Shopping</a>
</body>
</html>