<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>定單</title>
	</head>
	<body background='image\view.jpg'>
	
		<%
			if(session.getAttribute("id") != null )
			{
				
				
				
				
				try
			{
				//載入Database Driver
				Class.forName("com.mysql.jdbc.Driver");
				try
				{
					//Bulid Connection
					String url = "jdbc:mysql://localhost/";
					String sql = "";
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
						
						//取得session設定的ID
						Object obj = session.getAttribute("id");
						String getID = String.valueOf(obj);
						String myName = "";
						String myAccount = "";
						
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							myName = temp.getString(2);
							myAccount = temp.getString(3);
						}
						out.print("<br></br><br></br><br></br><br></br>");
						out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center><u>" + myName + "</u>安安ﾟ▽ﾟノ<br>以下是您的訂單OωO↓</center></b></font>");
						
						//印出購物車內容
						sql = "select * from tradeproduct where memberAccount='" + myAccount + "'";
						temp = con.createStatement().executeQuery(sql);
						String total="";
						
						if (temp.first())
						{
							sql = "select * from tradeproduct where memberAccount='" + myAccount + "'";
							temp = con.createStatement().executeQuery(sql);
							
							out.print("<center>");
							out.print("<table border='1',width='100%'>");
							out.print("<tr>");
							out.print("<td align='center'><font Color='#009900' size='5' face='微軟正黑體'><b>&nbsp;訂 單&nbsp;<br>編 號</b></font></td>");
							out.print("<td align='center'><font Color='#A52A2A' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>名 稱</b></font></td>");
							out.print("<td align='center'><font Color='#8B6914' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>編 號</b></font></td>");
							out.print("<td align='center'><font Color='#698B22' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>類 型</b></font></td>");
							out.print("<td align='center'><font Color='#CD3333' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>價 格</b></font></td>");
							out.print("<td align='center'><font Color='#EE5C42' size='5' face='微軟正黑體'><b>&nbsp;購 買&nbsp;<br>數 量</b></font></td>");
							out.print("</tr>");
							while(temp.next())
							{
								out.print("<tr>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(1) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(2) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(3) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(4) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(5) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(6) + "</b></font></td>");
								total = temp.getString(7);
							}
							out.print("</table>");
							out.print("<font Color='#FF0000' size='6' face='微軟正黑體'><b>應付金額(已打折)為：" + total + "</b></font>");
						out.print("</center>");
						}
						else
						{
							out.print("<p align='center'>");
							out.print("<font color='red' size='7' face='微軟正黑體'><b>您沒有任何的清單！</b></font>");
							out.print("</p>");
						}
						
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
				
				
				out.print("<p align='center'>");
				out.print("<a href='Member.jsp'><input type='button' name='button01' value='回到會員區' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("</p>");
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		%>

	</body>
</html>