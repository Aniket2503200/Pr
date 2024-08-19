<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
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
        .error-container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }
        .error-message {
            color: #e74c3c;
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .error-details {
            font-size: 1.1em;
            color: #555;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-container">
            <h2>An Error Occurred</h2>
            <p class="error-message">Oops! Something went wrong.</p>
            <p class="error-details">
                <%= request.getAttribute("errorMessage") %>
            </p>
            <a href="Question6.jsp">Go back to the form</a>
        </div>
    </div>
</body>
</html>
