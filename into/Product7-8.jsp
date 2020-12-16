<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head><title>後庭系列OωO</title></head>
	<body background='image\8.jpg'>
		<!--跑馬燈印折刻資訊-->
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
						String myLevel = "";
						
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							myLevel = temp.getString(8);
						}
						
						if (myLevel.equals("GM"))
						{
		%>					
						<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#0000FF" size="8" face="微軟正黑體"><b>您的階級是GMﾟ▽ﾟノ可以獲得5折的折扣OωO</b></font></marquee>
						<br>
						<br>	
		<%					
						}
						else if (myLevel.equals("碧池"))
						{
		%>					
						<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#0000FF" size="8" face="微軟正黑體"><b>您的階級是碧池ﾟ▽ﾟノ可以獲得8折的折扣OωO</b></font></marquee>
						<br>
						<br>	
		<%		
						}
						else if (myLevel.equals("一般"))
						{
		%>					
						<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#0000FF" size="8" face="微軟正黑體"><b>您的階級是一般ﾟ▽ﾟノ可以獲得9折的折扣OωO</b></font></marquee>
						<br>
						<br>	
		<%		
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
				
			}
			else
			{
				out.print("<p align='center'>");
				out.print("<font color='red' size='7' face='微軟正黑體'><b>您尚未登入，請登入！</b></font>");
				out.print("<br>");
				out.print("<font size='6' face='微軟正黑體'><b>3秒鐘後將自動轉回登錄頁面</b></font>");
				out.print("</p>");
				out.print("<meta http-equiv='refresh' content='3;url=../index.html'>");
			}
		%>
		
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
					String picturePath = "";
					String color = "";
					String limitCondition = "後庭";  //SQL的where條件句
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
						
						//執行SQL指令：查詢資料
						sql = "select id,name,introduce01,introduce02,imagepath,price,quantity from product where type='" + limitCondition +"'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						out.print("<table border='1',width='100%'>");
						while(temp.next())
						{
							//先取得存貨數量
							int Q = Integer.parseInt(temp.getString(7));
							
							if (temp.getString(5).equals(""))
							{
								picturePath = "image\\product\\empty.jpg";
							}
							else
							{
								picturePath = temp.getString(5) + "\\" + temp.getString(1) + ".jpg";
							}
							
							//預先畫好要留給訂購按鈕的位置
							if (Q>0)
							{
								if (temp.getString(1).equals("7"))
								{
									out.print("<tr>" + "<td rowspan='6' width='40%'>" + "<a href='http://www.changxinshangcheng.com/goods-1269.html' target='_blank'><img src = " + picturePath + " >" + "</a></td>");
								}
								else if (temp.getString(1).equals("8"))
								{
									out.print("<tr>" + "<td rowspan='6' width='40%'>" + "<a href='https://www.youtube.com/watch?v=0fZVGvcEIvA' target='_blank'><img src = " + picturePath + " >" + "</a></td>");
								}
								else
								{
									out.print("<tr>" + "<td rowspan='6' width='40%'>" + "<img src = " + picturePath + " >" + "</td>");
								}
								
							}
							else
							{
								if (temp.getString(1).equals("7"))
								{
									out.print("<tr>" + "<td rowspan='5' width='40%'>" + "<a href='http://www.changxinshangcheng.com/goods-1269.html' target='_blank'><img src = " + picturePath + " >" + "</a></td>");
								}
								else if (temp.getString(1).equals("8"))
								{
									out.print("<tr>" + "<td rowspan='5' width='40%'>" + "<a href='https://www.youtube.com/watch?v=0fZVGvcEIvA' target='_blank'><img src = " + picturePath + " >" + "</a></td>");
								}
								else
								{
									out.print("<tr>" + "<td rowspan='5' width='40%'>" + "<img src = " + picturePath + " >" + "</td>");
								}
								
							}
							
							out.print("<td width='5%' align='center'>" + "<font color='#EE0000' size='5' face='微軟正黑體'>" + "<b>" + "&nbsp;商 品&nbsp;" + "<br>" + "&nbsp;名 稱&nbsp;" + "</b>" + "</font>" +"</td>");
							if (temp.getString(1).equals("7"))
							{
								color = "#FF7F24";
							}
							else if (temp.getString(1).equals("8"))
							{
								color = "#CD6600";
							}
							else
							{
								color = "#000000";
							}
							out.print("<td width='55%' align='center'>" + "<font color='" + color + "' size='6' face='微軟正黑體'>" + "<b>" + temp.getString(2) + "</b>" + "</font>" + "</td>" + "</tr>");
							
							out.print("<td width='5%'align='center'>" + "<font color='#4B0082' size='5' face='微軟正黑體'>" + "<b>" + "&nbsp;商 品&nbsp;" + "<br>" + "&nbsp;說 明&nbsp;" + "</b>" + "</font>" + "</td>");
							out.print("<td width='55%'>" + "<font color='#8A2BE2' size='5' face='微軟正黑體'>" + "<b>" + temp.getString(3) + "</font>" + "</b>" + "</td>" + "</tr>");
							
							out.print("<tr>" + "<td width='5%'align='center'>" + "<font color='#0000CD' size='5' face='微軟正黑體'>" + "<b>" + "&nbsp;商 品&nbsp;" + "<br>" + "&nbsp;介 紹&nbsp;" + "</b>" + "</font>" + "</td>");
							out.print("<td width='55%'>" + "<font color='#8B0000' size='5' face='微軟正黑體'>" + "<b>" + temp.getString(4) + "</b>" + "</font>" + "</td>" + "</tr>");
							
							out.print("<tr>" + "<td width='5%'align='center'>" + "<font color='#006400' size='5' face='微軟正黑體'>" + "<b>" + "&nbsp;價 格&nbsp;" + "</b>" + "</font>" + "</td>");
							out.print("<td width='55%'>" + "<font color='#FF3030' size='5' face='微軟正黑體'>" + "<b>$" + temp.getString(6) + "</b>" + "</font>" + "</td>" + "</tr>");
							
							out.print("<tr>" + "<td width='5%'align='center'>" + "<font color='#A0522D' size='5' face='微軟正黑體'>" + "<b>" + "&nbsp;存 貨&nbsp;" + "</b>" + "</font>" + "</td>");
							//存貨<=0會印出缺貨中
							if (Q>0)
							{
								out.print("<td width='55%'>" + "<font color='#2F4F4F' size='5' face='微軟正黑體'>" + "<b>" + temp.getString(7) + "個</b>" + "</font>" + "</td>" + "</tr>");
								//印出訂購按鈕
								out.print("<td width='5%'align='center'>" + "<font color='#B03060' size='5' face='微軟正黑體'>" + "<b>" + "&nbsp;購 買&nbsp;" + "<br>" + "&nbsp;按 此&nbsp;" + "</b>" + "</font>" + "</td>");
								out.print("<td><br>");
								out.print("<form method='POST' action='buy.jsp'>");
								out.print("<input type='hidden' name='change' value='" + temp.getString(1) + "'>");
								out.print("<input type='submit' value='按我購買' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;background-color:#FFFFE0;'>");
								out.print("</form>");
								out.print("</td>");
								out.print("</tr>");
							}
							else
							{
								out.print("<td width='55%'>" + "<font color='#FF0000' size='5' face='微軟正黑體'>" + "<b>" + "缺貨中" + "</b>" + "</font>" + "</td>" + "</tr>");
							}
						}
						out.print("</table>");
						
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
				
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		
			
		%>
		
	</body>
</html>