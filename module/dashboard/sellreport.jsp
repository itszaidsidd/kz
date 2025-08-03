<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
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
		input[type=date]{
				width:15%;
				padding:5px 7px;
				border-radius:4px;
				font-size:17px;
				background-color:rgba(0,0,0,0);
				border:1px solid gray;
		}
		input[type=submit],button{
				background-color:gray;
				color:white;
				//width:80px;
				font-weight:bold;
				padding:7px 15px;
				border-radius:3px;
				border:none;
				font-size:17px;
		}
		form{
			margin:30px 0 0 20px;
		}
		table{
			width:85%;
			text-align:center;
			margin-left:20px;
			
		}
		caption{
			padding:5px 0;
			width:100%;
			margin-top:40px;
			padding-left:20px;
			background-color:#333;
			margin-bottom:10px;
			font-size:1.2em;
			color:white;
			text-align:left;
		}
		tr th{
			border-top:1px solid rgba(0,0,0,0.1);
			border-bottom:1px solid rgba(0,0,0,0.1);
			padding:10px 0;
		}
		tr td{
			padding:10px 0;
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
			<form>
				<input type=date name=d1> to <input type=date name=d2>
				<input type=submit value="Search" name=b1>
			</form>
			<%
				String r=request.getParameter("b1");
				if("Search".equals(r))
				{
					String d1=request.getParameter("d1");
					String d2=request.getParameter("d2");
					String months[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
					d1=d1.substring(8,10)+"-"+months[Integer.parseInt(d1.substring(5,7))-1]+"-"+d1.substring(0,4);
					d2=d2.substring(8,10)+"-"+months[Integer.parseInt(d2.substring(5,7))-1]+"-"+d2.substring(0,4);
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();
						String q="select * from course_order where order_date between '"+d1+"' and '"+d2+"'";
						ResultSet res=state.executeQuery(q);
						
					%>
						<table>
							<caption>Detail</caption>
							<tr>
								<th>Order ID</th>
								<th>Course ID</th>
								<th>Student Email</th>
								<th>Payment Status</th>
								<th>Order Date</th>
								<th>Amount</th>
								
							</tr> 
					<% 
						while(res.next())
						{ %>
							<tr>
								<td><%out.print(res.getString("order_id"));%></td>
								<td><%out.print(res.getString("course_id"));%></td>
								<td><%out.print(res.getString("std_email"));%></td>
								<td>TXN_SUCCESS</td>
								<td><%out.print(res.getString("order_date"));%></td>
								<td><%out.print(res.getString("amount"));%></td>
							</tr>
					<%	}
					%>
						</table>
					<%
					}
					catch(Exception obj){
						out.print(obj.getMessage());
					}
				}
			
			%>
			
		</div>
	</body>
</html>