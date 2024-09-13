<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h2>Menu and Food Items</h2>

    <%
        
        String url = "jdbc:mysql://localhost:3306/tmf_food_delivary"; 
        String username = "root"; 
        String password = "Sai@01Mysql"; 

        Connection connection = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        
        String selectedMenuId = request.getParameter("menu_id");

        try {
           
            Class.forName("com.mysql.jdbc.Driver");
            
            
            connection = DriverManager.getConnection(url, username, password);
            
            if (selectedMenuId != null) {
               
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
                
                String query = "SELECT * FROM menu";
                stmt = connection.createStatement();
                rs = stmt.executeQuery(query);
    %>

    <table>
        <tr>
            <th>Menu ID</th>
            <th>Restaurant ID</th>
        </tr>

    <%
               
                while (rs.next()) {
    %>
        <tr>
            <!-- Make the menu_id clickable, passing menu_id as a parameter in the URL -->
            <td><a href="menuandfooditems.jsp?menu_id=<%= rs.getInt("menu_id") %>"><%= rs.getInt("menu_id") %></a></td>
            <td><%= rs.getInt("restaurant_id") %></td>
        </tr>
    <%
                }
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (connection != null) connection.close();
        }
    %>
    </table>

</body>
</html>