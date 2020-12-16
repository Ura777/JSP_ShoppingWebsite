<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改資料</title>
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
						
						String myNumber = "";
						String myName = "";
						String myAccount = "";
						String myPassword = "";
						String myPhone = "";
						String myAddress = "";
						String myEmail = "";
						String myLevel = "";
						String myDiscount = "";
						
						
						//執行SQL指令：查詢資料
						sql = "select * from member where id ='" + request.getParameter("change") + "'";
							temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							myNumber = temp.getString(1);
							myName = temp.getString(2);
							myAccount = temp.getString(3);
							myPassword = temp.getString(4);
							myPhone = temp.getString(5);
							myAddress = temp.getString(6);
							myEmail = temp.getString(7);
							myLevel = temp.getString(8);
							myDiscount = temp.getString(9);
						}
						out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center><u>" + myName + "</u>安安ﾟ▽ﾟノ<br>以下是您的會員資訊OωO↓</center></b></font>");
		%>				
						
							<form name="FFFFFFFFF" method="POST" action="Informationrefresh2.jsp">
							<center>
								<table border="0" width="100%">
									<tr>
										<td width="30.5%"></td>
										<td width="15%" align='right'><font Color='#FF0000' size='6' face='微軟正黑體'><b>會員編號：</b></font></td>
										<td><input type="text" name="id" value="<%=myNumber%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#009900' size='6' face='微軟正黑體'><b>會員姓名：</b></font></td>
										<td><input type="text" name="name" value="<%=myName%>" style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#0000FF' size='6' face='微軟正黑體'><b>會員帳號：</b></font></td>
										<td><input type="text" name="account" value="<%=myAccount%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#A52A2A' size='6' face='微軟正黑體'><b>會員密碼：</b></font></td>
										<td><input type="text" name="password" value="<%=myPassword%>" style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#8B6914' size='6' face='微軟正黑體'><b>手機號碼：</b></font></td>
										<td><input type="text" name="phone" value="<%=myPhone%>" style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#698B22' size='6' face='微軟正黑體'><b>通訊地址：</b></font></td>
										<td><input type="text" name="address" value="<%=myAddress%>" style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#CD3333' size='6' face='微軟正黑體'><b>電子信箱：</b></font></td>
										<td><input type="text" name="email" value="<%=myEmail%>" style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#EE5C42' size='6' face='微軟正黑體'><b>會員權限：</b></font></td>
										<td><input type="text" name="level" value="<%=myLevel%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
									<tr>
										<td></td>
										<td align='right'><font Color='#FF1493' size='6' face='微軟正黑體'><b>會員優惠：</b></font></td>
										<td><input type="text" name="discount" value="<%=myDiscount%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
								</table>
								<br>
								<%//out.print("<input type='hidden' name='total' value='" + total + "'>");%>
								<input type="submit" name="Next" value="按我修改" style="font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;background-color:#FFFFE0;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" name="Next" value="按我重寫" style="font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:DimGrey;background-color:#FFFFE0;">
								<br>
								<br>
								<font color="##FF0000" size="6" face="微軟正黑體"><b>*所有表格都要填喔*</b></font>
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

				out.print("<a href='Information.jsp'><input type='button' name='button01' value='回到上一頁' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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