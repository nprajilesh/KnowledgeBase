package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class AddPresentation extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException
	{
			Long c_name = java.lang.Long.parseLong(req.getParameter("c_name"));
			String p_link = req.getParameter("p_link");
			String p_name = req.getParameter("p_name");
			String delims = "[/]";
			String[] tokens =p_link.split(delims);
			String q_link = tokens[5];
			Long tchr_id = (Long)req.getSession().getAttribute("user_id");
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try
			{
				Query q = pm.newQuery("SELECT FROM com.kbase.app.server.Teachcourse ");
				q.setFilter("course_id == "+ c_name +"&& teacher_id == " + tchr_id);
				@SuppressWarnings("unchecked")
				List<Teachcourse> result = (List<Teachcourse>) q.execute();
				for(com.kbase.app.server.Teachcourse t :result)
				{
					Long teach_course_id = t.getId();
					Presentation p = new Presentation(p_name,q_link,c_name,tchr_id,teach_course_id);
					pm.makePersistent(p);
				}
			}
			finally
			{
				pm.close();
			}
			resp.sendRedirect("view_presentations.jsp?crs="+c_name +"&&tchr="+tchr_id);	
	}
}