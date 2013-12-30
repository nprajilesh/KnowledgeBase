package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class Login_student extends HttpServlet implements Serializable 
{
	public void doGet(HttpServletRequest req,HttpServletResponse resp)
	throws IOException, ServletException
	{
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		if (user != null) {
			//resp.getWriter().println("Welcome, " + user.getNickname());
			//resp.getWriter().println(
				//	"<a href='"
					//		+ userService.createLogoutURL(req.getRequestURI())
						//	+ "'> LogOut </a>");
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try
			{
				Query q = pm.newQuery("SELECT FROM com.kbase.app.server.Student WHERE student_email == '" + user.getEmail() +"'");
				@SuppressWarnings("unchecked")
				List<Student> result = (List<Student>) q.execute();
				if(!result.isEmpty())
				{
					for(com.kbase.app.server.Student t : result)
					{
							req.getSession().setAttribute("email_admin",user.getEmail());
							req.getSession().setAttribute("admin_level","3");
							req.getSession().setAttribute("user_id",t.getId());
							req.getSession().setAttribute("uty_id",t.getuty());
							req.getSession().setAttribute("dept_id",t.getDept());
							
							String test = "0";
							if(t.getDept().toString().equals(test))
							{
								req.getSession().setAttribute("dept_no","0");
								resp.sendRedirect("dept_select_stud.jsp");
							}
							else
							{
								req.getSession().setAttribute("dept_no","1");
								resp.sendRedirect("stud_dash.jsp");
							}
					}
				}
				else
				{
					resp.sendRedirect("student_signup.jsp");		
				}
			}
			finally
			{
				pm.close();
			}
		} else {
				resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
		}
	}
}