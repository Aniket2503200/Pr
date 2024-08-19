<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Records</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Employee Records</h2>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        String jdbcURL = "jdbc:mysql://localhost:3306/Part3Ques7"; // Replace with your DB URL
        String dbUser = "root"; // Replace with your DB username
        String dbPassword = "oneplus11R"; // Replace with your DB password

        try {
            // Load the JDBC driver (if necessary)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Create a statement
            stmt = conn.createStatement();

            // Execute a query
            String sql = "SELECT * FROM employees"; // Replace with your SQL query
            rs = stmt.executeQuery(sql);
    %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Position</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String position = rs.getString("position");
                    double salary = rs.getDouble("salary");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= position %></td>
                <td><%= salary %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
