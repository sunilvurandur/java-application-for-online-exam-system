<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%!
Statement stmt;
Connection con;
ResultSet rs;
%>
<%
try{
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
String vsql = "select * from instutedetails where iid='"+uname+"' and pwd='"+pwd+"'";
stmt = con.createStatement();
rs = stmt.executeQuery(vsql);
if( rs.next() ){
	out.println("<center>Login Success<br></center>");
	//out.println("Welcome to:" + uname);
	response.sendRedirect("instuteopt.jsp");
	}
else{
	out.println("Invalid password<br>");
	out.println("plese<a href='login.jsp'>login</a>");
	}
}
catch(Exception e){
	out.println(e.getMessage());
}finally{
	//close the connection
	try{
		con.close();
	}catch(Exception e1){}
}

%>