package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SendOtpServlet")
public class SendOtpServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","admin");
		
			PreparedStatement ps = con.prepareStatement("select * from users where email=?");
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			PrintWriter out = resp.getWriter();
			
			if (rs.next()) {
				Random r = new Random();
				int randomnumber = r.nextInt(8888)+1000;
				
				HttpSession hs = req.getSession();
				hs.setAttribute("randomnumber", randomnumber);
				hs.setAttribute("email", email);
				
				Email em = new Email(email, "Password Reset ?", "OTP is "+randomnumber);
				em.sendEmail();
				

				out.println(""
						+ "<script>"
						+ "alert('Otp has been sent to your email please check');"
						+ "window.location='collectotp.jsp';"
						+"</script>"
						);
				
			}
			
			else {
				out.println(""
						+ "<script>"
						+ "alert('Incorrect Email');"
						+ "window.location='collectemail.jsp';"
						+"</script>"
						);
			}
				
		} 
		
		catch (Exception e) {
			System.out.println(e);
			
		}
	}

}
