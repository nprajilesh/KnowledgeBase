<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.*,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>

   
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="kbase.jsp">Knowledge Base</a>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Account <b class="caret"></b></a>
            <ul class="dropdown-menu" style="border-radius:0;">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;">Help</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> <%=session.getAttribute("email_admin")%><b class="caret"></b></a>
            <ul class="dropdown-menu" style="border-radius:0;">
              <li><a href="profile_uty.jsp">Profile</a></li>
              <li><a href="logout.jsp">Logout</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-search pull-right">
          <input type="text" class="search-query" style="border-radius:0;" placeholder="Search">
        </form>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li id="target-1"><a href="kbase.jsp"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li id="target-2" class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-book"></i><span>Courses</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#eaddModal" data-toggle="modal">Enroll Here</a></li>
            <li><a href="view_course_tchr.jsp">My courses</a></li>
          </ul>
        </li>			
			<li id="target-3" class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-beaker"></i><span>Lectures</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#addLectures" data-toggle="modal">Add Lectures</a></li>
            <li><a href="#viewLectures" data-toggle="modal">View all Lectures</a></li>
          </ul>
        </li>
			<li id="target-4" class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-group"></i><span>Presentation</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#addPresentation" data-toggle = "modal">Add Presentation</a></li>
            <li><a href="#viewPresentation" data-toggle = "modal">View all Presentations</a></li>
          </ul>
        </li>        
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Student</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="add_student.jsp">Approve Students</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->
													           
										              			
<!-- Modal -->
                                                    <div id="eaddModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="caddModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Teach new Course</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="teach_course" method="post">
			      													<label>Select the course to teach :</label>
                                                        
			      				<select name="course_id">
<%
		PersistenceManager pm_add_course = PMF.get().getPersistenceManager();
		int crs_id_new = 0;		
		try
		{
			Query q = pm_add_course.newQuery("SELECT FROM com.kbase.app.server.Course WHERE dept_id == " + session.getAttribute("dept_id"));
			@SuppressWarnings("unchecked")
			List<Course> result = (List<Course>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Course c : result)
				{
						crs_id_new++;
						String u_name = (String) c.getName();
						Long id = c.getId();
						
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(u_name);%></option>					
						
					<%				
				}
				
			}		
		}
		finally
		{
			pm_add_course.close();
		}
		String s_crs;
		if(crs_id_new == 0)
			s_crs = "disabled";
		else
			s_crs = "";
 %>
					</select>
									
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" <% out.print(s_crs); %>value="Add" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              			
										              													              			
										              			
										              			<!--View Lectures-->
                                                    <div id="viewLectures" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">View Lectures</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="view_videos.jsp" method="get">
			      													<label>Select Course name:</label>
			      
			      
			      
			      <input type="text" name="tchr" style="display:none;" value="<% out.print(session.getAttribute("user_id"));%>" readonly>
			      				<br><select name="crs">
<%
		int view_lec = 0;
		PersistenceManager pm_view_lecture = PMF.get().getPersistenceManager();
		try
		{
			Long t_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());
			Query q = pm_view_lecture.newQuery("SELECT FROM com.kbase.app.server.Teachcourse");
			q.setFilter("teacher_id == " + t_id + " && approved == 1");		
			@SuppressWarnings("unchecked")
			List<Teachcourse> result = (List<Teachcourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Teachcourse t : result)
				{
					view_lec++;
					PersistenceManager pm_view_lec_course = PMF.get().getPersistenceManager();
					try
					{					
						Course c = pm_view_lec_course.getObjectById(Course.class, t.getCourse());
						String c_name = c.getName();
						Long id = c.getId();
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(c_name);%></option>					
						
					<%
					}
					finally
					{
						pm_view_lec_course.close();					
					}				
				}
				
			}		
		}
		finally
		{
			pm_view_lecture.close();
		}
		String view;
		if(view_lec == 0)
			view="disabled";
		else
			view="";
 %>
					</select>
									
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" <% out.print(view); %> value="Submit" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              
                                            			
										              			<!--Add Lectures -->
                                                    <div id="addLectures" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Add Lecture</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="addvideo.jsp" method="get">
			      													<label>Select course name:</label>
			      
			      
			      
			      
			      				<select name="add_lecture">
