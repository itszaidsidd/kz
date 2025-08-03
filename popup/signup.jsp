<html>
	<head>
		<style>
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
				z-index:10;
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
			.loign{
				position:absolute;
				top:5;
				left:4;
				z-index:11;
				width:300px;
				height:300px;
				//display:block;
				background-color:green;
			}
		</style>
	</head>
	<body>
		<div class="popup">
			<div class="popup-header">
				<h2 style="display:inline">Student Registration</h2>
				<div class="close-btn">&times;</div>
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
			<a href="#" class="close-btn" id="close-btn" style="background-color:gray;width:75px;margin-top:5px;height:30px"><b><center>Close</center></b></a>
		</div>
		
		<script>
			
			document.querySelector('.signup').addEventListener("click",function popup(){
				document.querySelector(".popup").classList.add("active")});
			document.querySelector('.close-btn').addEventListener("click",function(){
				document.querySelector('.popup').classList.remove('active')});
				
			document.querySelector('#signup').addEventListener("click",function popup(){
				document.querySelector(".popup").classList.add("active")});
			document.querySelector('#close-btn').addEventListener("click",function(){
				document.querySelector('.popup').classList.remove('active')});
				
			
		</script>
	</body>
</html>