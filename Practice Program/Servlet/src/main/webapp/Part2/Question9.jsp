<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AJAX Example</title>
    <script>
        function fetchTime() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("time").innerHTML = xhr.responseText;
                }
            };
            xhr.open("GET", "currentTime.jsp", true);
            xhr.send();
        }
    </script>
</head>
<body>
    <button onclick="fetchTime()">Get Current Time</button>
    <div id="time"></div>
</body>
</html>