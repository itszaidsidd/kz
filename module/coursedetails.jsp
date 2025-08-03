<%	boolean std_login=false;
	String login_email=""; 
%>
<% 
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
		Statement state=con.createStatement();
		String q4="select * from login";
		ResultSet res1=state.executeQuery(q4);
		if(res1.next())
		{
			std_login=true;
			login_email=res1.getString("std_email");
		}
		else
		{
			std_login=false;
		}
	}
	catch(Exception e)
	{
		out.write(e.getMessage());
	}
 %>
<html>
	<head>
		<title>Knowledge Zone</title>
		<link rel="stylesheet" href="../css/all.css">
		<link rel="stylesheet" href="../css/main.css">
		<style>
			td,th{
				border:1px solid gray;
				padding:10px;
				text-align:left;
			}
			table{
				width:100%;
				margin:20px;
				border-collapse:collapse;
			}
		</style>
	</head>
	<body>
		<div class="nav" style="background-color:rgba(0,0,0,0.5)">
			<div class="nav-brand">Knowledge Zone
			<span class="sub-title">Learn and Implement</span>
			</div>
			<ul>
				<li><a href="../index.jsp">Home</a></li>
				<li><a href="../module/courses.jsp">Courses</a></li>
				<li><a href="../module/payment_status.jsp">Payment Status</a></li>
				<%
				if(std_login)
				{%>
				<li><a href="#">My Profile</a></li>
				<li><a href="#"><form style="display:inline"><input type=submit name=logout value=Logout class=logout></form></a></li>
				<%
					String r=request.getParameter("logout");
					if("Logout".equals(r))
					{
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
							Statement state=con.createStatement();
							String q4="delete from login";
							state.executeUpdate(q4);
							response.sendRedirect("../index.jsp");
						}
						catch(Exception e)
						{
							out.write(e.getMessage());
						}
						
					}
				}
				if(!std_login)
				{%>
				<li><a href="#" id="login">Login</a></li>
				<li><a href="#" class="sign-up">Sign up</a></li>
				<%
				}%>
				<li><a href="#">Feedback</a></li>
				<li><a href="#">Contact</a></li>
			</ul>

		</div>
		<div>
			<img src="../images/book.jpg" width=100% height=30%>
		</div>
		
		<div class="courses">
		<%
			String Id=request.getParameter("id");
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="select * from course where course_id="+Id+"";
				ResultSet res=state.executeQuery(q);
				if(res.next())
				{
					%>
					<div class="card" style="width:100%;box-shadow:none;">
						<img src="../<%out.print(res.getString("course_img"));%>" class="card-image" style="float:left;width:33%;margin-right:20px;height:30%">
						<div id="card-body" style="padding:30px;">
							<h3 class="card-title" style="text-align:left">Course Name : <%out.print(res.getString("course_name"));%></h3><br>
							<p>Description : <%out.print(res.getString("course_desc"));%></p><br>
							<p>Duration : <%out.print(res.getString("course_duration"));%></p><br>
							<p>Price : <small><s>&#8377 <%out.print(res.getString("course_original_price"));%></s></small> &#8377 <%out.print(res.getString("course_price"));%></p>
							<form action=checkout.jsp style="display:inline">
							<input type=hidden value="<%out.print(res.getString("course_price"));%>" name=price>
							<input type=hidden value="<%out.print(res.getString("course_id"));%>" name=id>
							<input type="submit" value="Buy Now" id="card-btn" style="width:100px">
							</form>
						</div>
					</div>
					<table style="">
						<tr>
							<th>Lesson No.</th>
							<th>Lesson Name</th>
						</tr>
					<%	
						q="select * from lesson where course_id="+Integer.parseInt(request.getParameter("id"))+"";
						res=state.executeQuery(q);
						int i=1;
						while(res.next())
						{ %>
							<tr>
								<td><%out.print(i++);%></td>
								<td><%out.print(res.getString("lesson_name"));%></td>
							</tr>
							<%
						} %>
					</table>
					<%
				}
			}
			catch(Exception e)
			{
				out.write(e.getMessage());
			}
		%>
		</div>
		<table style="width:70%;"></table>	
		<div class="admin-footer" style="width:100%;float:none">Copyright &copy 2024 || Designed By Zaid Siddiqui || <a href="#" id="admin">
		Admin Login
		</a></div>
			<div class="get-start-popup">
			<%@ include file="popup.jsp"%>
		</div>
		
	<script>
		document.querySelector(".sign-up").addEventListener("click",function(){
				document.querySelector(".signup").classList.add("active");
				document.querySelector(".login").classList.remove("active");
				document.querySelector(".admin").classList.remove("active");				
				});
		document.querySelector("#signup-close").addEventListener("click",function(){
				document.querySelector(".signup").classList.remove("active");
				});
		document.querySelector(".signup-close-btn").addEventListener("click",function(){
				document.querySelector(".signup").classList.remove("active");
				});
	</script>
	</body>
</html>