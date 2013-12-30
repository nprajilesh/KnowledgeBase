package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.Query;
import javax.jdo.PersistenceManager;

import com.kbase.app.server.PMF;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class SignupUty extends HttpServlet implements Serializable 
{
	//@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try
		{
			PersistenceManager pm2 = PMF.get().getPersistenceManager();
			Query q = pm2.newQuery("SELECT FROM com.kbase.app.server.University WHERE admin_email == '" + req.getParameter("admin_email") + "'");
			try
			{
				@SuppressWarnings("unchecked")
				List<University> result = (List<University>) q.execute();
				if(result.isEmpty())
				{
					University u =new University(req.getParameter("uty_name"),req.getParameter("admin_email"),req.getParameter("uty_addr"),req.getParameter("pass1"),req.getParameter("uty_phone"));
					pm.makePersistent(u);	
					resp.sendRedirect("kbase.jsp");
				}
				else
				{
					resp.sendRedirect("signup_uty.jsp");
				}
				
			}
			finally
			{
				pm2.close();
			}
		}
		finally
		{
			pm.close();
		}

		
	}
}