<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,com.kbase.app.server.*,com.google.appengine.api.users.User,com.google.appengine.api.users.UserService,com.google.appengine.api.users.UserServiceFactory,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>
<!DOCTYPE html>

<%    if ((session.getAttribute("email_admin") != null) && (session.getAttribute("email_admin") != "")) {
			if((session.getAttribute("admin_level")).equals("1"))
				response.sendRedirect("uty_dash.jsp");
			else if((session.getAttribute("admin_level")).equals("2"))
				response.sendRedirect("tchr_dash.jsp");
			else if((session.getAttribute("admin_level")).equals("3"))
				response.sendRedirect("stud_dash.jsp");
			else 
				response.sendRedirect("error.jsp?code=s1");
		}
	else
	{
	UserService userService = UserServiceFactory.getUserService();										
%>

<html lang="en">
<head>
<meta charset="utf-8">
<title>Welcome to Knowledge Base</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<link href="css/pages/plans.css" rel="stylesheet"> 

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
                    <a class="brand" style ="text-transform:uppercase;" href="">Knowledge Base </a>
      
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">
	      		
	      		<div class="widget">
						
					
					<div class="widget-content">
						
						<div class="pricing-plans plans-3">
							
						<div class="plan-container" >
					        <div class="plan" >
						        <div class="plan-header">
					                
						        	<div class="plan-price">
					                	<span class="term"><h1 style="text-transform:uppercase;">Students</h1></span>
									</div> 
						        </div> <!-- /plan-header -->	        
						        
						        <div class="plan-features"style="min-height:350px;">
									<ul>
										<img src="img/student.jpg" style="border:0; width:90%; margin:10%;margin-bottom:-3.2%;" />
									
									</ul>
								</div> <!-- /plan-features -->
								
								<div class="plan-actions">				
									<a href="login_stud" class="btn">Login Now</a>				
								</div> <!-- /plan-actions -->
					
							</div> <!-- /plan -->
					    </div> <!-- /plan-container -->
					    
					    
					    
					    <div class="plan-container">
					        <div class="plan green">
						        <div class="plan-header">
					                
						            <div class="plan-price">
					                	<span class="term"><h1 style="text-transform:uppercase;">Universities</h1></span>
									</div> <!-- /plan-price -->
									
						        </div> <!-- /plan-header -->	          
						        
						        <div class="plan-features" style="min-height:350px;">
									<ul>		
									<img src="img/uty.jpg" style="border:0; width:60%;margin-left:20%;margin-bottom:-3.2%;" />
									<form action="login_uty" method="post" id="login_form">
										<li><label>Email</label><input type="email" id="field" name="username" placeholder="Email" required></li>
										<li><label>Password</label><input type="password" name="pass" placeholder="Password" required></li>								
									</ul>
								</div>
								<div class="plan-actions">			<a href ="signup_uty.jsp" style="position:absolute;right:25px;margin-top:17px;">Not registered Yet ??? </a>		
									<input type="submit" style="padding:16px;" class= "btn btn-primary" value="Login now">	
			      					
								</div> 								
								
			      		</form>									
								<!-- /plan-actions -->
						
							</div> <!-- /plan -->
					    </div> <!-- /plan-container -->
					    
					    <div class="plan-container">
					        <div class="plan">
						        <div class="plan-header">
					                
						            <div class="plan-price">
					                	<span class="term"><h1 style="text-transform:uppercase;">Teachers</h1></span>
									</div>  <!-- /plan-price -->
									
						        </div> <!-- /plan-header -->	       
						        
						        <div class="plan-features" style="min-height:350px;">
									<ul>
									<img src="img/teacher.jpg" style="border:0; width:80%; margin:10%;margin-bottom:-3.2%;" />
										
									</ul>
								</div> <!-- /plan-features -->
								
								<div class="plan-actions">				
									<a href="login_tchr" class="btn" style="backgroud:url('./img/sign-in-with-google.png');">Login Now</a>				
								</div> <!-- /plan-actions -->
					
							</div> <!-- /plan -->
							
					    </div> <!-- /plan-container -->
				
				
					</div> <!-- /pricing-plans -->
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->					
				
		    </div> <!-- /span12 -->     	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->
<!-- /main -->
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
<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="js/jquery-1.7.2.min.js"></script> 
<script src="js/excanvas.min.js"></script> 
<script src="js/bootstrap.js"></script>

<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#login_form").validate();
});
</script>
</body>
</html>
<%
}
%>