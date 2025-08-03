<%@page import="java.sql.*;"%>
<%	String login_email=""; %>
<html>
	<head>
	<style>
		*{
			margin:0;
			padding:0;
			font-family:calibri;
		}
		.nav{
			width:100%;
			background-color:#225470;
			font-family:calibri;
			color:white;
			font-size:2em;
		}
		.nav-title{
			padding:10px;
		}
		.nav-ver{
			width:20%;
			height:70%;
			background-color:#efefef;
			float:left;
		}
		.nav-ver-body{
			padding:30px;
		}
		ul li{
			list-style:none;
			padding:10px;
			width:220px;
		}
		ul li:hover{
		//	background-color:rgba(0,0,0,0.3);
		}
		a{
			text-decoration:none;
			color:#257;
			font-size:17px;
			width:300px;
		}
		.dashboard-body{
			width:80%;
			height:91%;
			//background-color:wheat;
			float:left;
		}
		.fileImage{
			width:300px;
		}
		.profile-pic{
			width:100%;
			height:45%;
			background-color:red;
			border-radius:50%;
			margin-bottom:20px;
		}
		.card{
			margin:50px 30px;
			padding:50px 20px;
			width:80%;
			background-color:#ddd;
			border-radius:7px;
		}
		.course_image{
			width:33%;
			//height:33%;
			float:left;
		}
		.card-body{
			background-color:white;
			padding:20px 0;
			margin:10px 0 0 0;
			height:200px;
		}
		.card-content{
			float:left;
			margin-left:40px;
			
		}
		.card-content p{
			margin:10px 0;
		}
		input[type=submit]{
			padding:7px 12px;
			color:white;
			border-radius:3px;
			background-color:#00f;
			margin:20px 0 0 200px;
			font-size:15px;
			border:1px solid blue;
		}
		.course{
			margin:20px 0;

		}
	</style>
	<link rel="stylesheet" href="../../css/all.css">
	</head>
	<body>
		<div class=nav><p class="nav-title">E-Learning<p></div>
		<div class="nav-ver">
			<%
				String Id=request.getParameter("id");
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					String q4="select * from login";
					ResultSet res=state.executeQuery(q4);
					if(res.next())
					{
						login_email=res.getString("std_email");
					}
					String q2="select * from student where std_email='"+login_email+"'";
					ResultSet res1=state.executeQuery(q2);
					if(res1.next())
					{
							
				%>
				
			<div class="nav-ver-body">
				<img src="../../<%out.print(res1.getString("std_pic"));%>" class="profile-pic">
				<ul>
					<li><a href="profile.jsp"><i class="fa-solid fa-user"></i> Profile</a></li>
					<li style="background-color:rgba(0,0,0,0.3);"><a href="mycourse.jsp"><i class="fa-solid fa-book"></i> My Courses</a></li>
					<li><a href="feedback.jsp"><i class="fa-solid fa-wheelchair-move"></i> Feedback</a></li>
					<li><a href="changepassword.jsp"><i class="fa-solid fa-key"></i> Change Password</a></li>
					<li><a href="../../index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Back</a></li>
				</ul>
			</div>
		</div>
		<div class="dashboard-body">
			<div class=card>
					<center><h1>All Course</h1></center><br>
				<%	}
					String q="select course_order.order_id, course.course_id, course.course_name, course.course_duration, course.course_desc, course.course_img, course.author, course.course_original_price, course.course_price from course_order join course on course.course_id=course_order.course_id where course_order.std_email='"+login_email+"'";
					ResultSet res2=state.executeQuery(q);
					while(res2.next()){
						%>
						<div class=course>
							<h2><%out.print(res2.getString("course_name"));%></h2>
							<div class="card-body">
							<img src="../../<%out.print(res2.getString("course_img"));%>" class="course_image">
							<div class="card-content">
								<p><%out.print(res2.getString("course_desc"));%></p><br>
								<p>Duration: <%out.print(res2.getString("course_duration"));%></p>
								<p>Instructor: <%out.print(res2.getString("author"));%></p>
								<p>Price: <small><s>&#8377 <%out.print(res2.getString("course_original_price"));%></s></small> <b>&#8377 <%out.print(res2.getString("course_price"));%></b></p>
								<form action=lessons.jsp>
								<input type=hidden value="<%out.print(res2.getString("course_id"));%>" name=id>
								<input type=submit value="Watch Course" name=b1>
								</form>
							</div>
						</div><br>
						<hr>
						<%
					}
						
					}
					catch(Exception obj)
					{
						out.write(obj.getMessage());
					}
					
					
				%>
			</div>
		</div>
	</body>
</html>