<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,javax.jdo.*,java.lang.*,com.kbase.app.server.*,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>
<%    if ((session.getAttribute("email_admin") == null) && (session.getAttribute("email_admin") == "")) {
			response.sendRedirect("kbase.jsp");
		}
		Long id = java.lang.Long.parseLong(request.getParameter("id").toString());
		Long tchr_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());		
		PersistenceManager pm = PMF.get().getPersistenceManager();
			try
			{		
				Presentation p = pm.getObjectById(Presentation.class,id);
				if(p.getTeacher().equals(tchr_id))
				{
					pm.deletePersistent(p);				
				}
				response.sendRedirect("tchr_dash.jsp");
			}catch(JDOObjectNotFoundException j)
			{
				response.sendRedirect("tchr_dash.jsp");
			}
			finally
			{
				pm.close();			
			}
%>