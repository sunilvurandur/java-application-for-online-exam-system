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
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	String vsql = "select * from questions";
	stmt=con.createStatement();
	rs = stmt.executeQuery( vsql );
ResultSetMetaData rsmd = rs.getMetaData();
String s1,s2,s3,s4;
int i=1;
int count=0;
//out.println("<h2><br><br><center><table border=1 cellpadding=2 cellspacing=2><tr><th>Question</th><th>Your Answer</th><th>Correct Answer</th><th>Status</th></tr>");
while(rs.next()){
	//s1=rs.getString(1);
	s2=request.getParameter("opt"+i);
	//out.print("From html"+s2);
	s3=rs.getString(7);
	//out.println("From databse"+s3);
	if(s2.equals(s3)){
		count++;
	}	
	else
		i++;
}
%><body bgcolor="grey">
<div style="position:absolute;left:600px;top:250px;background-color:white;padding:10px;border-radius: 1cm;">
your marks is <%=count %><br>
you can <a href='logout.jsp'>logout</a>now
</div>
</body>
<%//rs = stmt.executeQuery(vsql);
i++;
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