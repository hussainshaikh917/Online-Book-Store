package com;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="RegistrationServlet", urlPatterns = "/RegistrationServlet")

public class RegistrationServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","admin");
		
			PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, "user");
			ps.executeUpdate();
			
			Email em = new Email(email, "Registered Successfully!!!", "Welcome to Online Book Store");
			em.sendEmail();
			
			response.sendRedirect("home.jsp");
		} 
		catch (Exception e) {
			
			System.out.println(e);
		}
	}

}
