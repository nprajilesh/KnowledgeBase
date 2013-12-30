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
public class Update_department_student extends HttpServlet implements Serializable 
{
	//@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.Student WHERE student_email == '" + req.getSession().getAttribute("email_admin") + "'");
			@SuppressWarnings("unchecked")
			List<Student> result = (List<Student>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Student t : result)
				{
					try
					{
						pm.currentTransaction().begin();
						Student t_new = pm.getObjectById(Student.class, t.getId());
						t_new.setDept(java.lang.Long.parseLong(req.getParameter("dept_id")));
						req.getSession().setAttribute("dept_no","1");
						req.getSession().setAttribute("dept_id",java.lang.Long.parseLong(req.getParameter("dept_id")));
						req.getSession().setAttribute("user_id",t_new.getId());
						pm.makePersistent(t_new);
		            	pm.currentTransaction().commit();
		            	resp.sendRedirect("stud_dash.jsp");
					}
					catch(Exception e)
					{
						pm.currentTransaction().rollback();
						resp.sendRedirect("dept_select_stud.jsp");
					}
				}
				
			}
			else
			{
				resp.sendRedirect("dept_select_stud.jsp");
			}
	    }
		finally
		{
			pm.close();
		}
    		
	}
}