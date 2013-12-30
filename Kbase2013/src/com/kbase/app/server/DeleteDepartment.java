package com.kbase.app.server;

import java.io.IOException;
import java.io.Serializable;

import javax.jdo.JDOObjectNotFoundException;
import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kbase.app.server.Department;

@SuppressWarnings("serial")
public class DeleteDepartment extends HttpServlet implements Serializable 
{
	public void doPost(HttpServletRequest req,HttpServletResponse resp)
	throws IOException
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Department d = pm.getObjectById(Department.class, java.lang.Long.parseLong(req.getParameter("dept_del_id")));
			pm.deletePersistent(d);

			resp.sendRedirect("view_dept.jsp");
		}catch(JDOObjectNotFoundException ex)
		{
			resp.sendRedirect("view_dept.jsp");
		}
		finally
		{
			pm.close();
		}
	}
}