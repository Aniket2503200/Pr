<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Decorative Item List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #444;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        td {
            font-size: 14px;
        }
        tfoot {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
            text-align: right;
        }
        tfoot td {
            padding: 10px;
        }
    </style>
</head>
<body>
    <h2>Decorative Item List</h2>

    <!-- Define a list of items -->
    <%
        List<Map<String, String>> itemList = new ArrayList<>();
        Map<String, String> item1 = new HashMap<>();
        item1.put("id", "1");
        item1.put("name", "Item 1");
        item1.put("description", "This is the first item in the list.");
        itemList.add(item1);

        Map<String, String> item2 = new HashMap<>();
        item2.put("id", "2");
        item2.put("name", "Item 2");
        item2.put("description", "This is the second item in the list.");
        itemList.add(item2);

        Map<String, String> item3 = new HashMap<>();
        item3.put("id", "3");
        item3.put("name", "Item 3");
        item3.put("description", "This is the third item in the list.");
        itemList.add(item3);

        pageContext.setAttribute("itemList", itemList);
    %>

    <!-- Iterate over the list using JSTL -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${itemList}">
                <tr>
                    <td><c:out value="${item.id}"/></td>
                    <td><c:out value="${item.name}"/></td>
                    <td><c:out value="${item.description}"/></td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3">Total Items: <c:out value="${fn:length(itemList)}"/></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
