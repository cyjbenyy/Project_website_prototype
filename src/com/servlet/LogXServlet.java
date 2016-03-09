package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.valuebean.UserBean;

public class LogXServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String forward="";
		String message="";
		
		String name=request.getParameter("username");
		String pswd=request.getParameter("userpswd");
		UserBean loginer=new UserDao().login(name,pswd);
		if(loginer==null){
			forward="/message.jsp";
			message="<li>用户名或密码错误！</li>";
			message+="<a href='javascript:window.history.go(-1)'>返回重试</a>";
		}
		else{
			forward="/showshopcar";
			request.getSession().setAttribute("loginer",loginer);
		}
		
		request.setAttribute("message",message);
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}
}