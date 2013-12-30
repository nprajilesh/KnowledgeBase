<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,com.kbase.app.server.University,com.kbase.app.server.Course,com.kbase.app.server.Department,java.io.PrintWriter,javax.jdo.JDOHelper,javax.jdo.PersistenceManager,javax.jdo.PersistenceManagerFactory,com.kbase.app.server.PMF,java.util.List,javax.jdo.Query" %>
<%
    if ((session.getAttribute("email_admin") == null) || (session.getAttribute("email_admin") == "")) 
			response.sendRedirect("kbase.jsp");
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
 <link href="js/guidely/guidely.css" rel="stylesheet"> 

<link href="css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<%@ include file="header_stud.jsp" %>
<div class="main" >
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="widget widget-nopad">
            <!-- /widget-header -->
            <div class="widget-content" style="border-radius:0;min-height:300px;">
          		<% out.println(session.getAttribute("user_id")); out.println(session.getAttribute("email_admin") ); %>
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
<script src="js/base.js"></script>

<script>
$(function () {
	
	guidely.add ({
		attachTo: '#target-1'
		, anchor: 'top-left'
		, title: 'DashBoard'
		, text: 'Click here to get important information at a glance'
	});
	
	guidely.add ({
		attachTo: '#target-2'
		, anchor: 'top-left'
		, title: 'Course'
		, text: 'You can select courses of your college here and wait for admin approval '
	});
	
	guidely.add ({
		attachTo: '#target-3'
		, anchor: 'top-left'
		, title: 'Sharing Lectures made easy'
		, text: 'Add lectures to the courses you are teaching. <br/>Upload to youtube and share the link. <br /><img src="img/y_link.png">'
	});
	guidely.init ({ welcome: true, startTrigger: true });


});

</script>
