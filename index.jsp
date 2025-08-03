<%	boolean std_login=false;
	String login_email=""; 
%>
<% 
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
		Statement state=con.createStatement();
		String q5="delete from admin_login";
		state.executeUpdate(q5);
		String q4="select * from login";
		ResultSet res1=state.executeQuery(q4);
		if(res1.next())
		{
			std_login=true;
			login_email=res1.getString("std_email");
		}
		else
		{
			std_login=false;
		}
	}
	catch(Exception e)
	{
		out.write(e.getMessage());
	}
 %>
<html>
	<head>
		<title>Knowledge Zone</title>
		<link rel="stylesheet" href="css/all.css">
		<link rel="stylesheet" href="css/main.css">
	</head>
	<body>
		<div class="nav">
			<div class="nav-brand">Knowledge Zone
			<span class="sub-title">Learn and Implement</span>
			</div>
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="module/courses.jsp">Courses</a></li>
				<li><a href="module/payment_status.jsp">Payment Status</a></li>
				<%
				if(std_login)
				{%>
				<li><a href="module/student/profile.jsp">My Profile</a></li>
				<li><a href="#"><form style="display:inline"><input type=submit name=logout value=Logout class=logout></form></a></li>
				<%
					String r=request.getParameter("logout");
					if("Logout".equals(r))
					{
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							String q4="delete from login";
							state.executeUpdate(q4);
							response.sendRedirect("index.jsp");
						}
						catch(Exception e)
						{
							out.write(e.getMessage());
						}
						
					}
				}
				if(!std_login)
				{%>
				<li><a href="#" id="login">Login</a></li>
				<li><a href="#" class="sign-up">Sign up</a></li>
				<%
				}%>
				<li><a href="#">Feedback</a></li>
				<li><a href="#">Contact</a></li>
			</ul>

		</div>
		
		<div class="container">
			<video playsinline autoplay muted loop>
				<source src="video/video2.mp4">
			</video>
			<div class="vid-overlay">
			</div>
			<div class="vid-content">
				<h1 class="vid-title">Welcome to Knowledge Zone</h1><br>
				<small class="vid-sub-title">Learn and Implement</small><br>
				<%
				if(std_login)
				{%>
				<a href="module/student/profile.jsp" class="a"><button style="background-color:#0a0">My Profile</button></a>
				<%}
				if(!std_login)
				{%>
				<a href="#" id="signup" class="a"><button>Get Started</button></a>
				<%}%>
			</div>
		</div>
		
		
		<div class="row-bottom">
			<div class="row-bottom-banner">
				<h5><i class="fa-solid fa-book-open icon"></i>  100+ Online Courses</h5>
				<h5><i class="fa-solid fa-chalkboard-user icon"></i>  Expert Instructors</h5>
				<h5><i class="fa-regular fa-keyboard icon"></i>  Lifetime Access</h5>
				<h5><i class="fa-solid fa-indian-rupee-sign icon"></i>  Money Back Guarnted</h5>
			</div>	
		</div>
		<br>
		<h1><center>Popular Courses</center></h1>
		<div class="courses">
		
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="select * from course";
				ResultSet res=state.executeQuery(q);
				for(int i=1;res.next() && i<=6;i++)
				{
					%>
					<div class="card" style="border:1px solid rgba(0,0,0,0.5);margin:15px 14px;">
						<img src="<%out.print(res.getString("course_img"));%>" class="card-image">
						<div id="card-body">
							<h3 class="card-title"><%out.print(res.getString("course_name"));%></h3>
							<p class="card-text" style="height:60px"><%out.print(res.getString("course_desc"));%></p>
						</div>
						<div class="card-footer">
						<h4 class="card-price">Price : <small><s>&#8377 <%out.print(res.getString("course_original_price"));%></s></small> &#8377 <%out.print(res.getString("course_price"));%></h4>
						<form action="module/coursedetails.jsp" style="display:inline">
						<input type=hidden value="<%out.print(res.getString("course_id"));%>" name=id>
						<input type="submit" value="Enroll" id="card-btn">
						</form>
						</div>
					</div>
					<%
				}
			}
			catch(Exception e)
			{
				out.write(e.getMessage());
			}
		%>
			<div class="all-course">
				<center><a href="module/courses.jsp"><button>View All Courses</button></a></center>
			</div>
		</div>
		<div class="contact">
			<center><h1>Contact US</h1></center>
			<div class="contact-form">
				<form>
					<input type="text" name="contact-name" placeholder="Name">
					<input type="text" name="contact-subject" placeholder="Subject">
					<input type="text" name="contact-email" placeholder="E-mail">
					<textarea name="contact-area" placeholder="How can we help you?"></textarea>
					<input type="submit" value="Send" name="send" style="display:block; float:left">
				</form>
			</div>
			<div class="contact-add">
				<h4>Knowledge Zone</h4>
				<p>Knowledge Zone, near Meenakhi Chowk,<br>
					Muzaffarnagar - 251002<br>
					Phone: +91 8126648616<br></p>
			</div>
		</div>
		
		<div class="feedback-content" style="height:300px;">
			<center><h1>Student's Feedback</h1></center>
			<div class="feedback-box">
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q1="select std_name, std_occ, std_pic, f_content from student join feedback on student.std_id=feedback.std_id"; 
				ResultSet res2=state.executeQuery(q1);
				while(res2.next())
				{
					%>
					<div class="feedback" style="float:left;">
						<p class="feedback-text" style="padding:5px;height:40px"><%out.print(res2.getString("f_content"));%></p>
						<img src="<%out.print(res2.getString("std_pic"));%>" class="std-pic">
						<h3 style="color:yellow" id="std-name"><%out.print(res2.getString("std_name"));%></h3>
						<p id="std-des"><%out.print(res2.getString("std_occ"));%></p>
					</div>
					<%
				}
			}
			catch(Exception e)
			{
				out.write(e.getMessage());
			}
				
		%>
			</div>
		</div>
			<div class="row-footer">
				<div class="contact-footer">
					<h5><a href="#" class="cont-footer"><i class="fa-brands fa-facebook-f"></i> Facebook</a></h5>
					<h5><a href="#" class="cont-footer"><i class="fa-brands fa-square-x-twitter"></i> Twitter</a></h5>
					<h5><a href="#" class="cont-footer"><i class="fa-brands fa-whatsapp"></i> WhatsApp</a></h5>
					<h5><a href="#" class="cont-footer"><i class="fa-brands fa-instagram"></i> Instagram</a></h5>
				</div>	
			</div>
		
		<table style="width:70%; text-align:center;margin:20px auto 20px 10%;">
			<tr>
				<th>About Us</th>
				<th>Category</th>
				<th>Contact Us</th>
			</tr>
			<tr>
				<td style="vertical-align:top">Knowledge Zone provides universal access to the world's<br>
					best education partinering with top universities<br>
					and organizationsto offer courses online.
				</td>
				<td>Web Development<br>Web Designing<br>Android App Dev<br>IOS Development<br>DataAnalysis
				</td>
				<td style="vertical-align:top">K.Z. Institute<br>Near Meenakshi Chowk<br>Muzaffarnagar,UP<br>Ph. 8126648616
				</td>
			</tr>
		</table>
		<div class="admin-footer">Copyright &copy 2024 || Designed By Zaid Siddiqui || <a href="#" id="admin">
		Admin Login
		</a></div>
		
		

		<div class="get-start-popup">
			<%@ include file="module/_popup.jsp"%>
		</div>
		
		<script src="js/navjs.js"></script>
	
	</body>
</html>