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

<h2>Menu List</h2>

    <%
        Connection connection = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            
            connection = JDBCConnection.getConnection();
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
            
            <td><a href="food_items.jsp?menu_id=<%= rs.getInt("menu_id") %>"><%= rs.getInt("menu_id") %></a></td>
            <td><%= rs.getInt("restaurant_id") %></td>
        </tr>
    <%
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