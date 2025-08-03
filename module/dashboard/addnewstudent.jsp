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
				<center><h1>Add New Student</h1></center>
				<form>
					<label>Student Name</label><br>
					<input type=text name=t1 required>
					<label>Email</label><br>
					<input type=email name=t2 required>
					<label>Password</label><br>
					<input type=text name=t3 required>
					<label>Occupation</label><br>
					<input type=text name=t4>
					<center>
					<input type=submit name=submit value=Submit>
					</form>
					<form>
					<input type=submit name=close value=Close style="background-color:gray">
					</center>
				</form>
				<%
					String close=request.getParameter("close");
					String submit=request.getParameter("submit");
					String stdName,stdEmail,stdPass,stdOccupation;
					int id;
					
					if("Close".equals(close))
					{response.sendRedirect("students.jsp");}
					else if("Submit".equals(submit)){
						stdName=request.getParameter("t1");
						stdEmail=request.getParameter("t2");
						stdPass=request.getParameter("t3");
						stdOccupation=request.getParameter("t4");
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							String q1="select * from student order by std_id desc";
							ResultSet res=state.executeQuery(q1);
							if(!res.next())
							{
								id=1;
							}
							else{
								id=Integer.parseInt(res.getString("std_id"))+1;
							}
							String q="insert into student values("+id+",'"+stdName+"','"+stdEmail+"','"+stdPass+"','"+stdOccupation+"','')";
							state.executeUpdate(q);
							%>
							<p style="background-color:#bfb; color:green; padding:10; margin-left:25px;border-radius:5px;width:210px;">Successfully Add New Student</p>	
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