<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>尋找你的~♥濕樂園♥~</title>
	</head>
	<body>
	
		<%
			out.print("<p align='center'>");
			out.print("<font color='red' size='7' face='微軟正黑體'><b>您尚未登入，請登入！</b></font>");
			out.print("<br>");
			out.print("<font size='6' face='微軟正黑體'><b>3秒鐘後將自動轉回登錄頁面</b></font>");
			out.print("</p>");
			out.print("<meta http-equiv='refresh' content='3;url=getout.jsp'>");
		%>

	</body>
</html>