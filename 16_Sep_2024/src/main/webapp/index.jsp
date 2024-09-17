<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
	<div class="header">
            <div class="logo">
                <img class="logo-img" src="https://e7.pngegg.com/pngimages/815/847/png-clipart-take-out-android-sindelantal-app-food-text-thumbnail.png";" alt="logo image"/>
            </div>
             <div class="nav-items">
        		<ul>
          			<li>Home</li>
          			<li>About Us</li>
          			<li>Contact Us</li>
          			<li>Cart</li>
       			</ul>
      		 </div>
    </div>
    
    
    <%
    
    String jdbcURL = "jdbc:mysql://localhost:3306/food-app";
    String jdbcUsername = "root";
    String jdbcPassword = "Sai@01Mysql";

    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        
        Class.forName("com.mysql.cj.jdbc.Driver");

       
        con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

       
        statement = con.createStatement();

        
        String sql = "SELECT cloudinaryImageId, name, avgRatingString, costForTwo FROM restaurantdetails";
        resultSet = statement.executeQuery(sql);

      
        while (resultSet.next()) {
            String cloudinaryImageId = resultSet.getString("cloudinaryImageId");
            String name = resultSet.getString("name");
           
            String avgRatingString = resultSet.getString("avgRatingString");
            String costForTwo = resultSet.getString("costForTwo");
        
%>
    
    <div class="res-container">
    <div class="res-card" >
        <img
          class="res-logo"
          alt="res-logo"
          src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/<%= cloudinaryImageId %>";  
        />
        <h3><%= name %></h3>
        
        <h4><%= avgRatingString %></h4>
        <h4><%= costForTwo %></h4>
    </div>
    </div>
    
<%
        } 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        
        if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
        if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
%>
    
</body>
</html>