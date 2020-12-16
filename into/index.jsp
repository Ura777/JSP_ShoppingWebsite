<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="image\favicon.ico" rel="SHORTCUT ICON">
		<title>尋找你的~♥濕樂園♥~</title>
	</head>
	<%
			if(session.getAttribute("id") != null )
			{
	%>
			<frameset rows="260,*" cols="*">
				<frame src="title.jsp" name="logo" scrolling="no" noresize>
				<frameset rows="*" cols="324,*">
					<frame src="Menu.jsp" name="menu" scrolling="yes" noresize>
					<frame src="FirstPage.jsp" name="content" scrolling="yes">
				</frameset>
				<noframes>
					<body>
						<p>測試用/p>
					</body>
				</noframes>
			</frameset>
	<%
			}
			else
			{
				out.print("<body>");
				out.print("<p align='center'>");
				out.print("<font color='red' size='7' face='微軟正黑體'><b>您尚未登入，請登入！</b></font>");
				out.print("<br>");
				out.print("<font size='6' face='微軟正黑體'><b>3秒鐘後將自動轉回登錄頁面</b></font>");
				out.print("</p>");
				out.print("<meta http-equiv='refresh' content='3;url=../index.html'>");
				out.print("</body>");
			}
		%>
	
	
</html>