<%
		int add_lec =0;
		PersistenceManager pm_add_lecture = PMF.get().getPersistenceManager();
		try
		{
			Long t_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());
			Query q = pm_add_lecture.newQuery("SELECT FROM com.kbase.app.server.Teachcourse");
			q.setFilter("teacher_id == " + t_id + " && approved == 1");		
			@SuppressWarnings("unchecked")
			List<Teachcourse> result = (List<Teachcourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Teachcourse t : result)
				{
					add_lec++;
					PersistenceManager pm_add_lec_course = PMF.get().getPersistenceManager();
					try
					{					
						Course c = pm_add_lec_course.getObjectById(Course.class, t.getCourse());
						String c_name = c.getName();
						Long id = c.getId();
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(c_name);%></option>					
						
					<%
					}
					finally
					{
						pm_add_lec_course.close();					
					}				
				}
				
			}		
		}
		finally
		{
			pm_add_lecture.close();
		}
		String add="";
		if(add_lec ==0)
			add = "disabled";
 %>
					</select>
									
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" <% out.print(add); %> value="Submit" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
                                                    
                                                    <!--Add Lectures -->
                                                    <div id="addPresentation" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Add Presentation</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="addpresentation.jsp" method="get">
			      													<label>Select course name:</label>
			      
			      
			      
			      
			      				<select name="add_presentation">
<%
		int add_present = 0;
		PersistenceManager pm_add_presentation = PMF.get().getPersistenceManager();
		try
		{
			Long t_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());
			Query q = pm_add_presentation.newQuery("SELECT FROM com.kbase.app.server.Teachcourse");
			q.setFilter("teacher_id == " + t_id + " && approved == 1");		
			@SuppressWarnings("unchecked")
			List<Teachcourse> result = (List<Teachcourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Teachcourse t : result)
				{
					add_present++;
					PersistenceManager pm_add_present_course = PMF.get().getPersistenceManager();
					try
					{					
						Course c = pm_add_present_course.getObjectById(Course.class, t.getCourse());
						String c_name = c.getName();
						Long id = c.getId();
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(c_name);%></option>					
						
					<%
					}
					finally
					{
						pm_add_present_course.close();					
					}				
				}
				
			}		
		}
		finally
		{
			pm_add_presentation.close();
		}
		String add_pres ="";
		if(add_present == 0)
			add_pres ="disabled";
 %>
					</select>
									
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" <% out.print(add_pres); %> value="Submit" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              
                                   	<!--View Presentation-->
                                                    <div id="viewPresentation" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">View Presentation</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="view_presentations.jsp" method="get">
			      													<label>Select Course name:</label>
			      
			      
			      
			      <input type="text" name="tchr" style="display:none;" value="<% out.print(session.getAttribute("user_id"));%>" readonly>
			      				<br><select name="crs">
<%
		int pm_view =0;
		PersistenceManager pm_view_presentation = PMF.get().getPersistenceManager();
		try
		{
			Long t_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());
			Query q = pm_view_presentation.newQuery("SELECT FROM com.kbase.app.server.Teachcourse");
			q.setFilter("teacher_id == " + t_id + " && approved == 1");		
			@SuppressWarnings("unchecked")
			List<Teachcourse> result = (List<Teachcourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Teachcourse t : result)
				{
					pm_view++;
					PersistenceManager pm_view_pre_course = PMF.get().getPersistenceManager();
					try
					{					
						Course c = pm_view_pre_course.getObjectById(Course.class, t.getCourse());
						String c_name = c.getName();
						Long id = c.getId();
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(c_name);%></option>					
						
					<%
					}
					finally
					{
						pm_view_pre_course.close();					
					}				
				}
				
			}		
		}
		finally
		{
			pm_view_presentation.close();
		}
		String pm_string ="";
		if(pm_view ==0)
			pm_string = "disabled";
 %>
					</select>
									
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" <% out.print(pm_string); %> value="Submit" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              
                                            			