<body align="center" bgcolor="grey">
<div style="position:absolute;left:600px;top:250px;background-color:green;padding:10px;border-radius: 1cm;">			<b></b>
<form >
<table>
<tr>
<td><%
int marks=(Integer)session.getAttribute("marks");
out.println("you marks are:"+marks);
if(marks>=30){
	%>
	<a href="startexam.jsp">startexam</a>
	<%
}
else 
	out.println("better luck next time");
%>

</table>
</form>
</div>


</body>