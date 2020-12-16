<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>FirstPage</title>
	</head>

	<body background='image\girl.gif' >
	<center>
	<img src='image\\gif.gif' width="50%" height="200">
	<p>
		<form name="form01" method="POST" action="result.jsp">
			<table>
				<tr>
					<td></td>
					<td><input type="text" name="keyword" size="30" style="font-size:150%;"></td>
					<td><input type="submit" name="Submit" value="♥按我查詢商品♥" style="font-size:150%;color:DeepPink;font-family:Microsoft JhengHei;font-weight:bold;background-color:LightGoldenRodYellow ;"></td>
				</tr>
			</table>
		</form>
	</center>	
	<p>	
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
							out.print("<center>");
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
							out.print("</center>");
							
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
