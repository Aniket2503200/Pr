<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Records</title>
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
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="submit"] {
            margin-bottom: 10px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        .pagination {
            text-align: center;
            margin: 20px 0;
        }
        .pagination a {
            padding: 8px 16px;
            margin: 0 4px;
            border: 1px solid #ddd;
            color: #007BFF;
            text-decoration: none;
        }
        .pagination a.active {
            background-color: #007BFF;
            color: white;
            border: 1px solid #007BFF;
        }
    </style>
</head>
<body>
    <h1>Search Records</h1>
    <form action="Question12.jsp" method="get">
        <input type="text" name="query" placeholder="Enter search term" value="<%= request.getParameter("query") %>">
        <input type="submit" value="Search">
    </form>

    <%
        String jdbcUrl = "jdbc:mysql://localhost:3306/Part3Ques12";
        String dbUser = "root";
        String dbPassword = "oneplus11R";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int pageSize = 10; // Number of records per page
        int currentPage = 1;

        String query = request.getParameter("query");
        if (query == null) {
            query = "";
        }

        try {
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            int totalRecords = 0;
            int totalPages = 0;
            
            // Get total records count
            String countQuery = "SELECT COUNT(*) FROM records WHERE root LIKE ?";
            stmt = conn.prepareStatement(countQuery);
            stmt.setString(1, "%" + query + "%");
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
            totalPages = (int) Math.ceil((double) totalRecords / pageSize);

            // Get current page
            String pageNumber = request.getParameter("page");
            if (pageNumber != null) {
                currentPage = Integer.parseInt(pageNumber);
            }
            if (currentPage < 1) {
                currentPage = 1;
            }
            if (currentPage > totalPages) {
                currentPage = totalPages;
            }

            // Get results for the current page
            String sql = "SELECT * FROM records WHERE root LIKE ? LIMIT ? OFFSET ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + query + "%");
            stmt.setInt(2, pageSize);
            stmt.setInt(3, (currentPage - 1) * pageSize);
            rs = stmt.executeQuery();
    %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Root</th>
                <th>OnePlus 11R</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String root = rs.getString("root");
                    String oneplus11R = rs.getString("oneplus11R");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= root %></td>
                <td><%= oneplus11R %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="pagination">
        <% if (totalPages > 1) { %>
            <% for (int i = 1; i <= totalPages; i++) { %>
                <a href="Question12.jsp?query=<%= query %>&page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
            <% } %>
        <% } %>
    </div>

    <%
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
