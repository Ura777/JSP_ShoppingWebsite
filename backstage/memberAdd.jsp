<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>新增會員</title>
	</head>
	<body>
		<%
			if(session.getAttribute("id") != null )
			{
				out.print("<p align='center'>");
				out.print("<font size='5' face='微軟正黑體'><b>");
				out.print("管理員" + session.getAttribute("id") + "你好<br>");
				out.print("<a href='logout.jsp'><input type='button' name='button01' value='登出' style='font-size:100%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
				out.print("</b></font>");
				out.print("</p>");
		%>
				<form name="form1" method="post" action="addM.jsp">
					<table width="100%">
						<tr>
							<td width="40%"></td>
							<td width="5%">會員姓名：</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td width="40%"></td>
							<td width="4%">會員帳號：</td>
							<td><input type="text" name="account"></td>
						</tr>
						<tr>
							<td width="40%"></td>
							<td width="4%">會員密碼：</td>
							<td><input type="text" name="password"></td>
						</tr>
						<tr>
							<td width="40%"></td>
							<td width="4%">手機號碼：</td>
							<td><input type="text" name="phone"></td>
						</tr>
						<tr>
							<td width="40%"></td>
							<td width="4%">通訊地址：</td>
							<td><input type="text" name="address"></td>
						</tr>
						<tr>
							<td width="40%"></td>
							<td width="4%">電子信箱：</td>
							<td><input type="text" name="email"></td>
						</tr>
					</table>
			
					<p align="center">	
						<input type="submit" name="Submit" value="按我新增"></td>
						<input type="Reset" name="Reset" value="重新填寫"></td>
						<br>
						<br>
						<font color="##FF0000" size="5" face="微軟正黑體"><b>*所有欄位均要填寫喔*</b></font>
					</p>
				</form>	
			
		<%
				out.print("<p align='center'>");
				out.print("<a href='memberM.jsp'><input type='button' name='button01' value='按我返回會員管理系統首頁' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
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
