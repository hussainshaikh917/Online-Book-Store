package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet" , urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		User u = new User();
		
		u.setUsername(request.getParameter("name"));
		u.setPassword(request.getParameter("password"));
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","admin");
		
			PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ResultSet rs = ps.executeQuery();
			
			PrintWriter out = response.getWriter();
			
			if (rs.next()) {
				
				u.setEmail(rs.getString("email"));
				u.setRole(rs.getString("role"));
				
				HttpSession hs = request.getSession();
				//hs.setMaxInactiveInterval(60*10);
				hs.setAttribute("u", u);
				
				Cookie ck1 = new Cookie("un",u.getUsername());
				Cookie ck2 = new Cookie("pwd",u.getPassword());
				
				ck1.setMaxAge(30);
				ck2.setMaxAge(30);
				
				response.addCookie(ck1);
				response.addCookie(ck2);
				
				
				out.println(""
						+ "<script>"
						+ "alert('Welcome"+u.getUsername()+"');"
						+ "window.location='home.jsp';"
						+"</script>"
						);		
			}
			
			else {
				out.println(""
						+ "<script>"
						+ "alert('Incorrect Username or Password');"
						+ "window.location='login.jsp';"
						+"</script>"
						);
			}
		} 
		catch (Exception e) {
			
			System.out.println(e);
		}
		
	}

}
