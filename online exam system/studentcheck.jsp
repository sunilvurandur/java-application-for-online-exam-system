<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%!
Statement stmt;
Connection con;
ResultSet rs;
ResultSet rs1;
%>
<%
try{
String uname = request.getParameter("uname");
String pwd = request.getParameter("pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
String vsql = "select * from studentdetail where sid='"+uname+"' and pwd='"+pwd+"'";
//String vsql1 = "select marks from studentdetail where sid='"+uname+"' and pwd='"+pwd+"'";

stmt = con.createStatement();
rs =  stmt.executeQuery(vsql);
// /*rs1 = stmt.executeQuery(vsql1);
int marks=0;

if( rs.next() ){
	//out.println("<center>Login Success<br></center>");
	out.println("Welcome to:" + uname);
	//if(rs.next() ){
		marks=rs.getInt(3);
		session.setAttribute("marks", marks);
		//}
	response.sendRedirect("studentopt.jsp");
	}
else{
	out.println("Invalid password<br>");
	out.println("plese<a href='login.jsp'>login</a>");
	}
/* if(rs1.next() ){
marks=rs1.getInt(0);
session.setAttribute("marks", marks);
}
*/
/*  if(rs.next() ){
marks=rs.getInt(3);
session.setAttribute("marks", marks);
}  */

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