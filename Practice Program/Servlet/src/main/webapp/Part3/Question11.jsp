<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <script>
        function validateForm() {
            var username = document.forms["registrationForm"]["username"].value;
            var email = document.forms["registrationForm"]["email"].value;
            var password = document.forms["registrationForm"]["password"].value;
            var confirmPassword = document.forms["registrationForm"]["confirmPassword"].value;

            if (username === "" || email === "" || password === "" || confirmPassword === "") {
                alert("All fields must be filled out.");
                return false;
            }

            var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                alert("Invalid email address.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h1>User Registration</h1>
    <form name="registrationForm" action="Question11.jsp" method="post" onsubmit="return validateForm()">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<c:out value="${param.username}"/>" />
        <br/><br/>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<c:out value="${param.email}"/>" />
        <br/><br/>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" />
        <br/><br/>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" />
        <br/><br/>

        <input type="submit" value="Register" />
    </form>

    <% 
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            boolean hasErrors = false;
            StringBuilder errorMessage = new StringBuilder();

            if (username == null || username.trim().isEmpty()) {
                errorMessage.append("Username is required.<br/>");
                hasErrors = true;
            }

            if (email == null || email.trim().isEmpty()) {
                errorMessage.append("Email is required.<br/>");
                hasErrors = true;
            } else {
                String emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
                if (!email.matches(emailPattern)) {
                    errorMessage.append("Invalid email address.<br/>");
                    hasErrors = true;
                }
            }

            if (password == null || password.trim().isEmpty()) {
                errorMessage.append("Password is required.<br/>");
                hasErrors = true;
            }

            if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
                errorMessage.append("Confirm Password is required.<br/>");
                hasErrors = true;
            } else if (!password.equals(confirmPassword)) {
                errorMessage.append("Passwords do not match.<br/>");
                hasErrors = true;
            }

            if (hasErrors) {
                out.println("<p style='color: red;'>" + errorMessage.toString() + "</p>");
            } else {
                out.println("<p style='color: green;'>Registration successful!</p>");
                // Here you can add code to save the user information to a database
            }
        }
    %>
</body>
</html>
