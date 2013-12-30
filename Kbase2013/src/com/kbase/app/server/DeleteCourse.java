package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class DeleteCourse extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Course d = pm.getObjectById(Course.class, java.lang.Long.parseLong(req.getParameter("dept_crs_id")));
			pm.deletePersistent(d);

			resp.sendRedirect("view_course.jsp");
		}catch(JDOObjectNotFoundException ex)
		{
			resp.sendRedirect("view_course.jsp");
		}
		finally
		{
			pm.close();
		}
	}
}