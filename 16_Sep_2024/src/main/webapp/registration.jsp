<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

 body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }

</style>

</head>
<body>

<div class="container">
    <h2>Restaurant Registration</h2>
    
    <form action="RegistrationServlet" method="post">
        
            <label for="res_name">Restaurant Name:</label>
            <input type="text" id="res_name" name="res_name" required>
             
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
       
            <label for="location">Location:</label>
            <input type="text" id="location" name="location" required>
      
            <label for="open_time">Open Time:</label>
            <input type="time" id="open_time" name="open_time" required>
       
            <label for="close_time">Close Time:</label>
            <input type="time" id="close_time" name="close_time" required>
       
            <label for="gst_no">GST Number:</label>
            <input type="text" id="gst_no" name="gst_no" required>
       
            <label for="cuisins_list">Cuisine List (comma-separated):</label>
            <input type="text" id="cuisins_list" name="cuisins_list" required>
       
            <label for="contact_number">Contact Number:</label>
            <input type="text" id="contact_number" name="contact_number" maxlength="10" required>
       
            <label for="bank_account_number">Bank Account Number:</label>
            <input type="text" id="bank_account_number" name="bank_account_number" maxlength="16" required>
       
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
      
            <label for="login_password">Login Password:</label>
            <input type="password" id="login_password" name="login_password" required>
       
            <label for="avg_rating">Average Rating:</label>
            <input type="text" id="avg_rating" name="avg_rating" maxlength="3">
       
            <label for="curr_order_accepting_status">Current Order Accepting Status (Yes/No):</label>
            <select id="curr_order_accepting_status" name="curr_order_accepting_status" required>
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>
      
            <label for="res_img">Restaurant Image URL:</label>
            <input type="text" id="res_img" name="res_img" required>
      
            <input type="submit" value="Register">
       
    </form>
</div>

</body>
</html>