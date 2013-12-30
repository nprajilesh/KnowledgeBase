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
            <li><a href="view_course_stud.jsp">My courses</a></li>
          </ul>
        </li>			
			<li id="target-3" class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-beaker"></i><span>Lectures</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#viewLectures" data-toggle="modal">View Lectures</a></li>
          </ul>
        </li>
			<li id="target-4" class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-group"></i><span>Presentation</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
             <li><a href="#viewPresentation" data-toggle = "modal">View all Presentations</a></li>
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
                                                    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Add Department</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="add_dept" method="post">
			      													<label>Enter new department name:</label>
			      													<input type="text" name="dept_name" placeholder="Department name">
																	
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" value="Add" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              			
<!-- Modal -->
                                                    <div id="eaddModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="caddModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Teach new Course</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="enrol_course" method="post">
			      													<label>Select the course to teach :</label>
                                                        
			      				<select name="course_id">
<%
		PersistenceManager pm_view_stud_course = PMF.get().getPersistenceManager();
		int crs_id_new = 0;		
		try
		{
			Query q = pm_view_stud_course.newQuery("SELECT FROM com.kbase.app.server.Teachcourse WHERE uty_id == " + session.getAttribute("uty_id"));
			q.setFilter("approved == 1");			
			@SuppressWarnings("unchecked")
			List<Teachcourse> result = (List<Teachcourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Teachcourse c : result)
				{
						Long teach_id = c.getTeacher();
						Long id = c.getId();
						Long course_id = c.getCourse();
						PersistenceManager pm_v_stud = PMF.get().getPersistenceManager();
						try
						{
							Teacher t = pm_v_stud.getObjectById(Teacher.class,teach_id);
							Course c_new = pm_v_stud.getObjectById(Course.class,course_id);
							if(c_new.getDept().equals(session.getAttribute("dept_id")))
							{
								crs_id_new++;
								
					%>
					
						<option value="<%	out.print(id);%>">  <%	out.println(t.getname()+" - "+c_new.getName()); %></option>					
						
					<%		
							}
						}
						finally
						{
							pm_v_stud.close();						
						}		
				}
				
			}		
		}
		finally
		{
			pm_view_stud_course.close();
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
                                                       <form action="view_videos_stud.jsp" method="get">
			      													<label>Select Course name:</label>
			      
			      
			      
			      <input type="text" name="tchr" style="display:none;" value="<% out.print(session.getAttribute("user_id"));%>" readonly>
			      				<br><select name="crs">
<%
		int view_pres = 0;
		PersistenceManager pm_view_lecture = PMF.get().getPersistenceManager();
		try
		{
			Long t_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());
			Query q = pm_view_lecture.newQuery("SELECT FROM com.kbase.app.server.StudCourse");
			q.setFilter("student_id == " + t_id + " && approved == 1");		
			@SuppressWarnings("unchecked")
			List<StudCourse> result = (List<StudCourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.StudCourse t : result)
				{
					view_pres++;
					Teachcourse t_new = pm_view_lecture.getObjectById(Teachcourse.class,t.getTeachCourse());
					Course c = pm_view_lecture.getObjectById(Course.class, t_new.getCourse());
					Teacher t_newest = pm_view_lecture.getObjectById(Teacher.class,t_new.getTeacher());
					String c_name = c.getName();
					String t_name = t_newest.getname();
					
					%>
					
						<option value="<%	out.print(t_new.getId());%>"><%	out.println(c_name + " - " +t_name); %></option>					
						
					<%
					
									
				}
				
			}		
		}
		finally
		{
			pm_view_lecture.close();
		}
		String view_pre;
		if(view_pres == 0)
			view_pre="disabled";
		else
			view_pre="";
 %>
					</select>
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" <% out.print(view_pre); %> value="Submit" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              
                                            			
<!--View Lectures-->
                                                    <div id="viewPresentation" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">View Lectures</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="view_presentation_stu.jsp" method="get">
			      													<label>Select Course name:</label>
			      
			      
			      
			      <input type="text" name="tchr" style="display:none;" value="<% out.print(session.getAttribute("user_id"));%>" readonly>
			      				<br><select name="crs">
<%
		int view_lec = 0;
		PersistenceManager pm_view_present = PMF.get().getPersistenceManager();
		try
		{
			Long t_id = java.lang.Long.parseLong(session.getAttribute("user_id").toString());
			Query q = pm_view_present.newQuery("SELECT FROM com.kbase.app.server.StudCourse");
			q.setFilter("student_id == " + t_id + " && approved == 1");		
			@SuppressWarnings("unchecked")
			List<StudCourse> result = (List<StudCourse>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.StudCourse t : result)
				{
					view_lec++;
					Teachcourse t_new = pm_view_present.getObjectById(Teachcourse.class,t.getTeachCourse());
					Course c = pm_view_present.getObjectById(Course.class, t_new.getCourse());
					Teacher t_newest = pm_view_present.getObjectById(Teacher.class,t_new.getTeacher());
					String c_name = c.getName();
					String t_name = t_newest.getname();
					
					%>
					
						<option value="<%	out.print(t_new.getId());%>"><%	out.println(c_name + " - " +t_name); %></option>					
						
					<%
					
									
				}
				
			}		
		}
		finally
		{
			pm_view_present.close();
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
										              
                            