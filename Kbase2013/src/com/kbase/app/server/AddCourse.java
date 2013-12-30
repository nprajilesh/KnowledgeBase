package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class AddCourse extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			HttpSession session = req.getSession(true);
			if(req.getParameter("course_name") !=null)
			{
				Course c = new Course(req.getParameter("course_name"),java.lang.Long.parseLong(req.getParameter("dept_id")),(Long)session.getAttribute("uty_id"));
				pm.makePersistent(c);
			}
			resp.sendRedirect("view_course.jsp");
		}
		finally
		{
			pm.close();
		}
	}
}