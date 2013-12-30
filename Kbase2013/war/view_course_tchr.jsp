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
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try
		{
			Query q = pm.newQuery("SELECT FROM com.kbase.app.server.Teachcourse WHERE teacher_id == " + (Long) session.getAttribute("user_id"));
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
							Query q_crse = pm.newQuery("SELECT FROM com.kbase.app.server.Course");
							@SuppressWarnings("unchecked")
							List<Course> res = (List<Course>) q_crse.execute();
							if(!res.isEmpty())
							{
								
								for(com.kbase.app.server.Course c : res)
								{
									
									if(c.getId().toString().equals(course_id.toString()))
									{
										Long check = c.getId();
										String course_name = c.getName();
										String approve ="";
										if(num ==1)
											approve ="Approved";
										else
											approve ="Not Approved";									
%>	
							<tr>
								<td><% out.println(course_name);%></td>
								<td><% out.println(approve);%></td>					
							</tr>
						 	
						<!--  -->
						
					<%
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