package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckOtpServlet")
public class CheckOtpServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userotp = Integer.parseInt(req.getParameter("otp"));
		HttpSession hs = req.getSession();
		int yourotp = (Integer)hs.getAttribute("randomnumber");
		
		PrintWriter out = resp.getWriter();
		if (userotp == yourotp) {
		
			
			out.println(""
					+ "<script>"
					+ "alert('Correct Otp');"
					+ "window.location='changepassword.jsp';"
					+"</script>"
					);
		}
		
		else {
			out.println(""
					+ "<script>"
					+ "alert('INCorrect Otp');"
					+ "window.location='collectotp.jsp';"
					+"</script>"
					);
		}
		
	}
}
