<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>變成清單</title>
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
						String myLevel = "";
						String myPhone = "";
						String myAddress = "";
						
						
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							myName = temp.getString(2);
							myAccount = temp.getString(3);
							myLevel = temp.getString(8);
							myPhone = temp.getString(5);
							myAddress = temp.getString(6);
						}
						out.print("<br></br><br></br><br></br><br></br>");
						out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center><u>" + myName + "</u>安安ﾟ▽ﾟノ<br>以下是您要成立訂單的資訊OωO↓</center></b></font>");
		%>				
						
							<form name="FFFFFFFFF" method="POST" action="Carttransfer3.jsp">
							<center>
								<table border="0" width="100%">
									<tr>
										<td width="30.5%"></td>
										<td width="15%" align='right'><font Color='#009900' size='6' face='微軟正黑體'><b>取貨姓名：</b></font></td>
										<td><input type="text" name="memberName" value="<%=myName%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#8B6914' size='6' face='微軟正黑體'><b>手機號碼：</b></font></td>
										<td><input type="text" name="memberPhone" value="<%=myPhone%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#0000FF' size='6' face='微軟正黑體'><b>取貨方式：</b></font></td>
										<td><input type="text" name="memberTradeWay" value="一律皆為宅配到府" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#698B22' size='6' face='微軟正黑體'><b>送貨地址：</b></font></td>
										<td><input type="text" name="memberAddress" value="<%=myAddress%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
								</table>
								<br>
								<%//out.print("<input type='hidden' name='total' value='" + total + "'>");%>
								<input type="submit" name="Next" value="來去下一頁" style="font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;background-color:#FFFFE0;">
								<br>
								<br>
								<font color="##FF0000" size="6" face="微軟正黑體"><b>*欲修改上述資料請至<u>會員區</u>的<u>我的資料</u>*</b></font>
							</center>	
							</form>
						
		<%				
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
				

				out.print("<center>");

				out.print("<a href='Carttransfer.jsp'><input type='button' name='button01' value='回到上一頁' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("<a href='Member.jsp'><input type='button' name='button01' value='回到會員區' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

				out.print("</center>");
				out.print("</p>");
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		%>

	</body>
</html>