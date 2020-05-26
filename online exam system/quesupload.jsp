<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%!
PreparedStatement pstmt;
Connection con;
//ResultSet rs;
%>
<%
try{
String sno = request.getParameter("sno");
String ques = request.getParameter("ques");
String opt1 = request.getParameter("opt1");
String opt2 = request.getParameter("opt2");
String opt3 = request.getParameter("opt3");
String opt4 = request.getParameter("opt4");
String ans = request.getParameter("ans");
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
String vsql = "insert into questions values(?,?,?,?,?,?,?)";
pstmt=con.prepareStatement(vsql);
pstmt.setString(1, sno);
pstmt.setString(2,ques);
pstmt.setString(3,opt1);
pstmt.setString(4,opt2);
pstmt.setString(5,opt3);
pstmt.setString(6,opt4);
pstmt.setString(7,ans);
int n=pstmt.executeUpdate();
out.println("successufully update<br>");
out.println("your ques is:"+ques);
out.println("you want to upload a question<a href='uploadques.jsp'>upload</a><br>");
out.println("or you want<a href='logout.jsp'>logout</a>");
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