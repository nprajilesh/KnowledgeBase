<%@ page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.University,com.kbase.app.server.*,com.kbase.app.server.Department,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>
<%
    if ((session.getAttribute("email_admin") == null) || (session.getAttribute("email_admin") == "")) {
			response.sendRedirect("kbase.jsp");
		} else {
			
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard - Knowledge Base</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
      <div class="row">
<div class="span12">

 <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Department List </h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats"> <%=session.getAttribute("email_admin")%> </h6>
                  <div id="big_stats" class="cf">
                		 <table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Department</th>
										<th>Id</th>
										<th>No.of teachers enrolled</th>
									</tr>
								</thead>                			
                			<tbody>
                				  <%
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.Department WHERE uty_id == "+ session.getAttribute("uty_id"));
			@SuppressWarnings("unchecked")
			List<Department> result = (List<Department>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Department u : result)
				{
						String dept_name = (String) u.getName();
						Long id =u.getId();
					%>
							<tr>
								<td><% out.println(dept_name);%></td>
								<td><% out.println(id.toString());%></td>
								<td></td>					
							</tr>
						 	
						<!--  -->
						
					<%				
				}
				
			}		
		}
		finally
		{
			pm.close();
		}		
%>                
                			</tbody>
                		</table>
                  </div><!-- .stat --> 
                </div>
                <!-- /widget-content --> 
              </div>
            </div>
          </div>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>
<% } %>
