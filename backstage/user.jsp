<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>後台管理系統</title>
	</head>
	<body>
	
		<%
			if(session.getAttribute("id") != null )
			{
				out.print("<p align='center'>");
				out.print("<font size='5' face='微軟正黑體'><b>");
				out.print("登入成功<br>");
				out.print("管理員" + session.getAttribute("id") + "你好<br>");
				out.print("<a href='logout.jsp'><input type='button' name='button01' value='登出' style='font-size:100%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
				out.print("</b></font>");
				out.print("<br>");
				out.print("<a href='productM.jsp'><input type='button' name='button01' value='商品管理' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("<a href='memberM.jsp'><input type='button' name='button01' value='會員管理' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("<a href='tradeM.jsp'><input type='button' name='button01' value='訂單管理' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("</p>");
			}
			else
			{
				out.print("<p align='center'>");
				out.print("<font color='red' size='7' face='微軟正黑體'><b>您尚未登入，請登入！</b></font>");
				out.print("<br>");
				out.print("<font size='6' face='微軟正黑體'><b>3秒鐘後將自動轉回登錄頁面</b></font>");
				out.print("</p>");
				out.print("<meta http-equiv='refresh' content='3;url=login.html'>");
			}
		%>

	</body>
</html>