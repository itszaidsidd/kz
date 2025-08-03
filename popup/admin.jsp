<html>
	<head>
		<style>
			//body{background-color:teal;}
			.popup{
				
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
			.popup.active{
				//opacity:1;
				display:block;
				
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
			.invalid-p{
				color:red;
				display:inline-block;
				border:1px dashed red;
				padding:7px;
				float:left;
				margin:5px 0 0 10px;
				border-radius:10px;
				opacity:0;
			}
			invalid-p.active{
				opacity:1;
			}
		</style>
	</head>
	<body>
		<div class="popup">
			<div class="popup-header">
				<h2 style="display:inline">Admin Login</h2>
				<div class="close-btn">&times;</div>
			</div>
			<h3><i class="fa-solid fa-envelope"></i> Email</h3>
			<input type="email" name="email" placeholder="Email" style="margin-bottom:0px">
			<h3><br><i class="fa-solid fa-key"></i> Password</h3>
			<input type="text" name="pass" placeholder="Password">
			<div class="popup-footer">
			<div class="invalid"><p class="invalid-p">Invalid username or Password</p>
			<input type="submit" value="Login" name="submit" class="btn" style="background-color:blue;float:left;margin:5px 0 0 20px; width:75px;height:35px;cursor">
			<a href="#" class="close-btn" id="admin-close-btn" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Cencel</center></b></a>
			</div>
		</div>
		
		<script>
			
			document.querySelector('#admin').addEventListener("click",function popup(){
				document.querySelector(".popup").classList.add("active")});
			document.querySelector('.close-btn').addEventListener("click",function(){
				document.querySelector('.popup').classList.remove('active')});
				
			document.querySelector('#admin-close-btn').addEventListener("click",function(){
				document.querySelector('.popup').classList.remove('active')});
				
			
		</script>
	</body>
</html>