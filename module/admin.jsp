<%@page import="java.sql.*"%>
<% int course=0,student=0,sold=0; %>
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
		.card a{
			color:white;
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
			text-align:center;
			margin-left:40px;
			
		}
		caption{
			padding:5px 0;
			width:100%;
			background-color:#333;
			margin-bottom:10px;
			font-size:1.2em;
			color:white;
		}
		tr th{
			border-top:1px solid rgba(0,0,0,0.1);
			border-bottom:1px solid rgba(0,0,0,0.1);
			padding:10px 0;
		}
		tr td{
			padding:10px 0;
		}
		.delete{
			width:30px;
			height:30px;
			background-color:#555;
			color:white;
			border:none;
			border-radius:3px;
			cursor:pointer;
			font-size:17px;
		}
	</style>
	<link rel="stylesheet" href="../css/all.css">
	</head>
	<body>
		<div class=nav><p class="nav-title">Knowledge Zone <small>Admin Area</small><p></div>
		<div class="nav-ver">
			<div class="nav-ver-body">
				<ul>
					<li><a href="admin.jsp"><i class="fa-solid fa-gauge-high"></i> Dashboard</a></li>
					<li><a href="dashboard/course.jsp"><i class="fa-solid fa-book"></i> Courses</a></li>
					<li><a href="dashboard/lesson.jsp"><i class="fa-solid fa-person-chalkboard"></i> Lessons</a></li>
					<li><a href="dashboard/students.jsp"><i class="fa-solid fa-users"></i> Students</a></li>
					<li><a href="dashboard/sellreport.jsp"><i class="fa-solid fa-window-maximize"></i> Sell Report</a></li>
					<li><a href="dashboard/paymentstatus.jsp"><i class="fa-regular fa-window-maximize"></i> Payment Status</a></li>
					<li><a href="dashboard/feedback.jsp"><i class="fa-solid fa-wheelchair-move"></i> Feedback</a></li>
					<li><a href="dashboard/changepassword.jsp"><i class="fa-solid fa-key"></i> Change Password</a></li>
					<li><a href="../index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
				</ul>
			</div>
		</div>
		<div class="dashboard-body">
		<%
			
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="select count(*) from course";
				ResultSet res=state.executeQuery(q);
				if(res.next())
				{
					course=Integer.parseInt(res.getString("count(*)"));
				}
				q="select count(*) from student";
				res=state.executeQuery(q);
				if(res.next())
				{
					student=Integer.parseInt(res.getString("count(*)"));
				}
				q="select count(*) from course_order";
				res=state.executeQuery(q);
				if(res.next())
				{
					sold=Integer.parseInt(res.getString("count(*)"));
				}
				%>
				<div class="card">
					<p class="card-title">Course</p>
					<div class="card-total"><%out.print(course);%></div>
					<a href="dashboard/course.jsp"><p class="card-footer">View</p></a>
				</div>
				<div class="card" style="background-color:#1c1">
					<p class="card-title">Students</p>
					<div class="card-total"><%out.print(student);%></div>
					<a href="dashboard/students.jsp"><p class="card-footer">View</p></a>
				</div>
				<div class="card" style="background-color:#37e">
					<p class="card-title">Sold</p>
					<div class="card-total"><%out.print(sold);%></div>
					<a href="dashboard/sellreport.jsp"><p class="card-footer">View</p></a>
				</div>
			<table>
				<caption>Course Ordered</caption>
				<tr>
					<th>Order ID</th>
					<th>Course ID</th>
					<th>Student Email</th>
					<th>Order Date</th>
					<th>Amount</th>
					<th>Action</th>
				</tr> 
				<%
					q="select * from course_order";
					res=state.executeQuery(q);
					while(res.next())
					{
						%>
						<tr>
							<td><%out.print(res.getString("order_id"));%></td>
							<td><%out.print(res.getString("course_id"));%></td>
							<td><%out.print(res.getString("std_email"));%></td>
							<td><%out.print(res.getString("order_date"));%></td>
							<td><%out.print(res.getString("amount"));%></td>
							<td>
								<form>
								<input type=hidden value="<%out.print(res.getString("id"));%>" name=id>
								<button type=submit name=delete value=delete class=delete><i class="fa-solid fa-trash-can"></i></button>
								</form>
							</td>
						</tr>
						<%
					}
				%>
			</table>
					<%
						String r=request.getParameter("delete");
						if("delete".equals(r))
						{
							int id=Integer.parseInt(request.getParameter("id"));
							q="delete from course_order where id="+id+"";
							state.executeUpdate(q);
							response.sendRedirect("admin.jsp");
						}
					}
					catch(Exception obj){
						out.print(obj.getMessage());
					}
				
			%>
		</div>
		<script>
			document.querySelecter("#course").addEventListener("click",function(){
				document.querySelector(".frame").classList.add("active");
		</script>
	</body>
</html>