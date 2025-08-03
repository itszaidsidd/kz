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
			height:86%;
			background-color:#efefef;
			float:left;
		}
		table{
			margin:10px 20px;
			width:85%;
		}
		tr td{
			padding:10px 0;
			border-bottom:1px solid rgba(0,0,0,0.2);
			width:100%;
		}
		a{
			text-decoration:none;
			color:black;
			font-size:17px;
			width:300px;

		}
		.dashboard-body{
			width:80%;
			height:86%;
			//background-color:wheat;
			float:left;
		}
		iframe{
			margin:50px 0 0 70px;
		}
		button{
			background-color:red;
			padding:3px 5px;
			margin:0 0 10px 100px;
			color:white;
		}
	</style>

	</head>
	<body>
		<div class=nav><p class="nav-title">Welcome to E-Learning<p><button><a href=mycourse.jsp style="color:white">My Course</a></button></div>
		<div class="nav-ver">			
			<div class="nav-ver-body">
				<center><h2>Lessons</h2></center>
				<table>
				<%
				int id=Integer.parseInt(request.getParameter("id"));
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					String q="select * from lesson where course_id="+id+"";
					ResultSet res=state.executeQuery(q);
					while(res.next())
					{	
						%>
					<tr>
						<td><a href="../../<%out.print(res.getString("lesson_link"));%>" target=frm><%out.print(res.getString("lesson_name"));%></a></td>
					</tr>
						<%
					}
				}
				catch(Exception obj)
				{
					out.write(obj.getMessage());
				}
				%>
				</table>
			</div>
		</div>
		<div class="dashboard-body">
			<iframe name=frm width=80% height=80% style="border:none"></iframe>
		</div>
	</body>
</html>