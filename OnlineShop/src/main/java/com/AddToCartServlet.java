package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		
		HttpSession hs = req.getSession();
		
		int bookid = Integer.parseInt(req.getParameter("bookid"));
		int quantity = Integer.parseInt(req.getParameter("qty"));
		String username = ((User)hs.getAttribute("u")).getUsername();
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","admin");
			
			PreparedStatement ps1 = con.prepareStatement("select * from cartitems where bookid=? and username=?");
			ps1.setInt(1, bookid);
			ps1.setString(2, username);
			ResultSet rs = ps1.executeQuery();
			
			if (rs.next()) {
				
				out.println(""
						+ "<script>"
						+ "alert('Item is already in the cart. Go to cart and check.....');"
						+ "window.location='cart.jsp';"
						+"</script>"
						);
			}
			
			else {
				
			
			PreparedStatement ps2 = con.prepareStatement("insert into cartitems(bookid,username,quantity) values(?,?,?)");
			ps2.setInt(1, bookid);
			ps2.setString(2,username);
			ps2.setInt(3, quantity);
			ps2.executeUpdate();
			
			out.println(""
					+ "<script>"
					+ "alert('Item added to cart successfully');"
					+ "window.location='cart.jsp';"
					+"</script>"
					);
		} 
	}
	
		catch (Exception e) {
			System.out.println(e);
		}
		
	}
}
