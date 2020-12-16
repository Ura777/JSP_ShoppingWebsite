<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<head>
		<title>新增商品</title>
	</head>
	<body background='image\view.jpg'>
		<%
			if(session.getAttribute("id") != null )
			{
				out.print("<br></br><br></br><br></br><br></br>");
				out.print("<p align='center'>");
				out.print("<font color='red' size='7' face='微軟正黑體'><b>修改成功！！！</b></font>");
				out.print("</p>");
				out.print("<br>");
				
				out.print("<form name='fffff' method='POST' action='backtoMember.jsp'>");
				out.print("<table width='100%'>");
				out.print("<tr>");
				out.print("<td width='38.5%'></td>");
				out.print("<td width='7%'></td>");
				out.print("<td><input type='submit' name='button01' value='按我回到會員區' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'><br></td>");
				out.print("</tr>");
				out.print("</table>");
				out.print("</form>");
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		%>
	</body>
</html>
