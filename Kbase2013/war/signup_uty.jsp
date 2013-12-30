<!DOCTYPE html>
<html lang="en">
  
 <head>
    <meta charset="utf-8">
    <title>Signup - Bootstrap Admin Template</title>

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
						<a href="kbase.jsp" class="">
							<i class="icon-chevron-left"></i>
							Back to Homepage
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container register">
	<div class="content clearfix">
			      		<form action="signup_uty" method="post" id="signup_form">
			      			<h1>Signup for Free Account</h1>
			      			<div class="login-fields">
			      			<p>Create your free account:</p>
			      			<div class="field">
								<label for="uty_name">University Name:</label>
								<input type = "text" name ="uty_name" placeholder="University Name" class="login" required/>
							</div> 	
							<div class="field">
								<label for="admin_email">Admin Email:</label>
								<input type = "email" name ="admin_email" placeholder = "Admin email" class="login" required/>
							</div> 	
							<div class="field">
								<label for="pass1">Password:</label>
								<input type = "password" id="pass1" name = "pass1" placeholder = "Password" class="login" required/>
							</div> 	
							<div class="field">
								<label for="pass2">Confirm Password:</label>
								<input type = "password" id="pass2" name = "pass2" placeholder = "Confirm Password" class="login" required/>
							</div> 	
							<div class="field">
								<label for="uty_addr">College Address:</label>
								<textarea name = "uty_addr" style="min-width:96%;min-height:100px;" class="login" required placeholder= "College address"></textarea>
							</div> 	
							<div class="field">
								<label for="uty_phone">Phone No:</label>
								<input type = "text" name = "uty_phone" placeholder = "Contact number" class="login" required/>
							</div> 	
							</div>
							<div class="login-actions">
								<span class="login-checkbox">
									<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" required tabindex="4" />
									<label class="choice" for="Field">Agree with the Terms & Conditions.</label>
								</span>								
								<input class="button btn btn-primary btn-large"  type ="submit" value = "Register">
							</div> <!-- login-actions -->
				</form>

	</div> <!-- /content -->	
</div> <!-- /account-container -->


<!-- Text Under Box -->
<div class="login-extra">
	Already have an account? <a href="kbase.jsp">Login to your account</a>
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
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#signup_form").validate({
  rules: {
    pass1: "required",
    pass2: {
      equalTo: "#pass1"
    }
	}
	});
});
</script>
</body>

 </html>
