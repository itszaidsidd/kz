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
			width:90%;
			text-align:left;
			margin-left:40px;
			margin-top:40px;
			border:2px solid rgba(0,0,0,0.2);
			border-collapse: collapse;
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
		td{
			border:2px solid rgba(0,0,0,0.2);
			padding:10px;
			height:50px;
			
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
		input[type=submit],button{
				background-color:blue;
				color:white;
				//width:80px;
				font-weight:bold;
				padding:7px 15px;
				border-radius:3px;
				border:none;
				font-size:17px;
		}
		h1{
			margin:10px 0;
		}
		label{
			margin:5px 5px 10px 350px;
		}
		form{
			display:inline;
		}
		button{
			margin:20px 0 0 40px;
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
			<center><h1>Payment Status</h1></center>
			<label>Order ID: </label>
			<form>
			<input type=text name=t1>
			<input type=submit value="View" name=b1>
			</form>
			<%
				String r=request.getParameter("b1");
				if("View".equals(r))
				{
					String order_id=request.getParameter("t1");
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();
						String q="select * from course_order where order_id='"+order_id+"'";
						ResultSet res=state.executeQuery(q);
						if(res.next()){
						%>
							<center><h1>Payment Receipt</h1></center>
							<table>
								<tr>
									<td>ORDER ID</td>
									<td><%out.print(res.getString("order_id"));%></td>
								</tr>
								<tr>
									<td>TXN AMOUNT</td>
									<td><%out.print(res.getString("amount"));%></td>
								</tr>
								<tr>
									<td>STATUS</td>
									<td>TXN_SUCCESS</td>
								</tr>
								<tr>
									<td>TXN TYPE</td>
									<td>SALE</td>
								</tr>
								<tr>
									<td>RESP CODE</td>
									<td>1</td>
								</tr>
								<tr>
									<td>PAYMENT MODE</td>
									<td>NB</td>
								</tr>
								<tr>
									<td>REFUND AMT</td>
									<td>0.00</td>
								</tr>
								<tr>
									<td>TXN DATE</td>
									<td><%out.print(res.getString("order_date"));%></td>
								</tr>
							</table>
							<button onclick="Javascript:window.print()">Print</button>
						<%
						}
					}
					catch(Exception obj){
						out.print(obj.getMessage());
					}
				}
			%>
		</div>
	</body>
</html>