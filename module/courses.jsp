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
		
		<h1><center>All Courses</center></h1>
		<div class="courses">
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
				Statement state=con.createStatement();
				String q="select * from course";
				ResultSet res=state.executeQuery(q);
				while(res.next())
				{
					%>
					<div class="card" style="border:1px solid rgba(0,0,0,0.5);margin:15px 14px;">
						<img src="../<%out.print(res.getString("course_img"));%>" class="card-image">
						<div id="card-body">
							<h3 class="card-title"><%out.print(res.getString("course_name"));%></h3>
							<p class="card-text" style="height:60px"><%out.print(res.getString("course_desc"));%></p>
						</div>
						<div class="card-footer">
						<h4 class="card-price">Price : <small><s>&#8377 <%out.print(res.getString("course_original_price"));%></s></small> &#8377 <%out.print(res.getString("course_price"));%></h4>
						<form action="coursedetails.jsp" style="display:inline">
						<input type=hidden value="<%out.print(res.getString("course_id"));%>" name=id>
						<input type="submit" value="Enroll" id="card-btn">
						</form>
						</div>
					</div>
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