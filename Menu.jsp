<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Menu</title>
		<style type="text/css">
	
		</style>
	</head>

	<body background='image\7.png'>
		<!--累計來訪次數-->
		<%
			try
			{
				//載入Database Driver
				Class.forName("com.mysql.jdbc.Driver");
				try
				{
					//Bulid Connection
					String url = "jdbc:mysql://localhost/";
					String sql = "";
					String counter_db = "";
					String counter_str = "";
					int counter_int = 0;
					Object counter_ojb;
					ResultSet temp;
					Connection con = DriverManager.getConnection(url, "root", "696969888");
					
					//測試是否連線成功
					if (con.isClosed())
					{
						out.print("連線失敗");
					}
					else
					{
						//選擇Database
						sql = "use mydatabase";
						con.createStatement().execute(sql);
						
						//執行SQL指令：查詢資料
						sql = "select count from counter";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							counter_db = String.valueOf(temp.getString(1));
						}
						
						//設定計數器
						application.setAttribute("counter_appli",counter_db);
						counter_ojb = application.getAttribute("counter_appli");
						counter_str = String.valueOf(counter_ojb);
						counter_int = Integer.parseInt(counter_str);

						//利用isNew()來控制計數器的數值
						if (session.isNew())
						{
							counter_int++;
						}
						else
						{
							counter_int = counter_int;
						}
						
						//執行SQL指令：修改資料，將計數器的值放回資料庫
						sql = "update counter set count='" + counter_int + "';";
						con.createStatement().execute(sql);
						
						//將數值印出來
						out.print("<font Color='#000000' size='5' face='微軟正黑體'><u><b><center>目前共有" + counter_int + "個人來過</center></b></u></font>");
					}
					con.close();
				}
				catch(SQLException sExec)
				{
					out.print("SQL錯誤" + "<br>" + sExec.toString());
				}
			}
			catch(ClassNotFoundException err)
			{
				out.print("Class錯誤" + "<br>" + err.toString());
			}
		%>
		<br>
		<br>
		<!--會員登入(帳號、密碼)-->
		<form name="form01" method="POST" action="check.jsp">
			<table width="100%" border="0">
				<tr>
					<td align="right"><font color="#0000FF" size="5" face="微軟正黑體"><b>帳號：</b></font></td>
					<td><input type="text" name="id" style="font-size:100%;font-family:Microsoft JhengHei;font-weight:bold;"></td>
				</tr>
				<tr>
					<td align="right"><font color="#0000FF" size="5" face="微軟正黑體"><b>密碼：</b></font></td>
					<td><input type="password" name="pwd" style="font-size:100%;font-family:Microsoft JhengHei;font-weight:bold;"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="按我登入" style="font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;color:green"></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="Register.jsp" target="content"><input type="button" value="沒有會員嗎?" style="font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;color:red"></a></td>
				</tr>
			</table>
		</form>
		<br>

		<!--選單-->
		<p align="center">
		<a href="Product1-2.jsp" target="content"><img src='image\\1.png'></a>
		<br>
		<br>
		<a href="Product3-4.jsp" target="content"><img src='image\\2.png'></a>
		<br>
		<br>
		<a href="Product5-6.jsp" target="content"><img src='image\\3.png'></a>
		<br>
		<br>
		<a href="Product7-8.jsp" target="content"><img src='image\\4.png'></a>
		<br>
		<br>
		<a href="Product9-10.jsp" target="content"><img src='image\\5.png'></a>
		<br>
		<br>
		<a href="board.jsp" target="content"><img src='image\\6.png'></a>
		<br>
		<br>
		<a href="TeamMate.html" target="content"><img src='image\\14.png' ></a>
		<br>
		<br>
		<a href="Contact.html" target="content"><img src='image\\8.png' ></a>
		</p>

	</body>
</html>
