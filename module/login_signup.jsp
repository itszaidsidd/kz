<%	boolean std_login=false;
	String login_email=""; 
%>
<html>
	<head>
		<title>Knowledge Zone</title>
		<link rel="stylesheet" href="../css/all.css">
		<link rel="stylesheet" href="../css/main.css">
		<style>
			.box{
				width:70%;
				height:58%;
				background-color:#eee;
				padding:30px 30px;
				margin:0 auto;
			}
			.login1{
				width:35%;
				float:left;
			}
			.signup1{
				width:45%;
				float:left;
				margin-left:100px;
			}
			input[type=submit]{
				margin:0px;
				float:left;
				border-radius:3px;
				padding:5px 10px;
				font-size:17px;
			}
			h2{
				margin:20px 0;
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
		
		<div class="box">
			<div class="login1">
				<h2>If Already Registered !! Login</h2>
				<form>
					<h4><i class="fa-solid fa-envelope"></i> Email</h4>
					<input type=email name=t1 placeholder=Email required>
					<h4><i class="fa-solid fa-key"></i> Password</h4>
					<input type=text name=t2 placeholder=Password required>
					<input type=submit name=b1 value=Login>
					<div class="msg1"> </div>
				</form>
			</div>
			<div class="signup1">
				<h2>New User !! Sign Up</h2>
				<form>
				<h4><i class="fa-solid fa-user"></i> Name</h4>
				<input type="text" name="t3" placeholder="Name">
				<h4><i class="fa-solid fa-envelope"></i> Email</h4>
				<input type="email" name="t4" placeholder="Email" style="margin-bottom:0px">
				<small>We'll never share your email another one</small>
				<h4><br><i class="fa-solid fa-key"></i> New Password</h4>
				<input type="text" name="t5" placeholder="Password">
				<input type=submit name=b2 value="Sign Up">
				<div class="msg"> </div>
				</form>
			</div>
			<%
				String submit=request.getParameter("b1");
				String submit2=request.getParameter("b2");
				String name1,pass1,email1,q5;
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					ResultSet res3;
					if("Login".equals(submit))
					{
						email1=request.getParameter("t1");
						pass1=request.getParameter("t2");
						q5="select * from student where std_email='"+email1+"' and std_pass='"+pass1+"'";
						res3=state.executeQuery(q5);
						if(res3.next()){
							q5="insert into login values(1,'"+email1+"')";
							state.executeUpdate(q5);	
							response.sendRedirect("courses.jsp");
							
						}
						else{
							%>
							<script>
								var a=document.querySelector(".msg1");
								a.innerHTML='Inavlid Id or Password';
								a.style.color='red';
								a.style.background='#fbb';
							</script>
							<%
						}
					}
					else if("Sign Up".equals(submit2))
					{
						name1=request.getParameter("t3");
						email1=request.getParameter("t4");
						pass1=request.getParameter("t5");
						int id;
						q5="select * from student order by std_id desc";
						ResultSet res=state.executeQuery(q5);
						if(!res.next())
						{
							id=1;
						}
						else{
							id=Integer.parseInt(res.getString("std_id"))+1;
						}
						q5="insert into student(std_id,std_name,std_email,std_pass) values("+id+",'"+name1+"','"+email1+"','"+pass1+"')";
						state.executeUpdate(q5);
						%>
						<script>
							var a=document.querySelector(".msg");
							a.innerHTML='Registration Successfully';
							a.style.color='green';
							a.style.background='#bfb';
						</script>
						<%
					}
				}
				catch(Exception obj)
				{
					out.write(obj.getMessage());
				}
			
			%>
		</div>
		
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