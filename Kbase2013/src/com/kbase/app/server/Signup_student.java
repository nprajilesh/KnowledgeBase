package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.Query;





import java.io.PrintWriter;

import javax.jdo.PersistenceManager;

import com.kbase.app.server.PMF;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Signup_student extends HttpServlet implements Serializable 
{
	//@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			PersistenceManager pm2 = PMF.get().getPersistenceManager();
			Query q = pm2.newQuery("SELECT FROM com.kbase.app.server.Teacher WHERE teacher_email == '" + req.getParameter("student_email") + "'");
			try
			{
				@SuppressWarnings("unchecked")
				List<Teacher> result_teacher = (List<Teacher>) q.execute();
				if(result_teacher.isEmpty())
				{

					PersistenceManager pm4 = PMF.get().getPersistenceManager();
					Query q_uty = pm4.newQuery("SELECT FROM com.kbase.app.server.University WHERE admin_email == '" + req.getParameter("student_email") + "'");
					try
					{
						@SuppressWarnings("unchecked")
						List<University> result_uty = (List<University>) q_uty.execute();
						if(result_uty.isEmpty())
						{
							PersistenceManager pm3 = PMF.get().getPersistenceManager();
							Query q_stud = pm3.newQuery("SELECT FROM com.kbase.app.server.Student WHERE student_email == '" + req.getParameter("student_email") + "'");
							try
							{
								@SuppressWarnings("unchecked")
								List<Student> result = (List<Student>) q_stud.execute();
								if(result.isEmpty())
								{
									Long dept = (long) 0;
									Student u =new Student(req.getParameter("student_name"),req.getParameter("student_email"),req.getParameter("admn_no"),req.getParameter("student_addr"),req.getParameter("student_phone"),java.lang.Long.parseLong(req.getParameter("college")),dept);
									req.getSession().setAttribute("email_admin",req.getParameter("student_email"));
									req.getSession().setAttribute("admin_level","3");
									req.getSession().setAttribute("uty_id",req.getParameter("college"));
									req.getSession().setAttribute("dept_no","0");
									pm.makePersistent(u);
									resp.sendRedirect("dept_select_stud.jsp");
								}
								else
								{
									PrintWriter out = resp.getWriter();
									out.println("\nYou have already Registered as student !! ");
								}
							}
							finally
							{
								pm3.close();
							}
						}
						else
						{
							PrintWriter out = resp.getWriter();
							out.println("\nYou have at University !! ");
						}
						
					}
					finally
					{
						pm4.close();
					}
					
				}
				else
				{
					PrintWriter out = resp.getWriter();
					out.println("\nYou have registered as teacher !! ");
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