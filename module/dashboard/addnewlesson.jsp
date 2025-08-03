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
					<li><a href="#"><i class="fa-solid fa-person-chalkboard"></i> Lessons</a></li>
					<li><a href="students.jsp"><i class="fa-solid fa-users"></i> Students</a></li>
					<li><a href="#"><i class="fa-solid fa-window-maximize"></i> Sell Report</a></li>
					<li><a href="#"><i class="fa-regular fa-window-maximize"></i> Payment Status</a></li>
					<li><a href="#"><i class="fa-solid fa-wheelchair-move"></i> Feedback</a></li>
					<li><a href="#"><i class="fa-solid fa-key"></i> Change Password</a></li>
					<li><a href="../../index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="dashboard-body">
			<div class=form>
				<center><h1>Add New Lesson</h1></center>
				<form>
					<label>Course ID</label><br>
					<input type=text value="<%out.print(request.getParameter("course_id"));%>" name=t1 readonly>
					<label>Course Name</label><br>
					<input type=text value="<%out.print(request.getParameter("course_name"));%>" name=t2 readonly>
					<label>Lesson Name</label><br>
					<input type=text name=t3 required>
					<label>Lesson Description</label><br>
					<textarea name=t4 required> </textarea>
					<label>Lesson video Link</label><br>
					<input type=file name=file value="file">
					<center>
					<input type=submit name=submit value=Submit>
					</form>
					<form>
					<input type=submit name=close value=Close style="background-color:gray">
					</center>
				</form>
				<%
					FileInputStream fis = null;
					FileOutputStream fos = null;
					String close=request.getParameter("close");
					String submit=request.getParameter("submit");
					String courseName,lessonDesc,lessonName,videoLink,path;
					int courseId,id;
					
					if("Close".equals(close))
					{response.sendRedirect("lesson.jsp");}
					else if("Submit".equals(submit)){
						courseId=Integer.parseInt(request.getParameter("t1"));
						courseName=request.getParameter("t2");
						lessonName=request.getParameter("t3");
						lessonDesc=request.getParameter("t4");
						videoLink=request.getParameter("file");
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							String q1="select * from lesson order by lesson_id desc";
							ResultSet res=state.executeQuery(q1);
							if(!res.next())
							{
								id=1;
							}
							else{
								id=Integer.parseInt(res.getString("lesson_id"))+1;
							}
							path="video\\lessonVideo\\"+videoLink;
							String q="insert into lesson values("+id+",'"+lessonName+"','"+lessonDesc+"','"+path+"',"+courseId+",'"+courseName+"')";
							state.executeUpdate(q);

								fis = new FileInputStream("C:\\Users\\sss\\Desktop\\kz project files\\video\\"+videoLink);
								fos = new FileOutputStream("webapps\\Project\\kz\\"+path);
					 
								int c;
								while ((c = fis.read()) != -1) {

									fos.write(c);
								}
								//out.print("copied the file successfully");
							
							
							%>
							<p style="background-color:#bfb; color:green; padding:10; margin-left:25px;border-radius:5px;width:190px;">Successfully Add New Lesson</p>	
							<%
						}
						catch(Exception e){
							out.write("Data not filled");
							out.write(e.getMessage());
						}
						finally {
							if (fis != null) {
								fis.close();
							}
							if (fos != null) {
								fos.close();
							}
						}
						
					}
				%>
			</div>
		</div>
	</body>
</html>