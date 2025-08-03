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
		input[type=text],input[type=email]{
			width:100%;
			font-size:17px;
			padding:7px;
			border-radius:5px;
			margin:10px 0;
			border:1px solid gray;
		}
		input[type=file]{
			margin:10px 0;
			//font-size:17px;
			border-radius:5px;
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
					<li style="background-color:rgba(0,0,0,0.3);"><a href="profile.jsp"><i class="fa-solid fa-user"></i> Profile</a></li>
					<li><a href="mycourse.jsp"><i class="fa-solid fa-book"></i> My Courses</a></li>
					<li><a href="feedback.jsp"><i class="fa-solid fa-wheelchair-move"></i> Feedback</a></li>
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
						<label>E-mail</label><br>
						<input type=email name=email value="<%out.print(res1.getString("std_email"));%>" readonly style="background-color:rgba(108, 97, 97, 0.2);">
						<label>Name</label><br>
						<input type=text name=t1 value="<%out.print(res1.getString("std_name"));%>" required>
						<label>Occupation</label><br>
						<input type=text name=t2 value="<%out.print(res1.getString("std_occ"));%>">
						<label>Course Image</label>
						<input type=file name=file value="file"><br>
						<input type=submit name=submit value=Update>
					</form>
				<%		}
						String submit=request.getParameter("submit");
						if("Update".equals(submit))
						{
							int id=Integer.parseInt(request.getParameter("id"));
							String name=request.getParameter("t1");
							String occ=request.getParameter("t2");
							String profilePic=request.getParameter("file");
							String path="images\\studentImage\\"+profilePic;
							
							String q="update student set std_name='"+name+"', std_occ='"+occ+"', std_pic='"+path+"' where std_id="+id+"";
							state.executeUpdate(q);
							
							BufferedImage image = null; 
							FileInputStream input_file = new FileInputStream("C:\\Users\\sss\\Desktop\\kz project files\\"+profilePic); 
							image = ImageIO.read(input_file);  
							FileOutputStream output_file = new FileOutputStream("webapps\\Project\\kz\\images\\studentImage\\"+profilePic); 
							ImageIO.write(image, "png", output_file); 
							
							
							response.sendRedirect("profile.jsp");
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