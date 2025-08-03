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
		.card{
			width:300px;
			height:200px;
			background-color:red;
			float:left;
			margin:30px 0 30px 50px;
			border-radius:5px;
			color:white;
			text-align:center;
			font-size:1.2em;
		}
		.card-title{
			padding:10px;
			background-color:rgba(0,0,0,0.1);
		}
		.card-total{
			//width:100%;
			//height:50px;
			font-size:2em;
			padding:30px;
		}
		.dashboard-body{
			width:80%;
			height:91%;
			//background-color:wheat;
			float:left;
		}
		table{
			width:85%;
			text-align:left;
			margin-left:40px;
			margin-top:40px;
		}
		caption{
			padding:5px 10px;
			width:100%;
			background-color:#333;
			margin-bottom:10px;
			font-size:1.2em;
			color:white;
			text-align:left;
		}
		tr th{
			border-top:1px solid rgba(0,0,0,0.1);
			border-bottom:1px solid rgba(0,0,0,0.1);
			padding:10px 10px;
		}
		tr td{
			padding:10px 10px;
		}
		.delete,.edit{
			width:30px;
			height:30px;
			background-color:#555;
			color:white;
			border:none;
			border-radius:3px;
			cursor:pointer;
			font-size:17px;
		}
		.edit{
			background-color:#37e;
		}
		.addcourse{
			width:35px;
			height:38px;
			background-color:red;
			color:white;
			border:none;
			border-radius:3px;
			cursor:pointer;
			font-size:40px;
			padding:4px;
			position:fixed;
			right:30;
			bottom:40;
		}
		input[type=text]{
			width:20%;
			padding:8px 10px;
			border-radius:4px;
			//height:40px;
			font-size:15px;
			background-color:rgba(0,0,0,0);
			border:1px solid gray;
		}
		input[type=submit]{
			background-color:red;
			color:white;
			//width:80px;
			font-weight:bold;
			padding:7px 15px;
			border-radius:3px;
			border:none;
			font-size:17px;
		}
		.form{
			margin:50px 5px 10px 40px;
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
			<form class=form>
				<label>Enter Course ID: </label>
				<input type=text name=t1>
				<input type=submit value="Search" name=b1>
			</form>
			<%
			String r=request.getParameter("b1");
			if("Search".equals(r))
			{
				int course_id=Integer.parseInt(request.getParameter("t1"));	
				String course_name;
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					String q="select * from course where course_id="+course_id+"";
					ResultSet res1=state.executeQuery(q);
					if(res1.next())
					{
						course_name=res1.getString("course_name");
			%>
			<table>
				<caption>Courses ID: <%out.print(res1.getString("course_id"));%> Course Name: <%out.print(res1.getString("course_name"));%></caption>
				<tr>
					<th>Lesson ID</th>
					<th>Lesson Name</th>
					<th>Lesson Link</th>
					<th>Action</th>
				</tr> 
				<%
						q="select * from lesson where course_id="+res1.getString("course_id")+"";
						ResultSet res=state.executeQuery(q);
						while(res.next())
						{
							%>
							<tr>
								<td><% out.write(res.getString("lesson_id")); %></td>
								<td><% out.write(res.getString("lesson_name")); %></td>
								<td><% out.write(res.getString("lesson_link")); %></td>
								<td>
									<form action="editlesson.jsp" style="display:inline">
									<input type=hidden name=id value="<%out.print(res.getString("lesson_id"));%>" >
									<button type=submit name=edit value=edit class=edit><i class="fa-solid fa-pencil"></i></button> 
									</form>
									<form action="deletelesson.jsp" style="display:inline">
									<input type=hidden name=id value="<%out.print(res.getString("lesson_id"));%>" >
									<button type=submit name=b2 value=delete class=delete><i class="fa-solid fa-trash-can"></i></button>
									</form>
								</td>
								
							</tr>
							<%
						}
						String del=request.getParameter("b2");
						if("delete".equals(del)){
							int id=Integer.parseInt(request.getParameter("id"));
							String q1="delete from lesson where lesson_id="+id+"";
							state.executeUpdate(q1);
							response.sendRedirect("lesson.jsp");
						}
				%>	
				<form action="addnewlesson.jsp">
					<input type=hidden value="<%out.print(course_id);%>" name=course_id>
					<input type=hidden value="<%out.print(course_name);%>" name=course_name>
					<button><div class=addcourse><i class="fa-solid fa-plus"></i></div></button>
				</form>	
					<!-- <a href=addnewlesson.jsp><div class=addcourse><i class="fa-solid fa-plus"></i></div></a> -->
			</table>
			<%
					}
				}
				catch(Exception e)
				{
					out.write(e.getMessage());
				}
			}
			%>
			
		</div>
	</body>
</html>