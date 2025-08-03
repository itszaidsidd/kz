<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%
	try{
			int course_id=Integer.parseInt(request.getParameter("t4"));
			int price=Integer.parseInt(request.getParameter("t3"));
			String order_id=request.getParameter("t1");
			String login_email=request.getParameter("t2");
			int id=Integer.parseInt(request.getParameter("t5"));
			Date d =new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			String strDate=formatter.format(d);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
			Statement state=con.createStatement();
			String q1="insert into course_order values('"+order_id+"',"+id+",'"+login_email+"',"+course_id+","+price+",'"+strDate+"')";
			state.executeUpdate(q1);
			%>
				<script>
						alert("Transaction Complete");
						window.location.href="../index.jsp";
				</script>
				
			<%
			//response.sendRedirect("../index.jsp");
		
	}
	catch(Exception e)
	{
		out.write(e.getMessage());
	}
 %>