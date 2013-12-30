<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,com.kbase.app.server.*,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory" %>
<%
UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();
session.setAttribute("email_admin", null);
session.setAttribute("admin_level", "0");
session.setAttribute("uty_id", null);
session.invalidate();
if(user!=null)
	response.sendRedirect(userService.createLogoutURL(request.getRequestURI()));
else
	response.sendRedirect("kbase.jsp");
%>