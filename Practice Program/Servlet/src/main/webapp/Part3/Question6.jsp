<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Handling Example</title>
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
        input[type="text"], input[type="submit"] {
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
    </style>
</head>
<body>
    <header>
        <h1>Error Handling Example</h1>
    </header>

    <div class="container">
        <div class="form-container">
            <h2>Submit Data</h2>
            <form action="Question6.jsp" method="post">
                <label for="data">Enter Data:</label>
                <input type="text" id="data" name="data" required>
                <input type="submit" value="Submit">
            </form>
        </div>
        
        <% 
            try {
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String data = request.getParameter("data");
                    if (data == null || data.trim().isEmpty()) {
                        throw new IllegalArgumentException("Data parameter is missing or empty.");
                    }
                    out.println("<p>Data received: " + data + "</p>");
                }
            } catch (Exception e) {
                // Forward to the error page
                request.setAttribute("errorMessage", e.getMessage());
                pageContext.forward("ErrorPage.jsp");
            }
        %>
    </div>
</body>
</html>
