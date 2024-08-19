<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Cart</title>
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
        .cart-container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
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
        <div class="cart-container">
            <h2>Shopping Cart</h2>
            <div class="cart-items">
                <%
                    List<String> cart = (List<String>) session.getAttribute("cart");
                    if (cart == null || cart.isEmpty()) {
                        out.println("<p>Your cart is empty.</p>");
                    } else {
                        out.println("<ul>");
                        for (String item : cart) {
                            out.println("<li>" + item + "</li>");
                        }
                        out.println("</ul>");
                    }
                %>
            </div>

            <a href="Question5.jsp" class="link">Add More Items</a>
        </div>
    </div>
</body>
</html>
