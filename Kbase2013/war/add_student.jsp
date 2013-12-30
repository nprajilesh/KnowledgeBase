<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,com.kbase.app.server.*,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>
<!DOCTYPE html>

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
        <div class="span12" style="min-height:300px;" >
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Student Enrollment</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <h6 class="bigstats"> </h6>
                  
                  <div id="big_stats" class="cf">
								   
								   <table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Student</th>
										<th>Course</th>
										<th>Approved</th>
									</tr>
								</thead>                			
                			<tbody>
                				  <%
		PersistenceManager pm_add_stud = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm_add_stud.newQuery("SELECT FROM com.kbase.app.server.StudCourse");
			@SuppressWarnings("unchecked")
			List<StudCourse> result = (List<StudCourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.StudCourse u : result)
				{
						
						Long course_id = u.getTeachCourse();
						Long id =u.getId();
						int num = u.getApprove();
						Long student_id = u.getStudent();
						Teachcourse t = pm_add_stud.getObjectById(Teachcourse.class,course_id);
						if(t.getTeacher().equals(session.getAttribute("user_id")))
						{
							Course c = pm_add_stud.getObjectById(Course.class,t.getCourse());
							String course_name = c.getName();
							Student s = pm_add_stud.getObjectById(Student.class,student_id);
							String student_name = s.getname();																				
%>	
							<tr>
								<td><% out.println(student_name + " - " + s.getAdmn());%></td>
								<td><% out.println(course_name);%></td>
								<td>
									<% if(num==0)
											out.println("<a href ='/approvestud?id="+id+"'>Click to approve</a>");
										else
											out.println("Approved");									
									%>
								
								</td>					
														
							</tr>
						 	
						<!--  -->
						
					<%
						}
						
					}
				
			}		
		}
		finally
		{
			pm_add_stud.close();
		}		
%>                
                			</tbody>
                		</table>          
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