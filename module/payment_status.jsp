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
			table{
				width:30%;
				text-align:left;
				margin-left:40px;
				margin-top:10px;
				border:2px solid rgba(0,0,0,0.2);
				border-collapse: collapse;
			}
			td{
				border:2px solid rgba(0,0,0,0.2);
				padding:10px;
				height:50px;
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
							response.sendRedirect("index.jsp");
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
		
		<h1><center>Payment Status</center></h1>
		<center>
		<form>
			<label>Order ID </label>
			<input type="text" name="status" style="width:20%">
			<input type="submit" name="view" value="View" style="float:none;width:60px;height:40px">
		</form>
			<%
				String view=request.getParameter("view");
				if("View".equals(view))
				{
					String order_id=request.getParameter("status");
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();
						String q="select * from course_order where order_id='"+order_id+"'";
						ResultSet res=state.executeQuery(q);
						if(res.next()){
						%>
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
									<td>TXN DATE</td>
									<td><%out.print(res.getString("order_date"));%></td>
								</tr>
							</table>
							<button onclick="Javascript:window.print()" style="background-color:blue;border:none;padding:7px 10px;margin-top:20px">Print Receipt</button>
						<%
						}
					}
					catch(Exception obj){
						out.print(obj.getMessage());
					}
				}
			%>
		</center>
		<div class="contact">
			<center><h1>Contact US</h1></center>
			<div class="contact-form">
				<form>
					<input type="text" name="contact-name" placeholder="Name">
					<input type="text" name="contact-subject" placeholder="Subject">
					<input type="text" name="contact-email" placeholder="E-mail">
					<textarea name="contact-area" placeholder="How can we help you?"></textarea>
					<input type="submit" value="Send" name="send" style="display:block; float:left">
				</form>
			</div>
			<div class="contact-add">
				<h4>Knowledge Zone</h4>
				<p>Knowledge Zone, near Meenakhi Chowk,<br>
					Muzaffarnagar - 251002<br>
					Phone: +91 8126648616<br></p>
			</div>
		</div>
		
		<table style="width:70%;"></table>	
		<div class="admin-footer" style="width:100%;float:none">Copyright &copy 2024 || Designed By Muskan || <a href="#" id="admin">
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