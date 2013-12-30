package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class AddTeachCourse extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException
	{
			HttpSession session = req.getSession(true);
			Long id_tchr = (Long)session.getAttribute("user_id");
			PersistenceManager pm3 = PMF.get().getPersistenceManager();
			try
			{
				Query q_crs = pm3.newQuery("SELECT FROM com.kbase.app.server.Teachcourse");
				q_crs.setFilter("course_id =="+java.lang.Long.parseLong(req.getParameter("course_id"))+" && teacher_id == " + id_tchr);
				@SuppressWarnings("unchecked")
				List<Teachcourse> result_next = (List<Teachcourse>) q_crs.execute();
				if(result_next.isEmpty())
				{
					Teachcourse d = new Teachcourse(id_tchr,java.lang.Long.parseLong(req.getParameter("course_id")),java.lang.Long.parseLong(session.getAttribute("uty_id").toString()),0);
					pm3.makePersistent(d);
				}
			}
			catch(NullPointerException n)
			{
				resp.sendRedirect("view_course_tchr.jsp");
			}
			finally
			{
				pm3.close();
			}		
			resp.sendRedirect("view_course_tchr.jsp");	
	}
}