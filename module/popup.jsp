<%@page import="java.sql.*;"%>
<html>
	<head>
		<style>
			.login{
				width:400px;
				//height:300px;
				padding:10px;
				border-radius:5px;
				background-color:white;
				box-shadow:2px 2px 2px gray;
				//border:2px solid black;
				margin:20px auto;
				//opacity:0;
				position:absolute;
				top:60;
				left:550;
				z-index:12;
				display:none;
			}
			.signup{
				width:400px;
				//height:300px;
				padding:10px;
				border-radius:5px;
				background-color:white;
				box-shadow:2px 2px 2px gray;
				margin:20px auto;
				//opacity:0;
				position:absolute;
				top:60;
				left:550;
				z-index:10;
				display:none;
			}
			.admin{
				width:400px;
				//height:300px;
				padding:10px;
				border-radius:5px;
				background-color:white;
				box-shadow:2px 2px 2px gray;
				margin:20px auto;
				//opacity:0;
				position:absolute;
				top:60;
				left:550;
				z-index:10;
				display:none;				
			}
			.login.active{
				display:block;
			}
			
			.signup.active{
				display:block;
			}
			.admin.active{
				display:block;
			}
			.close-btn{
				font-size:20px;
				cursor:pointer;
				float:right;
				padding:2px;
				border-radius:5px;
			}
			a.close-btn:hover{
				font-size:20px;
				cursor:pointer;
				float:right;
				padding:2px;
				border-radius:5px;
			}
			.popup-header{
				border-bottom:1px solid gray;
				padding:1px 0 5px 0;
				margin-bottom:20px;
			}
			.popup-footer{
				border-top:1px solid gray;
				padding:5px 0;
			}
			.msg,.msg1{
				//background-color:#fbb;
				width:220px;
				height:25px;
				float:left;
				margin:5px 0 0 5px;
				//color:red;
				padding:8px 0 4px 0;
				text-align:center;
				border-radius:5px;
			}
		</style>
	</head>
	<body>
		<div class="login">
			<form>
			<div class="popup-header">
				<h2 style="display:inline">Student Login</h2>
				<div class="login-close-btn close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<h3><br><i class="fa-solid fa-key"></i> Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<div class="msg1"> </div>
			<input type="submit" value="Login" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 10px; width:75px;height:35px;cursor:pointer">
			<a href="#" class="close-btn" id="login-close" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
			</div>
		</form>
		</div>
		<%
				
				String r2=request.getParameter("submit");
				if("Login".equals(r2))
				{
					String std_email=request.getParameter("email");
					String std_pass=request.getParameter("pass");
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();
						String q2="select * from student where std_email='"+std_email+"' and std_pass='"+std_pass+"'";
						ResultSet res1=state.executeQuery(q2);
						if(res1.next()){
							String q3="insert into login values(1,'"+std_email+"')";
							state.executeUpdate(q3);
							
							%>
							<script>
							window.location.href="../index.jsp";
								var a=document.querySelector(".msg1");
								a.innerHTML='Login';
								a.style.color='green';
								a.style.background='#bfb';
							</script>
							<%
							
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
					catch(Exception e)
					{
						out.write(e.getMessage());
					}
				}
			%>
		<div class="signup">
			<div class="popup">
			<form>
			<div class="popup-header">
				<h2 style="display:inline">Student Registration</h2>
				<div class="signup-close-btn close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-user"></i> Name</h3>
			<input type="text" name="name" placeholder="Name">
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<small>We'll never share your email another one</small>
			<h3><br><i class="fa-solid fa-key"></i> New Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<div class="msg"> </div>
			<input type="submit" value="Sign Up" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 10px; width:75px;height:35px;cursor:pointer">
			<a href="#" class="close-btn" id="signup-close" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
			</form>
			</div>
			</div>
		</div>
		<%
				String r1=request.getParameter("submit");
				if("Sign Up".equals(r1))
				{
					String name=request.getParameter("name");
					String email=request.getParameter("email");
					String pass=request.getParameter("pass");
					int id;
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
						Statement state=con.createStatement();
						String q1="select * from student order by std_id desc";
						ResultSet res=state.executeQuery(q1);
						if(!res.next())
						{
							id=1;
						}
						else{
							id=Integer.parseInt(res.getString("std_id"))+1;
						}
						String q="insert into student(std_id,std_name,std_email,std_pass) values("+id+",'"+name+"','"+email+"','"+pass+"')";
						state.executeUpdate(q);
						%>
						<script>
							var a=document.querySelector(".msg");
							a.innerHTML='Registration Successfully';
							a.style.color='green';
							a.style.background='#bfb';
						</script>
						<%
					}
					catch(Exception e)
					{
						%>
						<script>
							var a=document.querySelector(".msg");
							a.innerHTML='Registration Failed';
							a.style.color='red';
							a.style.background='#fbb';
						</script>
						<%
					}
					
				}
			%>
		<div class="Admin">
		<form>
			<div class="popup-header">
				<h2 style="display:inline">Admin Login</h2>
				<div class="admin-close-btn close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<h3><br><i class="fa-solid fa-key"></i> Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<div class="msg"> </div>
			<input type="submit" value="Admin" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 10px; width:75px;height:35px;cursor">
			<a href="#" class="close-btn" id="admin-close" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
			</div>
		</form>
		</div>
		<%
			String r=request.getParameter("submit");
			if("Admin".equals(r))
			{
				String email=request.getParameter("email");
				String pass=request.getParameter("pass");
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
					Statement state=con.createStatement();
					String q="select * from kz_admin where email='"+email+"' and pass='"+pass+"'";
					ResultSet res=state.executeQuery(q);
					if(!res.next())
					{
						%>
							<script>
								var a=document.querySelector(".msg1");
								a.innerHTML='Inavlid Id or Password';
								a.style.color='red';
								a.style.background='#fbb';
							</script>
							<%
					}
					else{
						String q1="insert into admin_login values('"+email+"')";
						state.executeUpdate(q1);
						%>
							<script>
							window.location.href="admin.jsp";
							</script>
							<%
					}
				}
				catch(Exception obj)
				{
					out.write(obj.getMessage());
				}
			}
		%>
		
		<script>
			document.querySelector("#login").addEventListener("click",function(){
				document.querySelector(".login").classList.add("active");
				document.querySelector(".signup").classList.remove("active");
				document.querySelector(".admin").classList.remove("active");
				
				});
			document.querySelector("#login-close").addEventListener("click",function(){
				document.querySelector(".login").classList.remove("active");
				
				});
			document.querySelector(".login-close-btn").addEventListener("click",function(){
				document.querySelector(".login").classList.remove("active");
				});
			
			document.querySelector("#signup").addEventListener("click",function(){
				document.querySelector(".signup").classList.add("active");
				document.querySelector(".login").classList.remove("active");
				document.querySelector(".admin").classList.remove("active");				
				});
				
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
				
			document.querySelector("#admin").addEventListener("click",function(){
				document.querySelector(".admin").classList.add("active");
				document.querySelector(".signup").classList.remove("active");
				document.querySelector(".login").classList.remove("active");				
				});
			document.querySelector("#admin-close").addEventListener("click",function(){
				document.querySelector(".admin").classList.remove("active");
				
				});
			document.querySelector(".admin-close-btn").addEventListener("click",function(){
				document.querySelector(".admin").classList.remove("active");
				});
		</script>
	</body>
</html>