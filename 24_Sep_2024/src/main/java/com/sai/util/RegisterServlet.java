package com.sai.util;

import java.io.IOException;
import java.io.PrintWriter;

import com.sai.util.RestaurantDAO;
import com.sai.util.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		 response.setContentType("text/html");

	        String resName = request.getParameter("res_name");
	        String address = request.getParameter("address");
	        String location = request.getParameter("location");
	        String openTime = request.getParameter("open_time");
	        String closeTime = request.getParameter("close_time");
	        String gstNo = request.getParameter("gst_no");
	        String cuisinsList = request.getParameter("cuisins_list");
	        String contactNumber = request.getParameter("contact_number");
	        String bankAccountNumber = request.getParameter("bank_account_number");
	        String email = request.getParameter("email");
	        String loginPassword = request.getParameter("login_password");
	        String avgRating = request.getParameter("avg_rating");
	        String currOrderAcceptingStatus = request.getParameter("curr_order_accepting_status");
	        String resImg = request.getParameter("res_img");

	        Restaurant restaurant = new Restaurant();
	        restaurant.setResName(resName);
	        restaurant.setAddress(address);
	        restaurant.setLocation(location);
	        restaurant.setOpenTime(openTime);
	        restaurant.setCloseTime(closeTime);
	        restaurant.setGstNo(gstNo);
	        restaurant.setCuisinsList(cuisinsList);
	        restaurant.setContactNumber(contactNumber);
	        restaurant.setBankAccountNumber(bankAccountNumber);
	        restaurant.setEmail(email);
	        restaurant.setLoginPassword(loginPassword);
	        restaurant.setAvgRating(avgRating);
	        restaurant.setCurrOrderAcceptingStatus(currOrderAcceptingStatus);
	        restaurant.setResImg(resImg);

	        RestaurantDAO restaurantDAO = new RestaurantDAO();
	        boolean isRegistered;
			try {
				isRegistered = restaurantDAO.registerRestaurant(restaurant);
			
	        PrintWriter out = response.getWriter();
	        if (isRegistered) {
	            response.sendRedirect("index.jsp");  
	        } else {
	            out.println("<html><body><b>Error occurred during registration!</b></body></html>");
	        }
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}

		
	}

}
