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
        <li><a href="kbase.jsp"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-book"></i><span>Courses</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#caddModal" data-toggle="modal">Add Courses</a></li>
            <li><a href="#rmCourses" data-toggle="modal">Remove Courses</a></li>
            <li><a href="view_course.jsp">View Courses</a></li>
          </ul>
        </li>			
			<li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-beaker"></i><span>Department</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#myModal" data-toggle="modal">Add Department</a></li>
            <li><a href="#rmModal" data-toggle="modal">Remove Department</a></li>
            <li><a href="view_dept.jsp">View Department</a></li>
          </ul>
        </li>
			<li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-group"></i><span>Student</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="view_students.jsp">View Student</a></li>
          </ul>
        </li>        
        <li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><span>Teacher</span> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="add_tchr.jsp">Add Teacher</a></li>
            <li><a href="faq.html">Remove Teacher</a></li>
            <li><a href="pricing.html">View Teacher</a></li>
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
                                                      		 <form action="add_dept" id="adddept" method="post">
			      																<label>Enter new department name:</label>
			      																	<input type="text" name="dept_name" required placeholder="Department name">
	                                                        </p>
   	                                                   </div>
      	                                                <div class="modal-footer">
         	                                               <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            	                                            <input type="submit" value="Add" class="btn btn-primary"></button>
            	                                          </div>
               	                                       </form>
                                                    </div>
										              			
<!-- Modal -->
                                                    <div id="caddModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="caddModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Add Course</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="add_course" id="addcourse" method="post">
			      													<label>Enter new Course name:</label>
			      													<input type="text" name="course_name" placeholder="Course name" required>			      		
                                                        </p>
			      													<label>Department :</label>
                                                        
			      				<select name="dept_id">
<%
		PersistenceManager pm_add_course = PMF.get().getPersistenceManager();
		int i=0;		
		try
		{
			
			Query q = pm_add_course.newQuery("SELECT FROM com.kbase.app.server.Department WHERE uty_id == " + session.getAttribute("uty_id"));
			@SuppressWarnings("unchecked")
			List<Department> result = (List<Department>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Department d : result)
				{
						i++;
						String u_name = (String) d.getName();
						Long id = d.getId();
						
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
		String check;
		if(i==0)
			check ="disabled";
		else
			check="";
 %>
					</select>
									
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" value="Add" <% out.print(check); %> class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              			
										              													              			
										              			
										              			<!--Delete Modal -->
                                                    <div id="rmModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Remove Department</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="del_dept" method="post">
			      													<label>Select department name:</label>
			      
			      
			      
			      
			      				<select name="dept_del_id">
<%
		PersistenceManager pm_del_dep = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm_del_dep.newQuery("SELECT FROM com.kbase.app.server.Department WHERE uty_id == " + session.getAttribute("uty_id"));
			@SuppressWarnings("unchecked")
			List<Department> result = (List<Department>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Department d : result)
				{
				
						String u_name = (String) d.getName();
						Long id = d.getId();
						
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(u_name);%></option>					
						
					<%				
				}
				
			}		
		}
		finally
		{
			pm_del_dep.close();
		}
 %>
					</select>
									
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" value="Remove" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              
                                            			
										              			<!--Delete Modal -->
                                                    <div id="rmCourses" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="rmModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                                                        <h3 id="myModalLabel">Remove Course</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>
                                                       <form action="del_course" method="post">
			      													<label>Select course name:</label>
			      
			      
			      
			      
			      				<select name="dept_crs_id">
<%
		PersistenceManager pm_del_course = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm_del_course.newQuery("SELECT FROM com.kbase.app.server.Course WHERE uty_id == " + session.getAttribute("uty_id"));
			@SuppressWarnings("unchecked")
			List<Course> result = (List<Course>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.Course c : result)
				{
				
						String c_name = (String) c.getName();
						Long id = c.getId();
						
					%>
					
						<option value="<%	out.print(id.toString());%>"><%	out.println(c_name);%></option>					
						
					<%				
				}
				
			}		
		}
		finally
		{
			pm_del_course.close();
		}
 %>
					</select>
									
			      		
                                                        </p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                        <input type="submit" value="Remove" class="btn btn-primary"></button>
                                                      </div>
                                                      </form>
                                                    </div>
										              
                                   