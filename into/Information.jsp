<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>會員資訊</title>
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
						
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							myName = temp.getString(2);
						}
						out.print("<br></br><br></br><br></br><br></br>");
						out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center><u>" + myName + "</u>安安ﾟ▽ﾟノ<br>以下是您的會員資料↓OωO</center></b></font>");
						
							sql = "select * from member where account='" + getID + "'";
							temp = con.createStatement().executeQuery(sql);
							
							out.print("<center>");
							out.print("<table border='1',width='100%'>");
							out.print("<tr>");
							out.print("<td align='center'><font Color='#FF0000' size='5' face='微軟正黑體'><b>會員編號</b></font></td>");
							out.print("<td align='center'><font Color='#009900' size='5' face='微軟正黑體'><b>會員姓名</b></font></td>");
							out.print("<td align='center'><font Color='#0000FF' size='5' face='微軟正黑體'><b>會員帳號</b></font></td>");
							out.print("<td align='center'><font Color='#A52A2A' size='5' face='微軟正黑體'><b>會員密碼</b></font></td>");
							out.print("<td align='center'><font Color='#8B6914' size='5' face='微軟正黑體'><b>手機號碼</b></font></td>");
							out.print("<td align='center'><font Color='#698B22' size='5' face='微軟正黑體'><b>通訊地址</b></font></td>");
							out.print("<td align='center'><font Color='#CD3333' size='5' face='微軟正黑體'><b>電子信箱</b></font></td>");
							out.print("<td align='center'><font Color='#EE5C42' size='5' face='微軟正黑體'><b>會員權限</b></font></td>");
							out.print("<td align='center'><font Color='#FF1493' size='5' face='微軟正黑體'><b>會員優惠</b></font></td>");
							out.print("<td align='center'><font Color='#104E8B' size='5' face='微軟正黑體'><b>修改按鈕</b></font></td>");
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
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(7) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(8) + "</b></font></td>");
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + temp.getString(9) + "</b></font></td>");
								out.print("<td align='center'>");
								out.print("<form method='POST' action='Informationrefresh.jsp'>");
								out.print("<input type='hidden' name='change' value='" + temp.getString(1) + "'>");
								out.print("<br>");
								out.print("<input type='submit' value='按我修改' style='font-size:120%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;background-color:#FFFFE0;'>");
								out.print("</form>");
								out.print("</td>");
								out.print("</tr>");
							}
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
				
				
				out.print("<p align='center'>");
				
				out.print("<br>");
				out.print("<br>");
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