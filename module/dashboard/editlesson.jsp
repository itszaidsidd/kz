<%@page import="java.io.*"%> 
<%@page import="java.sql.*;"%>
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
			height:91%;
			background-color:#eee;
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
			background-color:rgba(0,0,0,0.3);
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
			background-color:#ccc;
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
			background-color:red;
			width:70px;
			font-size:15px;
		}
		video{
			width:50%;
			//float:right;
		}
	</style>
	<link rel="stylesheet" href="../../css/all.css">
	</head>
	<body>
		<div class=nav><p class="nav-title">Knowledge Zone <small>Admin Area</small><p></div>
		<div class="nav-ver">
			<div class="nav-ver-body">
				<ul>
					<li><a href="../admin.jsp"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>
					<li><a href="course.jsp"><i class="fa-solid fa-book"></i> Courses</a></li>
					<li><a href="lesson.jsp"><i class="fa-solid fa-person-chalkboard"></i> Lessons</a></li>
					<li><a href="students.jsp"><i class="fa-solid fa-users"></i> Students</a></li>
					<li><a href="sellreport.jsp"><i class="fa-solid fa-window-maximize"></i> Sell Report</a></li>
					<li><a href="paymentstatus.jsp"><i class="fa-regular fa-window-maximize"></i> Payment Status</a></li>
					<li><a href="feedback.jsp"><i class="fa-solid fa-wheelchair-move"></i> Feedback</a></li>
					<li><a href="changepassword.jsp"><i class="fa-solid fa-key"></i> Change Password</a></li>
					<li><a href="../../index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="dashboard-body">
			<div class=form>
			<%
				String Id=request.getParameter("id");
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					String q2="select * from lesson where lesson_id="+Id+"";
					ResultSet res1=state.executeQuery(q2);
					if(res1.next()){
							
				%>
				<center><h1>Update Lesson Details</h1></center>
				<form>
					<label>Course ID</label><br>
					<input type=text value="<%out.print(res1.getString("course_id"));%>" name=t1 readonly>
					<label>Course Name</label><br>
					<input type=text value="<%out.print(res1.getString("course_name"));%>" name=t2 readonly>
					<label>Lesson ID</label><br>
					<input type=text value="<%out.print(res1.getString("lesson_id"));%>" name=t5 readonly>
					<label>Lesson Name</label><br>
					<input type=text value="<%out.print(res1.getString("lesson_name"));%>" name=t3 required>
					<label>Lesson Description</label><br>
					<textarea name=t4 required><%out.print(res1.getString("lesson_desc"));%></textarea>
					<video controls>
						<source src="../../<%out.print(res1.getString("lesson_link"));%>">
					</video><br>
					<label>Lesson video Link</label><br>
					<input type=file name=file value="file">
					<center>
					<input type=submit name=submit value=Update>
					</form>
					<form>
					<input type=submit name=close value=Close style="background-color:gray">
					</center>
				</form>
				<%		}
					}
					catch(Exception obj)
					{
						out.write(obj.getMessage());
					}
					String close=request.getParameter("close");
					String submit=request.getParameter("submit");
					String lessonDesc,lessonName,videoLink,path;
					int id;
					
					if("Close".equals(close))
					{response.sendRedirect("lesson.jsp");}
					else if("Update".equals(submit)){
						id=Integer.parseInt(request.getParameter("t5"));
						lessonName=request.getParameter("t3");
						lessonDesc=request.getParameter("t4");
						videoLink=request.getParameter("file");
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							
							path="video\\lessonVideo\\"+videoLink;
							String q="update lesson set lesson_name='"+lessonName+"',lesson_desc='"+lessonDesc+"',lesson_link='"+path+"' where lesson_id="+id+"";
							state.executeUpdate(q);
							%>
							<p style="background-color:#bfb; color:green; padding:10; margin-left:25px;border-radius:5px;width:140px;">Successfully Update</p>	
							<%
						}
						catch(Exception e){
							out.write("Data not filled");
							out.write(e.getMessage());
						}
						
					}
				%>
			</div>
		</div>
	</body>
</html>