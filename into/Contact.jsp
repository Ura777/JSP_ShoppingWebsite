<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<html>
	<meta http-equiv="Content-Type" content="text/html"; charset=utf-8>
	<head>
		<title>聯絡方式</title>
	</head>
	<body>
	<%
			if(session.getAttribute("id") != null )
			{
	%>
				<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#FF8C00" size="8" face="微軟正黑體"><b>這是我們的聯絡方式↓OωO</b></font></marquee>
				<center>
				<img src="image/address.png">
				<br>
				<font size="7" color="#8B1A1A" face="微軟正黑體"><b>320桃園市中壢區中北路200號資館樓609</b></font>
				<br>
				<a href="mailto:av1869@r20.suck.dick"><img src="image/mail.png"></a>
				<br>
				<br>
				<img src="image/phone01.png">
				<br>
				<font size="7" color="#0000FF" face="微軟正黑體"><b>0800-092-000</b></font>
				<br>
				<br>
				<img src="image/phone02.png">
				<br>
				<font size="7" color="#698B22" face="微軟正黑體"><b>03-265-5401</b></font>
				<br>
				<br>
				<img src="image/fax.png">
				<br>
				<font size="7" color="#FF7F24" face="微軟正黑體"><b>03-594-8888</b></font>
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