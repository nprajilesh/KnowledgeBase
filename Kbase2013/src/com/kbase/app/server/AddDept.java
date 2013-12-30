package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class AddDept extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			HttpSession session = req.getSession(true);
			if(req.getParameter("dept_name")!=null)
			{
				Department d = new Department(req.getParameter("dept_name"),(Long)session.getAttribute("uty_id"));
				pm.makePersistent(d);		
			}
			resp.sendRedirect("view_dept.jsp");
		} 
		finally
		{
			pm.close();
		}
	}
}