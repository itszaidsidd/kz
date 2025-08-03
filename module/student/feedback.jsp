<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.*"%> 
<%@page import="javax.imageio.ImageIO"%>
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
			//background-color:rgba(0,0,0,0.3);
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
		.form{
			width:60%;
			margin:20px 0 0 10px;
			//background-color:#ccc;
			border-radius:5px;
			padding:30px;
			//height:100%;
		}
		form{
			display:inline;
		}
		input[type=text],textarea{
			width:100%;
			font-size:17px;
			padding:7px;
			border-radius:5px;
			margin:10px 0 20px 0;
			border:1px solid gray;
		}
		
		input[type=submit]{
			padding:5px;
			color:white;
			border-radius:5px;
			background-color:blue;
			width:70px;
			font-size:15px;
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
					<li><a href="mycourse.jsp"><i class="fa-solid fa-book"></i> My Courses</a></li>
					<li style="background-color:rgba(0,0,0,0.3);"><a href="feedback.jsp"><i class="fa-solid fa-wheelchair-move"></i> Feedback</a></li>
					<li><a href="changepassword.jsp"><i class="fa-solid fa-key"></i> Change Password</a></li>
					<li><a href="../../index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Back</a></li>
				</ul>
			</div>
		</div>
		<div class="dashboard-body">
			<div class=form>
					<form>
						<label>Student Id</label>
						<input type=text name=id value="<%out.print(res1.getString("std_id"));%>" readonly style="background-color:rgba(108, 97, 97, 0.2);">
						<textarea name=t1 required></textarea><br>
						<input type=submit name=submit value=Submit>
					</form>
				<%		}
						String submit=request.getParameter("submit");
						if("Submit".equals(submit))
						{
							int id;
							int std_id=Integer.parseInt(request.getParameter("id"));
							String feedback_text=request.getParameter("t1");
							String q1="select * from feedback order by f_id desc";
							res1=state.executeQuery(q1);
							if(!res1.next())
							{
								id=1;
							}
							else{
								id=Integer.parseInt(res1.getString("f_id"))+1;
							}
							String q="insert into feedback values("+id+",'"+feedback_text+"',"+std_id+")";
							state.executeUpdate(q);
							%>
							<p style="background-color:#bfb; color:green; padding:10; margin:25px;border-radius:5px;width:240px;">Submitted Successfully</p>	
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