<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<html>
	<meta http-equiv="Content-Type" content="text/html"; charset=utf-8>
	<head>
		<title>聯絡方式</title>
	</head>
	<body background='image\child.jpg'>
	<%
			if(session.getAttribute("id") != null )
			{
	%>
				<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#D2691E" size="8" face="微軟正黑體"><b>我等是第11組OωO</b></font></marquee>
		<br>
		<br>
		<center>
			<table border="1">
				<tr>
					<td align="center"><img src="image/10344210.jpg"></td>
					<td align="center"><img src="image/10344220.png"></td>
				</tr>
				<tr>
					<td align="center">
						<font size="6" face="微軟正黑體" color="#0000FF"><b>10344210</b></font></td>
					<td align="center">
						<font size="6" face="微軟正黑體" color="#0000FF"><b>10344220</b></font></td>
				</tr>
				<tr>
					<td align="center">
						<font size="6" face="微軟正黑體" style="color:green"><b>陳紹宜</b></font></td>
					<td align="center">
						<font size="6" face="微軟正黑體" style="color:green"><b>廖柄淦</b></font></td>
				</tr>
				<tr>
					<td align="center">
						<font size="6" face="微軟正黑體" color="#FF0000"><b>美工</b></font></td>
					<td align="center">
						<font size="6" face="微軟正黑體" color="#FF0000"><b>程式</b></font></td>
				</tr>
			</table>
		</center>

	<%
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
	%>
	
	
	
		
	</body>
</html>