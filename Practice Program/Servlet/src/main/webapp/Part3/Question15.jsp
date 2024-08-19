<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
    <h1>Shopping Cart</h1>
    <form action="addItem.jsp" method="post">
        Item Name: <input type="text" name="item" required /><br>
        Price: <input type="number" step="0.01" name="price" required /><br>
        <input type="submit" value="Add to Cart" />
    </form>
    <a href="cart.jsp">View Cart</a>
</body>
</html>