package com.sai.util;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sai.util.JDBCConnection;
import com.sai.util.Restaurant;

public class RestaurantDAO {

	 private static final String INSERT_RESTAURANT_SQL = "INSERT INTO restaurantdetails"
	            + "(res_name, address, location, open_time, close_time, gst_no, cuisins_list, contact_number, bank_account_number, email, login_password, avg_rating, curr_order_accepting_status, res_img) "
	            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	    
	    public boolean registerRestaurant(Restaurant restaurant) throws ClassNotFoundException {
	        boolean isRegistered = false;

	        try (Connection connection = JDBCConnection.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESTAURANT_SQL)) {

	           
	            preparedStatement.setString(1, restaurant.getResName());
	            preparedStatement.setString(2, restaurant.getAddress());
	            preparedStatement.setString(3, restaurant.getLocation());
	            preparedStatement.setString(4, restaurant.getOpenTime());
	            preparedStatement.setString(5, restaurant.getCloseTime());
	            preparedStatement.setString(6, restaurant.getGstNo());
	            preparedStatement.setString(7, restaurant.getCuisinsList());
	            preparedStatement.setString(8, restaurant.getContactNumber());
	            preparedStatement.setString(9, restaurant.getBankAccountNumber());
	            preparedStatement.setString(10, restaurant.getEmail());
	            preparedStatement.setString(11, restaurant.getLoginPassword());
	            preparedStatement.setString(12, restaurant.getAvgRating());
	            preparedStatement.setString(13, restaurant.getCurrOrderAcceptingStatus());
	            preparedStatement.setString(14, restaurant.getResImg());

	           
	            int result = preparedStatement.executeUpdate();
	            isRegistered = result > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return isRegistered;
	
}
}
