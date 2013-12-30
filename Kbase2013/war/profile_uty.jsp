<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.*,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>

<%
    if ((session.getAttribute("email_admin") == null) || (session.getAttribute("email_admin") == ""))  {
			response.sendRedirect("kbase.jsp");
		} else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Dashboard - Bootstrap Admin Template</title>
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
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Welcome to K-base DashBoard</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats">Welcome <%=session.getAttribute("email_admin")%> </h6>
                  <div id="big_stats" class="cf">
                  
		            </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>Profile</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
                
                </thead>
                <tbody>
               <%
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.University WHERE admin_email == '"+ session.getAttribute("email_admin") +"'");
			@SuppressWarnings("unchecked")
			List<University> result = (List<University>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.University u : result)
				{
				
						String u_name = (String) u.getUty_name();
						String u_email = (String) u.getEmail();
						String u_addr = (String) u.getAddr();
						String u_phone = (String) u.getPhone();
						
					%>
					<table class="table table-striped table-bordered" style="border-radius:0;">
						<tbody>
							<tr style="border-radius:0;"	>
								<td>Name</td>
								<td><%	out.println(u_name); %>	</td>
							</tr>
							<tr>
								<td>Address </td>
								<td><%	out.println(u_addr); %>	</td>
							</tr>
							<tr>
								<td>Phone Number</td>
								<td><%	out.println(u_phone); %>	</td>
							</tr>
							<tr>
								<td>Admin Email</td>
								<td><%	out.println(u_email); %>	</td>
							</tr>
						</tbody>					
					</table>
						 	
						
						
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
            </div>
            <!-- /widget-content --> 
          </div>
         
          </div>
          <!-- /widget -->
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->

<%@ include file="footer.jsp" %>
<%
    }
%>