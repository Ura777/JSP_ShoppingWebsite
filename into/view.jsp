<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<head>
		<title>列出所有留言</title>
	</head>
	<body background='image\hi.jpg'>
		<marquee http-equiv="alternate" scrollamount="10" onMouseOver="this.stop()" onMouseOut="this.start()"><font color="#9B30FF" size="8" face="微軟正黑體"><b>這裡是留言的屍體集中管理處OωO</b></font></marquee>
		<br>
		<%
			if(session.getAttribute("id") != null )
			{
				try 
			{
				//Step 1: 載入資料庫驅動程式 
				Class.forName("com.mysql.jdbc.Driver");
				try 
				{
					//Step 2: 建立連線 	
					String url="jdbc:mysql://localhost/";
					String sql="";
					int adNumber = 0;
					int adNumber_previous = 0;
					int adNumber_previous2 = 0;
					ResultSet temp;
					Connection con=DriverManager.getConnection(url,"root","696969888");
					if(con.isClosed())
					{
						out.println("連線建立失敗");
					}
					else 
					{
						//Step 3: 選擇資料庫   
						sql="use mydatabase";
						con.createStatement().execute(sql);
					
						//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
						sql="select * from guestbook"; //算出共幾筆留言
						ResultSet rs=con.createStatement().executeQuery(sql);

						//先移到檔尾, getRow()後, 就可知道共有幾筆記錄
						rs.last();
						
						//先將總筆數記錄起來，最後再印出
						int total_content=rs.getRow();
						
						//每頁顯示5筆, 算出共幾頁
						int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
						
						//讀取page變數
						String page_string = request.getParameter("page");
						if ((page_string == null) || (page_string == "") || (Integer.valueOf(page_string)<=0))
						{
							page_string = "0"; 
						}
						else if (Integer.valueOf(page_string)>page_num)
						{
							page_string = String.valueOf(page_num);
						}
						int current_page=Integer.valueOf(page_string);
						if(current_page==0) //若未指定page, 令current_page為1
						{
							current_page=1;
						}
						
						
						//計算開始記錄位置   
						//Step 5: 顯示結果 
						int start_record=(current_page-1)*5;
					
						//遞減排序, 讓最新的資料排在最前面
						sql="select * from guestbook order by no desc limit ";
						sql+=start_record+",5";
						rs=con.createStatement().executeQuery(sql);
						
						
						//逐筆顯示, 直到沒有資料(最多還是5筆)
						while(rs.next())
						{
							out.print("<font size='5' color='#A0522D' face='微軟正黑體'><b>" + "大家安安ﾟ▽ﾟノ 我是第" + rs.getString(1) + "樓OωO↓" + "</b></font>");
							out.print("<br>");
							out.print("<table border='1' width='100%'>");
							out.print("<tr>");
							out.print("<td width='7%'><font size='5' color='#EE0000' face='微軟正黑體'><p align='center'><b>" + "留言主題" + "</b></p></font></td>");
							out.print("<td><font size='5' color='#FF7F24' face='微軟正黑體'><b>" + rs.getString(4) + "</b></font></td>");
							out.print("</tr>");
							
							
							out.print("<tr>");
							out.print("<td width='7%'><font size='5' color='#8DB6CD' face='微軟正黑體'><p align='center'><b>" + "留言者" + "</b></p></font></td>");
							out.print("<td><font size='5' color='#7A378B' face='微軟正黑體'><b>" + rs.getString(2) + "</b></font></td>");
							out.print("</tr>");
							
							out.print("<tr>");
							out.print("<td width='7%'><font size='5' color='#4B0082' face='微軟正黑體'><p align='center'><b>" + "E-mail" + "</b></p></font></td>");
							out.print("<td><font size='5' color='#458B74' face='微軟正黑體'><b>" + rs.getString(3) + "</td>");
							out.print("</tr>");
							out.print("<tr>");
							out.print("<td width='7%'><font size='5' color='#0000CD' face='微軟正黑體'><p align='center'><b>" + "留言內容" + "</b></p></font></td>");
							out.print("<td><font size='5' color='#EE9A00' face='微軟正黑體'><b>" + rs.getString(5) + "</td>");
							out.print("</tr>");
							out.print("<tr>");
							out.print("<td width='7%'><font size='5' color='#8E8E38' face='微軟正黑體'><p align='center'><b>" + "留言時間" + "</b></p></font></td>");
							out.print("<td><font size='5' color='#FF83FA' face='微軟正黑體'><b>" + rs.getString(6) + "</td>");
							out.print("</tr>");
							
							
							out.print("<tr>");
							out.print("<td width='7%'><font size='5' color='#3A5FCD' face='微軟正黑體'><p align='center'><b>" + "留言IP" + "</b></p></font></td>");
							out.print("<td><font size='5' color='#A52A2A' face='微軟正黑體'><b>" + rs.getString(7) + "</b></font></td>");
							out.print("</tr>");
							
							out.print("</table>");
							out.print("<br>");
						}
					
						
						
						out.print("<p align='center'>");
						//印出共有多少筆留言
						out.println( "<font size='6' color='#6B8E23' face='微軟正黑體'><b>" + "總共有<font color='#8B1A1A'>" + total_content + "</font>筆留言" + "</b></font>");
						out.print("<br>");
						out.print("<br>");
						
						//返回填寫留言的地方
						out.print("<a href='board.jsp'><input type='button' name='Go' value='按我發廢文' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;background-color:#FFFFE0;'></a>");
						out.print("<br>");
						out.print("</p>");
	
						//使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
						//可以自由輸入頁碼並跳轉到該頁
						out.print("<table width='100%'>");
						out.print("<tr>");
						out.print("<td width='44%'></td>");
						out.print("<td><form name='f' action='view.jsp' method='get'><font size='6' color='#6B8E23' face='微軟正黑體'><b>跳至<input type='text' size='2' name='page' value=1 style='font-size:80%;font-family:Microsoft JhengHei;font-weight:bold;color:#8B1A1A;text-align:center;'>頁<input type='submit' value='送出' style='font-size:80%;font-family:Microsoft JhengHei;font-weight:bold;color:red;background-color:#FFFFE0;'></b></font></form></td>");
						out.print("</tr>");
						out.print("</table>");
						
						//以圖示來連結頁數
						out.print("<p align='center'>");
						if (current_page==1)
						{
							out.print("<a href='view.jsp?page=1'><img src='image\\first.png'></a>");
							out.print("<a href='view.jsp?page=1'><img src='image\\previous.png'></a>");
							
							//建立1,2,...頁超連結
							for(int i=1;i<=page_num;i++)
							{
								//修改文字連結的顏色、刪除底線，用不同顏色來表示目前所在的頁面
								if (current_page==i)
								{
									out.print("<font size='7'><a href='view.jsp?page="+i+"' style='text-decoration:none;color:red;'>"+i+"</a>&nbsp;</font>"); //&nbsp;html的空白
								}
								else
								{
									out.print("<font size='7'><a href='view.jsp?page="+i+"' style='text-decoration:none;color:blue;'>"+i+"</a>&nbsp;</font>"); //&nbsp;html的空白
								}
							}
							out.print("<a href='view.jsp?page=" + (current_page+1) + "'><img src='image\\next.png'></a>");
							out.print("<a href='view.jsp?page=" + page_num + "'><img src='image\\last.png'></a>");
						}
						else if ((current_page<page_num))
						{
							out.print("<a href='view.jsp?page=1'><img src='image\\first.png'></a>");
							out.print("<a href='view.jsp?page=" + (current_page-1) + "'><img src='image\\previous.png'></a>");
							
							//建立1,2,...頁超連結
							for(int i=1;i<=page_num;i++)
							{
								//修改文字連結的顏色、刪除底線，用不同顏色來表示目前所在的頁面
								if (current_page==i)
								{
									out.print("<font size='7'><a href='view.jsp?page="+i+"' style='text-decoration:none;color:red;'>"+i+"</a>&nbsp;</font>"); //&nbsp;html的空白
								}
								else
								{
									out.print("<font size='7'><a href='view.jsp?page="+i+"' style='text-decoration:none;color:blue;'>"+i+"</a>&nbsp;</font>"); //&nbsp;html的空白
								}
							}
							out.print("<a href='view.jsp?page=" + (current_page+1) + "'><img src='image\\next.png'></a>");
							out.print("<a href='view.jsp?page=" + page_num + "'><img src='image\\last.png'></a>");
						}
						else if (current_page==page_num)
						{
							out.print("<a href='view.jsp?page=1'><img src='image\\first.png'></a>");
							out.print("<a href='view.jsp?page=" + (current_page-1) + "'><img src='image\\previous.png'></a>");
							
							//建立1,2,...頁超連結
							for(int i=1;i<=page_num;i++)
							{
								//修改文字連結的顏色、刪除底線，用不同顏色來表示目前所在的頁面
								if (current_page==i)
								{
									out.print("<font size='7'><a href='view.jsp?page="+i+"' style='text-decoration:none;color:red;'>"+i+"</a>&nbsp;</font>"); //&nbsp;html的空白
								}
								else
								{
									out.print("<font size='7'><a href='view.jsp?page="+i+"' style='text-decoration:none;color:blue;'>"+i+"</a>&nbsp;</font>"); //&nbsp;html的空白
								}
							}
							out.print("<a href='view.jsp?page=" + page_num + "'><img src='image\\next.png'></a>");
							out.print("<a href='view.jsp?page=" + page_num + "'><img src='image\\last.png'></a>");
						}
						out.print("</p>");
						
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
						
						//Step 6: 關閉連線
						con.close();
					}
				}
				catch (SQLException sExec)
				{
					out.println("SQL錯誤");	   
				}
			}
			catch (ClassNotFoundException err)
			{
				out.println("class錯誤");
			}
				
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		
			
		%>
	</body>
</html>
