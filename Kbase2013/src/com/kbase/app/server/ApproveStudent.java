package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ApproveStudent extends HttpServlet implements Serializable 
{
	public void doGet(HttpServletRequest req,HttpServletResponse resp)
			throws IOException, ServletException
			{
				PersistenceManager pm = PMF.get().getPersistenceManager();
				try
				{
					Long id= java.lang.Long.parseLong(req.getParameter("id"));
					try
					{
						pm.currentTransaction().begin();
						StudCourse t_new = pm.getObjectById(StudCourse.class, id);
						t_new.setApprove(1);
						pm.makePersistent(t_new);
		            	pm.currentTransaction().commit();
		            	resp.sendRedirect("add_student.jsp");
					}
					catch(Exception e)
					{
						pm.currentTransaction().rollback();
						resp.sendRedirect("add_student.jsp");
					}
				}
				finally
				{
					pm.close();
				}
			}
}