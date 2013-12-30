<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.*,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>
<%    if ((session.getAttribute("email_admin") == null) && (session.getAttribute("email_admin") == "")) {
			response.sendRedirect("kbase.jsp");
		}
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
<%@ include file="header_tchr.jsp" %>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12" style="min-height:300px;">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Add Lectures to 
<% 
	PersistenceManager pm = PMF.get().getPersistenceManager();
			try
			{
				Course c = pm.getObjectById(Course.class,java.lang.Long.parseLong(request.getParameter("add_lecture")));
				String c_name = c.getName();
				out.println(c_name);				
			}
			catch(NumberFormatException e)
			{
				response.sendRedirect("tchr_dash.jsp");			
			}
			
			finally
			{
				pm.close();			
			}
%></h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats"> </h6>
                  
                  <div id="big_stats" class="cf">
                  			<div class="span3">
									<form action="addvideo" method="post">
										<p><input type="text" name="c_name" value="<% try {out.println(java.lang.Long.parseLong(request.getParameter("add_lecture")));}catch(NumberFormatException e){response.sendRedirect("tchr_dash.jsp");} %>" readonly>
										</p><p><input type="text" name="y_name" placeholder="Lecture Name">
										</p><p><input type="text" name="y_link" placeholder = "Youtube Id">
										</p><p><input type="submit" value="Add Lecture" class="btn btn-primary">									
									</form>
									</div>				
									<div class="span6">
										<p>Share your videos to your students easily.Upload your videos to Youtube . And share the Link Here </p>
										<p><img src="img/y_link.png"></p>
									</div>	   
					      <!-- .stat --> 
                  </div>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
        
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
   
%>