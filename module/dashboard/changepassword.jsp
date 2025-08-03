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
			width:40%;
			margin:20px 0 0 10px;
			//background-color:#ccc;
			border-radius:5px;
			padding:30px;
			//height:100%;
		}
		form{
			display:inline;
		}
		input[type=email]{background-color:rgba(108, 97, 97, 0.2);}
		input[type=text],input[type=email]{
			width:100%;
			font-size:17px;
			padding:7px;
			border-radius:5px;
			margin:10px 0 20px 0;
			border:1px solid gray;
		}
		input[type=submit],input[type=reset]{
			padding:5px;
			color:white;
			border-radius:3px;
			background-color:red;
			width:70px;
			font-size:18px;
			margin:20px 20px 0 0;
			//border:none;
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
				<form>
				<%	
					try{
							String email,pass;
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							String q="select * from admin_login";
							ResultSet res=state.executeQuery(q);
							if(res.next()){
								email=res.getString("admin_email");
								
							%>
							<label><b>E-mail</b></label><br>
							<input type=email name=t2 value="<%out.print(email);%>" readonly>
							<label><b>New Password</b></label><br>
							<input type=text name=t3 required>
							<input type=submit name=submit value=Submit>
							</form>
							<form>
							<input type=reset name=close value=Reset style="background-color:gray">
						</form>
						<%
								String submit=request.getParameter("submit");
								if("Submit".equals(submit)){
									pass=request.getParameter("t3");
									String q1="update kz_admin set pass='"+pass+"' where email='"+email+"'";
									state.executeUpdate(q1);
									%>
									<p style="background-color:#bfb; color:green; padding:10; margin:25px;border-radius:5px;width:140px;">Update Successfully</p>	
									<%
								}
							}
					}
					catch(Exception e){
						out.write("Data not filled");
						out.write(e.getMessage());
					}
						
					
				
				%>
			</div>
		</div>
	</body>
</html>