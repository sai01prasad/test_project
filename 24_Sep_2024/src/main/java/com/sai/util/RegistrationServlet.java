package com.sai.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class RegistrationServlet
 */

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    // SQL Insert query
    private static final String query = "INSERT INTO restaurantdetails"
            + "(res_name, address, location, open_time, close_time, gst_no, cuisins_list, contact_number, bank_account_number, email, login_password, avg_rating, curr_order_accepting_status, res_img) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
        
       
        String res_name = request.getParameter("res_name");
        String address = request.getParameter("address");
        String location = request.getParameter("location");
        String open_time = request.getParameter("open_time");
        String close_time = request.getParameter("close_time");
        String gst_no = request.getParameter("gst_no");
        String cuisins_list = request.getParameter("cuisins_list");
        String contact_number = request.getParameter("contact_number");
        String bank_account_number = request.getParameter("bank_account_number");
        String email = request.getParameter("email");
        String login_password = request.getParameter("login_password");
        String avg_rating = request.getParameter("avg_rating");
        String curr_order_accepting_status = request.getParameter("curr_order_accepting_status");
        String res_img = request.getParameter("res_img");

       
        try (Connection connection = JDBCConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            
           
            preparedStatement.setString(1, res_name);
            preparedStatement.setString(2, address);
            preparedStatement.setString(3, location);
            preparedStatement.setString(4, open_time);
            preparedStatement.setString(5, close_time);
            preparedStatement.setString(6, gst_no);
            preparedStatement.setString(7, cuisins_list);
            preparedStatement.setString(8, contact_number);
            preparedStatement.setString(9, bank_account_number);
            preparedStatement.setString(10, email);
            preparedStatement.setString(11, login_password);
            preparedStatement.setString(12, avg_rating);
            preparedStatement.setString(13, curr_order_accepting_status);
            preparedStatement.setString(14, res_img);

         
            int result = preparedStatement.executeUpdate();

          
            if (result > 0) {
               
                PrintWriter out = response.getWriter();
                out.println("<html><body><b>Registration successful!</b></body></html>");
                response.sendRedirect("login.jsp"); 
            } else {
                PrintWriter out = response.getWriter();
                out.println("<html><body><b>Error occurred during registration!</b></body></html>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
		
	}

}
