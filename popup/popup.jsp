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
			.admin.active{
				display:block;
			}
			.login.active{
				display:block;
			}
			
			.signup.active{
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
		</style>
	</head>
	<body>
	
		<button id="login">Login</button>
		<button id="signup">Sign Up</button>
		<button id="admin">Admin</button>
	
		<div class="login">
			<div class="popup-header">
				<h2 style="display:inline">Student Login</h2>
				<div class="login-close-btn close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<h3><br><i class="fa-solid fa-key"></i> New Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<input type="submit" value="Sign UP" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 230px; width:75px;height:35px;cursor">
			<a href="#" class="close-btn" id="login-close" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
			</div>
		</div>
		<div class="signup">
			<div class="popup">
			<form>
			<div class="popup-header">
				<h2 style="display:inline">Student Registration</h2>
				<div class="signup-close-btn close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-person"></i> Name</h3>
			<input type="text" name="name" placeholder="Name">
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<small>We'll never share your email another one</small>
			<h3><br><i class="fa-solid fa-key"></i> New Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<input type="submit" value="Sign UP" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 230px; width:75px;height:35px;cursor">
			<a href="#" class="close-btn" id="signup-close" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
			</div>
			</div>
		</div>
		<div class="admin">
			<div class="popup-header">
				<h2 style="display:inline">Admin Login</h2>
				<div class="admin-close-btn close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<h3><br><i class="fa-solid fa-key"></i> New Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<input type="submit" value="Sign UP" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 230px; width:75px;height:35px;cursor">
			<a href="#" class="close-btn" id="admin-close" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
			</div>
		</div>
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
				document.querySelector(".login").classList.remove("active");
				document.querySelector(".signup").classList.remove("active");
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