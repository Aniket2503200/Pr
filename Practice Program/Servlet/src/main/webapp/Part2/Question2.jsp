<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Item List</title>
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
    <h2>Simple Item List</h2>

    <!-- Define a list of items -->
    <%
        List<Map<String, String>> itemList = new ArrayList<>();
        Map<String, String> item1 = new HashMap<>();
        item1.put("id", "1");
        item1.put("name", "Item 1");
        item1.put("description", "Description 1");
        itemList.add(item1);

        Map<String, String> item2 = new HashMap<>();
        item2.put("id", "2");
        item2.put("name", "Item 2");
        item2.put("description", "Description 2");
        itemList.add(item2);

        Map<String, String> item3 = new HashMap<>();
        item3.put("id", "3");
        item3.put("name", "Item 3");
        item3.put("description", "Description 3");
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
    </table>
</body>
</html>
