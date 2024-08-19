<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add to Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        header {
            background: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }
        select, input[type="submit"] {
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        .cart-items {
            margin-top: 20px;
        }
        .cart-items ul {
            list-style: none;
            padding: 0;
        }
        .cart-items li {
            padding: 10px;
            background: #fff;
            border-bottom: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 5px;
        }
        .link {
            display: inline-block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Shopping Cart</h1>
    </header>

    <div class="container">
        <div class="form-container">
            <h2>Add Item to Cart</h2>
            <form action="Question5.jsp" method="post">
                <label for="item">Select Item:</label>
                <select name="item" id="item">
                    <option value="Laptop">Laptop - $1200</option>
                    <option value="Smartphone">Smartphone - $800</option>
                    <option value="Headphones">Headphones - $150</option>
                </select>
                <input type="submit" value="Add to Cart">
            </form>

            <div class="cart-items">
                <h3>Cart Contents:</h3>
                <ul>
                    <%
                        List<String> cart = (List<String>) session.getAttribute("cart");
                        if (cart == null) {
                            cart = new ArrayList<>();
                            session.setAttribute("cart", cart);
                        }
                        String item = request.getParameter("item");
                        if (item != null && !item.isEmpty()) {
                            cart.add(item);
                        }
                        if (cart.isEmpty()) {
                            out.println("<li>Your cart is empty.</li>");
                        } else {
                            for (String cartItem : cart) {
                                out.println("<li>" + cartItem + "</li>");
                            }
                        }
                    %>
                </ul>
            </div>

            <a href="ViewCart.jsp" class="link">View Cart</a>
        </div>
    </div>
</body>
</html>
