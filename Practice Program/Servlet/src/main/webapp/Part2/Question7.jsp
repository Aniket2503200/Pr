<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        h1 {
            color: #007BFF;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        p {
            text-align: center;
            color: #FF0000;
        }
    </style>
</head>
<body>
    <h1>Database Data from Part2Question7</h1>
    
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection (modify URL, username, and password as needed)
            String url = "jdbc:mysql://localhost:3306/Part2Question7";
            String user = "root";
            String password = "oneplus11R";
            conn = DriverManager.getConnection(url, user, password);
            
            // Create a statement and execute a query
            stmt = conn.createStatement();
            String query = "SELECT * FROM your_table";  // Replace with your actual table name
            rs = stmt.executeQuery(query);
            
            // Display results
    %>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <!-- Add more headers as per your table columns -->
                </tr>
                <%
                while (rs.next()) {
                    int id = rs.getInt("id");  // Replace with your actual column name
                    String name = rs.getString("name");  // Replace with your actual column name
                    String email = rs.getString("email");  // Replace with your actual column name
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <!-- Add more data cells as per your table columns -->
                </tr>
                <%
                }
                %>
            </table>
    <%
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    %>
</body>
</html>
