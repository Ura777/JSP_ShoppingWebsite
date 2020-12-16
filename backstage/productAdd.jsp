<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>新增商品</title>
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
				<form name="form1" method="post" action="addP.jsp">
					<table width="100%">
						<tr>
							<td width="38.5%"></td>
							<td width="5%">商品名稱：</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td width="38.5%"></td>
							<td width="4%">商品類型：</td>
							<td>
								<select name="type">
									<option value="飛機杯" selected>飛機杯</option>
									<option value="陽具">陽具</option>
									<option value="套套">套套</option>
									<option value="後庭">後庭</option>
									<option value="潤滑液">潤滑液</option>
								</select>
							</td>
						</tr>
						<tr>
							<td width="38.5%"></td>
							<td width="4%">商品說明：</td>
							<td><textarea rows=5 cols=30 name="introduce01"></textarea></td>
						</tr>
						<tr>
							<td width="38.5%"></td>
							<td width="4%">商品介紹：</td>
							<td><textarea rows=5 cols=30 name="introduce02"></textarea></td>
						</tr>
						<tr>
							<td width="38.5%"></td>
							<td width="4%">商品售價：</td>
							<td><input type="text" name="price"></td>
						</tr>
						<tr>
							<td width="38.5%"></td>
							<td width="4%">商品數量：</td>
							<td><input type="text" name="quantity"></td>
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
				out.print("<a href='productM.jsp'><input type='button' name='button01' value='按我返回商品管理系統首頁' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
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
