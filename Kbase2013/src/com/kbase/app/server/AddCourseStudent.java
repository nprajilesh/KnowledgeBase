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
public class AddCourseStudent extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException
	{
			HttpSession session = req.getSession(true);
			Long id_stud = (Long)session.getAttribute("user_id");
			PersistenceManager pm3 = PMF.get().getPersistenceManager();
			try
			{
				
				Query q_crs = pm3.newQuery("SELECT FROM com.kbase.app.server.StudCourse");
				q_crs.setFilter("teach_course_id =="+java.lang.Long.parseLong(req.getParameter("course_id"))+" && student_id == " + id_stud);
				@SuppressWarnings("unchecked")
				List<StudCourse> result_next = (List<StudCourse>) q_crs.execute();
				resp.getWriter().print(result_next);
				if(result_next.isEmpty())
				{
					resp.getWriter().println("Entered");
					StudCourse d = new StudCourse(java.lang.Long.parseLong(req.getParameter("course_id")),id_stud,0);
					pm3.makePersistent(d);
				}
			}
			finally
			{
				pm3.close();
			}		
			resp.sendRedirect("view_course_stud.jsp");	
	}
}