<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
</head>
<body>
<%
    String item = request.getParameter("item");
    String price = request.getParameter("price");

    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
    }

    Map<String, String> cartItem = new HashMap<>();
    cartItem.put("item", item);
    cartItem.put("price", price);

    cart.add(cartItem);
    session.setAttribute("cart", cart);

    response.sendRedirect("Question15.jsp");
%>
</body>
</html>