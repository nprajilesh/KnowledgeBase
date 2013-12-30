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
<%@ include file="header.jsp" %>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12" style="min-height:300px;" >
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3> Teacher Enrollment</h3>
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
										<th>Teacher</th>
										<th>Course</th>
										<th>Approved</th>
									</tr>
								</thead>                			
                			<tbody>
                				  <%
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.Teachcourse");
			@SuppressWarnings("unchecked")
			List<Teachcourse> result = (List<Teachcourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Teachcourse u : result)
				{
						
						Long course_id = u.getCourse();
						Long id =u.getId();
						int num = u.getApprove();
						PersistenceManager pm2 = PMF.get().getPersistenceManager();
						try
						{
							Query q_crse = pm2.newQuery("SELECT FROM com.kbase.app.server.Course");
							@SuppressWarnings("unchecked")
							List<Course> res = (List<Course>) q_crse.execute();
							if(!res.isEmpty())
							{
								
								for(com.kbase.app.server.Course c : res)
								{
									
									PersistenceManager pm3 = PMF.get().getPersistenceManager();
									try
									{
										Query q_cse = pm3.newQuery("SELECT FROM com.kbase.app.server.Teacher");
										@SuppressWarnings("unchecked")
										List<Teacher> res_teach = (List<Teacher>) q_cse.execute();
											if(!res_teach.isEmpty())
											{
												
												for(com.kbase.app.server.Teacher t : res_teach)
												{
													if(t.getId().equals(u.getTeacher()))
													{
														if(c.getId().toString().equals(course_id.toString()))
														{
																String course_name = c.getName();
																String approve ="";
																String teacher_name = t.getname();
																if(num !=1)
																{
																										
%>	
							<tr>
								<td><% out.println(teacher_name);%></td>
								<td><% out.println(course_name);%></td>
								<td><% out.println("<a href ='/approvetchr?id="+id+"'>Click to approve</a>");%></td>					
							</tr>
						 	
						<!--  -->
						
					<%
															}
														}
													}	
												}
											}
									}
									finally
									{
										pm3.close();									
									}
								}
							}
						}
						finally
						{
							pm2.close();
						}
									
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