<%@page import="java.sql.*;"%>
<%	String login_email=""; %>
<% 
	
	try{
		int course_id=Integer.parseInt(request.getParameter("id"));
		int price=Integer.parseInt(request.getParameter("price"));
		int order_id=250120010;
		int id;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
		Statement state=con.createStatement();
		String q4="select * from login";
		ResultSet res1=state.executeQuery(q4);
		if(!res1.next())
		{
			
			response.sendRedirect("login_signup.jsp");
		}
		else
		{
			login_email=res1.getString("std_email");
			//String q="select count(*) from course_order";
			String q="select * from course_order order by id desc";
			ResultSet res2=state.executeQuery(q);
			if(res2.next())
			{
				id=Integer.parseInt(res2.getString("id"))+1;
				//order_id+=Integer.parseInt(res2.getString("count(*)"));
				//order_id+=Integer.parseInt(res2.getString("id"));
			}
			else{
				//order_id+=1;
				id=1;
			}
			order_id+=id;
		%>
<html>
	<head>
		<title>Checkout</title>
		<style>
			*{
				margin:0;
				padding:0;
				font-family:arial;
			}
			.box{
				width:35%;
				margin:50px auto;
				background-color:rgba(70,200,200,0.2);
				border-radius:5px;
				padding:60px 20px;
			}
			h2{
				text-align:center;
				font-size:1.8em;
				
			}
			table{
				width:100%;
			}
			tr{
				height:50px;
			}
			input[type=text]{
				width:100%;
				padding:5px 10px;
				border-radius:7px;
				height:40px;
				background-color:rgba(0,0,0,0);
				border:1px solid gray;
			}
			input[type=submit]{
				background-color:blue;
				color:white;
				//width:80px;
				font-weight:bold;
				padding:10px 15px;
				border-radius:3px;
				border:none;
			}
		</style>
	</head>
	<body>
		<div class=box>
			<h2>Welcome to E-Learning Payment Page</h2><br>
			<table>
				<form action=checkoutsubmit.jsp>
				<tr>
					<td>Order Id</td>
					<td><input type=text value="ORDS<%out.print(order_id);%>" name=t1 readonly></td>
				</tr>
				<tr>
					<td>Student Email</td>
					<td><input type=text value="<%out.print(login_email);%>" name=t2 readonly></td>
				</tr>
				<tr>
					<td>Amount</td>
					<td><input type=text value="<%out.print(price);%>" name=t3 readonly></td>
				</tr>
			</table>
			<br><br>
			<input type=hidden value="<%out.print(course_id);%>" name=t4 >
			<input type=hidden value="<%out.print(id);%>" name=t5>
			<center><input type=submit value="Chekout" name=b1> <input type=submit value="Cancel" name=b2 style="background-color:gray;"></center><br>
			
			</form>
			<small>Note: Complete Payment by Checking by Checkout Button</small>
		</div>
	</body>
</html>		
			
		<%
		
		}
	}
	catch(Exception e)
	{
		out.write(e.getMessage());
	}
 %>
