<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.sai.util.JDBCConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Food Items</h2>

    <%
        Connection connection = null;
        Statement stmt = null;
        ResultSet rs = null;

        // Get the selected menu_id from the request parameter
        String selectedMenuId = request.getParameter("menu_id");

        try {
            if (selectedMenuId != null) {
                // Get connection using JDBCConnection utility class
                connection = JDBCConnection.getConnection();

                
                String query = "SELECT food_item_name, price_per_quantity, food_image, food_description, is_non_vegiterian, is_eggitarian, avg_rating, cuisin_id " +
                               "FROM food_items WHERE menu_id = " + selectedMenuId;
                stmt = connection.createStatement();
                rs = stmt.executeQuery(query);
    %>

    <h3>Food Items in Menu ID: <%= selectedMenuId %></h3>
    <table>
        <tr>
            <th>Food Item Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Description</th>
            <th>Non-Vegetarian</th>
            <th>Eggitarian</th>
            <th>Average Rating</th>
            <th>Cuisine ID</th>
        </tr>

    <%
                while (rs.next()) {
    %>
        <tr>
            <td><%= rs.getString("food_item_name") %></td>
            <td><%= rs.getInt("price_per_quantity") %></td>
            <td><img src="<%= rs.getString("food_image") %>" alt="Food Image" width="100"></td>
            <td><%= rs.getString("food_description") %></td>
            <td><%= rs.getString("is_non_vegiterian") %></td>
            <td><%= rs.getString("is_eggitarian") %></td>
            <td><%= rs.getString("avg_rating") %></td>
            <td><%= rs.getInt("cuisin_id") %></td>
        </tr>
    <%
                }
    %>
    </table>

    <%
            } else {
                out.println("No menu selected. Please go back to the menu list.");
                
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (connection != null) connection.close();
        }
    %>


</body>
</html>