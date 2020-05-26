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
	out.println("Loop enered");
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
String vsql = "select sno,ques,opt1,opt2,opt3,opt4 from questions";
stmt=con.createStatement();
rs=stmt.executeQuery(vsql);
ResultSetMetaData rsmd = rs.getMetaData();
String s1,s2,s3,s4;
int i=1;
while(rs.next())
{

out.println("<form name='exam' action='resultpage.jsp' method='post'><b>" + rs.getString(1)+ " . "  + rs.getString(2)+   "</b><br><br>");
s1 = rs.getString(3);
s2 = rs.getString(4);
s3 = rs.getString(5);
s4 = rs.getString(6);
out.println("<input type=radio name=opt"+i+" value="+1+">"+s1+  " <br><br>");
out.println("<input type=radio name=opt"+i+ " value="+2+ ">"+s2+  "<br><br>");
out.println("<input type=radio name=opt"+i+ " value="+3+ ">"+s3+  "<br><br>");
out.println("<input type=radio name=opt"+i+ " value="+4+ ">"+s4+  "<br><br>");
i++ ;
}
out.println("<input name ='submit' value='Submit' type='submit'/>");
}
//rs = stmt.executeQuery(vsql);
catch(Exception e){
	out.println(e.getMessage());
}finally{
	//close the connection
	try{
		con.close();
	}catch(Exception e1){}
}

%>