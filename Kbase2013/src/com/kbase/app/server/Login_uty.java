package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

import javax.jdo.Query;

import java.io.PrintWriter;

import com.kbase.app.server.PMF;

@SuppressWarnings("serial")
public class Login_uty extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.University WHERE admin_email == '" + req.getParameter("username")+"'");
			@SuppressWarnings("unchecked")
			List<University> result = (List<University>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.University u : result)
				{
					if(u.getPass().equals(req.getParameter("pass")))
					{
						req.getSession().setAttribute("email_admin",req.getParameter("username"));
						req.getSession().setAttribute("admin_level","1");
						req.getSession().setAttribute("uty_id",u.getId());
						resp.sendRedirect("uty_dash.jsp");
					}
					else
					{
						PrintWriter out = resp.getWriter();
						out.println("Password error");
					}
				}
			}
			else
			{	
				PrintWriter out = resp.getWriter();
				out.println("Not registered");
			}
		}
		finally
		{
			pm.close();
		}
	}
}