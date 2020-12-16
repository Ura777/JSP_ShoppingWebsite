<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>留言版</title>
	</head>
	<body background='image\Flower.jpg'>
		<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#FF8C00" size="8" face="微軟正黑體"><b>歡迎各位訪客在此暢所欲言OωO</b></font></marquee>
		<br>
	<center>	
		<form name="form1" method="post" action="add.jsp">
		
			<table width="100%" border="0">
				<tr>
					<td width="38.5%"></td>
					<td width="5%"><font size="5" face="微軟正黑體"><b>姓名：</b></font></td>
					<td><input type="text" name="name" style="font-size:100%;"></td>
				</tr>
				<tr>
					<td></td>
					<td><font size="5" face="微軟正黑體"><b>郵件：</b></font></td>
					<td><input type="text" name="mail" style="font-size:100%;"></td>
				</tr>
				<tr>
					<td></td>
					<td><font size="5" face="微軟正黑體"><b>主題：</b></font></td>
					<td><input type="text" name="subject" style="font-size:100%;"></td>
				</tr>
				<tr>
					<td></td>
					<td><font size="5" face="微軟正黑體"><b>內容：</b></font></td>
					<td><textarea rows=5 cols=30 name="content" style="font-size:100%;"></textarea></td>
				</tr>
			</table>
			
			<p>	
				<input type="submit" name="Submit" value="按我送出" style="font-size:150%;color:blue;font-family:Microsoft JhengHei;font-weight:bold;">
				<input type="Reset" name="Reset" value="重新填寫" style="font-size:150%;color:red;font-family:Microsoft JhengHei;font-weight:bold;">
				<a href="view.jsp?page=1"><input type="button" name="Go" value="按我看廢文" style="font-size:150%;color:green;font-family:Microsoft JhengHei;font-weight:bold;"></a>
				<br>
				<br>
				<font color="##FF0000" size="5" face="微軟正黑體"><b>*所有欄位均要填寫喔*</b></font>
		</form>	
	</center>	
			
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
						int adNumber = 0;
						int adNumber_previous = 0;
						int adNumber_previous2 = 0;
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
							
							//隨機廣告(利用表格置中)
							//利用last()跟getRow()取得廣告的總數量
							sql="select * from advertisement";
							temp = con.createStatement().executeQuery(sql);
							temp.last();
							int adTotal=temp.getRow();
							
							Random rdn = new Random();
							out.print("<p align='center'>");
							out.print("<table border='0',width='100%'>");
							out.print("<tr>");
							for (int i=1; i<=3; i++)
							{
								//隨機亂數
								adNumber = (rdn.nextInt(adTotal)+1);
							
								if (i==1)
								{
									//執行SQL指令：查詢資料
									sql = "select id,imagepath,link,alternate,adcontent from advertisement where id='" + adNumber + "'";
									temp = con.createStatement().executeQuery(sql);
							
									//印出有超連結的圖片
									while(temp.next())
									{
										out.print("<td><a href='" + temp.getString(3) + "' target='_blank'><img src='" + temp.getString(2) + "\\" + adNumber + ".jpg' alt='" + temp.getString(4) + "'></a></td>");
									}
									adNumber_previous = adNumber;
								}
								else if (i==2)
								{
									if (adNumber == adNumber_previous)
									{
										i--;
									}
									else
									{
										//執行SQL指令：查詢資料
										sql = "select id,imagepath,link,alternate,adcontent from advertisement where id='" + adNumber + "'";
										temp = con.createStatement().executeQuery(sql);
							
										//印出有超連結的圖片
										while(temp.next())
										{
											out.print("<td><a href='" + temp.getString(3) + "' target='_blank'><img src='" + temp.getString(2) + "\\" + adNumber + ".jpg' alt='" + temp.getString(4) + "'></a></td>");
										}
										adNumber_previous2 = adNumber;
									}
								}
								else if (i==3)
								{
									if ((adNumber == adNumber_previous) || (adNumber == adNumber_previous2))
									{
										i--;
									}
									else
									{
										//執行SQL指令：查詢資料
										sql = "select id,imagepath,link,alternate,adcontent from advertisement where id='" + adNumber + "'";
										temp = con.createStatement().executeQuery(sql);
								
										//印出有超連結的圖片
										while(temp.next())
										{
											out.print("<td><a href='" + temp.getString(3) + "' target='_blank'><img src='" + temp.getString(2) + "\\" + adNumber + ".jpg' alt='" + temp.getString(4) + "'></a></td>");
										}
									
									}
								}
							}
							out.print("</tr>");
							out.print("</table>");
						
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
			
			
			
		

	</body>
</html>
