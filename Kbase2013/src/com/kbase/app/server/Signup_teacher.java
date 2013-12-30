package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.Query;





import java.io.PrintWriter;

import javax.jdo.PersistenceManager;

import com.kbase.app.server.PMF;






import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Signup_teacher extends HttpServlet implements Serializable 
{
	//@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			PersistenceManager pm2 = PMF.get().getPersistenceManager();
			Query q = pm2.newQuery("SELECT FROM com.kbase.app.server.Teacher WHERE teacher_email == '" + req.getParameter("teacher_email") + "'");
			try
			{
				@SuppressWarnings("unchecked")
				List<Teacher> result = (List<Teacher>) q.execute();
				if(result.isEmpty())
				{
					Long dept = (long) 0;
					Teacher u =new Teacher(req.getParameter("teacher_name"),req.getParameter("teacher_email"),req.getParameter("teacher_addr"),req.getParameter("teacher_phone"),java.lang.Long.parseLong(req.getParameter("teach")),dept);
					req.getSession().setAttribute("email_admin",req.getParameter("teacher_email"));
					req.getSession().setAttribute("admin_level","2");
					req.getSession().setAttribute("uty_id",req.getParameter("teach"));
					req.getSession().setAttribute("dept_no","0");
					pm.makePersistent(u);
					resp.sendRedirect("dept_select_teach.jsp");
				}
				else
				{
					PrintWriter out = resp.getWriter();
					out.println("\nteacher Already Registered !! ");
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