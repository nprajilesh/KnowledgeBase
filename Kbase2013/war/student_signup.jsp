<%@ page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.University,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory" %>


<% 
UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		
if(user == null)
		response.sendRedirect("kbase.jsp");
%>
<!DOCTYPE html>
<html lang="en">
  
 <head>
    <meta charset="utf-8">
    <title>Student Signup</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">

</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="brand" href="kbase.jsp">
				Knowledge Base				
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="">						
						<a href="" class="">
							<% out.println(user.getNickname());%>
						</a>
						
					</li>
					<li class="">						
						<a href="logout.jsp" class="">
							<i class="icon-chevron-left"></i>
								Logout
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->
<div class="account-container register">
	<div class="content clearfix">
			      		<form action="signup_student" id="signup_student" method="post">
			      			<h1>Signup for Free Account</h1>
			      			<div class="login-fields">
			      			<p>Create your free account:</p>
			      
			
<%
		PersistenceManager pm = PMF.get().getPersistenceManager();
   
 		try
		{
	%>   <select name="college" style="width:100%" required> <%
			 				
					
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.University ");
			@SuppressWarnings("unchecked")
			List<University> result = (List<University>) q.execute();
			if(!result.isEmpty())
			{
				for(com.kbase.app.server.University u : result)
				{
		
						String u_name = (String) u.getUty_name();
						String u_email = (String) u.getEmail();
						Long u_id = u.getId();
					%>
					
						<option value="<%	out.print(u_id); %>"><% out.println(" "+ u_name);%></option>					
						
					<%				
				}
				
			}		
		}
		finally
		{
			pm.close();
		}
 %>
					</select>
			
			      			
			      		<div class="field">
								<label for="student_name">Student Name:</label>
								<input type = "text"  required name ="student_name" placeholder="Student Name" value = "<% out.print(user.getNickname()); %>"class="login" />
							</div> 	
							<div class="field">
								<input type = "email"  required name ="student_email" placeholder = "Student email"  readonly value = "<% out.print(user.getEmail()); %>" class="login"/>
							</div> 	
							<div class="field">
								<input type = "text"  required name ="student_phone" placeholder = "Contact number" class="login"/>
							</div> 	
							<div class="field" style="">
								<input type = "text"  required name = "admn_no" placeholder = "Admission number" class="login"/>
							</div> 	
							<div class="field">
								<textarea name = "student_addr"  required style="min-width:96%;min-height:100px;" class="login" placeholder="Student Address"></textarea>
							</div> 	
							</div>
							<div class="login-actions">
							 <span class="login-checkbox">
									<input id="Field" name="Field"  required type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
									<label class="choice" for="Field">Agree with the Terms & Conditions.</label>
								</span>								
							  <input class="button btn btn-primary btn-large" type ="submit" value = "Register">
							</div> <!-- login-actions -->
				</form>
				
		
	</div> <!-- /content -->	
</div> <!-- /account-container -->
<!-- Text Under Box -->
<div class="login-extra">
	Already have an account? <a href="login.html">Login to your account</a>
</div> <!-- /login-extra -->
		  
<div class="extra">
  <div class="extra-inner">
    <div class="container">
      <div class="row">
                    <div class="span3">
                        <h4>
                            About Knowledge Base</h4>
                        <ul>
                            <li><a href="javascript:;">Dsignerwall.com</a></li>
                            <li><a href="javascript:;">Web Development Resources</a></li>
                            <li><a href="javascript:;">Responsive HTML5 Portfolio Templates</a></li>
                            <li><a href="javascript:;">Free Resources and Scripts</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Support</h4>
                        <ul>
                            <li><a href="javascript:;">Frequently Asked Questions</a></li>
                            <li><a href="javascript:;">Ask a Question</a></li>
                            <li><a href="javascript:;">Video Tutorial</a></li>
                            <li><a href="javascript:;">Feedback</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Something Legal</h4>
                        <ul>
                            <li><a href="javascript:;">Read License</a></li>
                            <li><a href="javascript:;">Terms of Use</a></li>
                            <li><a href="javascript:;">Privacy Policy</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                    <div class="span3">
                        <h4>
                            Open Source jQuery Plugins</h4>
                        <ul>
                            <li><a href="http://www.egrappler.com">Open Source jQuery Plugins</a></li>
                            <li><a href="http://www.egrappler.com;">HTML5 Responsive Tempaltes</a></li>
                            <li><a href="http://www.egrappler.com;">Free Contact Form Plugin</a></li>
                            <li><a href="http://www.egrappler.com;">Flat UI PSD</a></li>
                        </ul>
                    </div>
                    <!-- /span3 -->
                </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /extra-inner --> 
</div>
<!-- /extra -->
<div class="footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2013 <a href="">Knowldege Base</a>. </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 

<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#signup_student").validate();
 });
</script>
</body>

 </html>
