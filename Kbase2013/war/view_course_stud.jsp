<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.*,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.*" %>

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
<%@ include file="header_stud.jsp" %>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12" style="min-height:300px;">
          <div class="widget widget-nopad">
            <!-- /widget-header -->
            <div class="widget-content">
          			<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Course</th>
										<th>Approved</th>
									</tr>
								</thead>                			
                			<tbody>
<%
		PersistenceManager pm_a = PMF.get().getPersistenceManager();
		try
		{
			Query q_new = pm_a.newQuery("SELECT FROM com.kbase.app.server.StudCourse  WHERE student_id == " + (Long) session.getAttribute("user_id"));
			@SuppressWarnings("unchecked")
			List<StudCourse> result = (List<StudCourse>) q_new.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.StudCourse u : result)
				{
						
						Long course_id = u.getTeachCourse();
						Long id =u.getId();
						int num = u.getApprove();
						Teachcourse t = pm_a.getObjectById(Teachcourse.class,course_id);
						Course c = pm_a.getObjectById(Course.class,t.getCourse());
						Teacher t_new = pm_a.getObjectById(Teacher.class,t.getTeacher());
						Long check = c.getId();
						String approve ="";
						if(num ==1)
								approve ="Approved";
						else
								approve ="Not Approved";									
%>	
					<tr>
								<td><% out.print(c.getName() + " - " +t_new.getname());%></td>
								<td><% out.print(approve);%></td>					
							</tr>
						 	
					 
						
					<%
									
						
									
				}
				
			}		
		}
		catch(JDOObjectNotFoundException e)
		{
						out.print("Here is the error");
		}
		finally
		{
			pm_a.close();
		}		
%>                
                			</tbody>
                		</table>
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