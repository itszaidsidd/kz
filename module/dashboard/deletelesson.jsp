<%@page import="java.sql.*;"%>
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("Jdbc:oracle:thin:@localhost:1521:xe","system","8616");
		Statement state=con.createStatement();
		int id=Integer.parseInt(request.getParameter("id"));
		String q1="delete from lesson where lesson_id="+id+"";
		state.executeUpdate(q1);
		response.sendRedirect("lesson.jsp");
		
	}
	catch(Exception e){
		out.write(e.getMessage());
	}
%>