package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	private FilterConfig fc;

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)sRequest;
		String whichsubmit=request.getParameter("whichsubmit");
		if(whichsubmit==null){
			HttpSession session=request.getSession();			
			Object loginer=session.getAttribute("loginer");
			if(loginer==null||!(loginer instanceof com.valuebean.UserBean)){		//Before login
				RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				rd.forward(request,sResponse);
			}
			else																	//If logged
				chain.doFilter(sRequest,sResponse);										
		}
		else
			chain.doFilter(sRequest,sResponse);
	}
	
	public void init(FilterConfig fc) throws ServletException {
		this.fc=fc;
	}	
	public void destroy() {
		this.fc=null;
	}
}