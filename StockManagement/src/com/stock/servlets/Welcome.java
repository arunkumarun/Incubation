package com.stock.servlets;

import java.io.*;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stock.bean.SignBean;
import com.stock.service.Administrator;

/**
 * Servlet implementation class Welcome
 */
@WebServlet("/Welcome")
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public Welcome() {
        super();
    }
    
    public String addUser(HttpServletRequest req) throws ClassNotFoundException, SQLException{
    	SignBean sb = new SignBean();
    	Administrator a = new Administrator();
    	sb.setName(req.getParameter("uname"));
    	sb.setPass(req.getParameter("pass"));
    	sb.setRepass(req.getParameter("repass"));
    	System.out.println(req.getParameter("uname")+"  "+req.getParameter("pass"));
    	String res = a.addUser(sb);
    	
    	return res;
    }
    
    public String checkUser(HttpServletRequest req) throws ClassNotFoundException, SQLException{
    	
    	Administrator a = new Administrator();
    	
    	String name = req.getParameter("uname");
    	String pass = req.getParameter("pass");
    	
    	String res = a.checkUser(name, pass);
    	return res;
    }
    
    /*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("operation");
	
		String signUpRes = new String();
		String signInRes = new String();
		if(op.equalsIgnoreCase("signup")){
			try {
				signUpRes = addUser(request);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(signUpRes.equalsIgnoreCase("OK")){
				response.sendRedirect("success.jsp");
			}
			else if(signUpRes.equals("FAIL") || signUpRes.equals("INVALID INPUT") || signUpRes.equals("NAME EXISTS") || signUpRes.equals("Password not match")){
    			request.setAttribute("err", signUpRes);
    			RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
    			rd.forward(request,response);
			}
		}
		if(op.equalsIgnoreCase("signin")){
			try {
				signInRes = checkUser(request);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			if(signInRes.equalsIgnoreCase("CUSTOMER")){
				String name = request.getParameter("uname");
				request.getSession().setAttribute("name",name);
				request.getRequestDispatcher("users.jsp").forward(request, response);
			}
			else if(signInRes.equals("ADMIN")){
				response.sendRedirect("admin.jsp");
			}
			else{
				request.setAttribute("err", signInRes);
    			RequestDispatcher rd = request.getRequestDispatcher("/index.html");
    			rd.forward(request,response);
			}
			
		}
		//doGet(request, response);
	}

}
