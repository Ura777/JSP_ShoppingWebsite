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
			Object obj2 = session.getAttribute("total");
			String str = String.valueOf(obj2);
			int total = Integer.parseInt(str);
			
			
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
						
						String myLevel = "";
						String myAccount = "";
						String new_name="";
						String myName = new String(request.getParameter("memberName").getBytes("ISO-8859-1"),"UTF-8");
						String myPhone = request.getParameter("memberPhone");
						String myAddress = new String(request.getParameter("memberAddress").getBytes("ISO-8859-1"),"UTF-8");
						
						
						
						
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							
							myLevel = temp.getString(8);
							myAccount = temp.getString(3);
							new_name = temp.getString(2);
							
						}
						out.print("<br></br><br></br><br></br><br></br>");
						out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center><u>" + new_name + "</u>安安ﾟ▽ﾟノ<br>請確認以下的訂單資訊是否有誤OωO↓</center></b></font>");
		%>				
						
							<form name="FFFFFFFFF" method="POST" action="Carttransfer4.jsp">
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
										<td><input type="text" name="myAddress" value="<%=myAddress%>" readonly style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></td>
									</tr>
								</table>
								<br>
								
								<%
									//印出購物車內容
						sql = "select * from tempTrade where memberAccount='" + myAccount + "'";
						temp = con.createStatement().executeQuery(sql);
						
						
							sql = "select * from tempTrade where memberAccount='" + myAccount + "'";
							temp = con.createStatement().executeQuery(sql);
							
							out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center>以下是您所訂購的商品資訊OωO↓</center></b></font>");
							
							out.print("<center>");
							out.print("<table border='1',width='100%'>");
							out.print("<tr>");
							out.print("<td align='center'><font Color='#009900' size='5' face='微軟正黑體'><b>&nbsp;清 單&nbsp;<br>編 號</b></font></td>");
							out.print("<td align='center'><font Color='#A52A2A' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>名 稱</b></font></td>");
							out.print("<td align='center'><font Color='#8B6914' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>編 號</b></font></td>");
							out.print("<td align='center'><font Color='#698B22' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>類 型</b></font></td>");
							out.print("<td align='center'><font Color='#CD3333' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>價 格</b></font></td>");
							out.print("<td align='center'><font Color='#EE5C42' size='5' face='微軟正黑體'><b>&nbsp;購 買&nbsp;<br>數 量</b></font></td>");
							out.print("<td align='center'><font Color='#FF1493' size='5' face='微軟正黑體'><b>&nbsp;結帳金額&nbsp;<br>(尚未打折)</b></font></td>");
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
								
								int P = Integer.parseInt(temp.getString(5));
								int Q = Integer.parseInt(temp.getString(6));
								
								out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>" + (P*Q) + "</b></font></td>");
								
								
							}
							out.print("</table>");
						out.print("</center>");
						
						out.print("<br>");				
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							
							myLevel = temp.getString(8);
						}
						out.print("<font Color='#009900' size='6' face='微軟正黑體'><b><center>您的會員階級為：<u>" + myLevel + "</u></center></b></font>");
						
								if (myLevel.equals("GM"))
								{
									out.print("<font Color='#0000FF' size='6' face='微軟正黑體'><b><center>您的索取得的折扣為：<u>" + "5折" + "</u></center></b></font>");
								}
								else if (myLevel.equals("碧池"))
								{
									out.print("<font Color='#0000FF' size='6' face='微軟正黑體'><b><center>您的索取得的折扣為：<u>" + "8折" + "</u></center></b></font>");
								}
								else if (myLevel.equals("一般"))
								{
									out.print("<font Color='#0000FF' size='6' face='微軟正黑體'><b><center>您的索取得的折扣為：<u>" + "9折" + "</u></center></b></font>");
								}
						out.print("<font Color='#FF0000' size='6' face='微軟正黑體'><b><center>因此您的結帳總金額為：<u>" + total + "</u></center></b></font>");
						
						
								%>
								
								<br>
								<input type="submit" name="Next" value="來去下一頁" style="font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;background-color:#FFFFE0;">
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

				out.print("<a href='Carttransfer2.jsp'><input type='button' name='button01' value='回到上一頁' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("<a href='Member.jsp'><input type='button' name='button01' value='回到會員區' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

				out.print("</center>");
				out.print("</p>");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
			}
			
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		%>

	</body>
</html>