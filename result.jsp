<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
	<head><title>查詢結果</title></head>
	<body background='image\bk.gif'>
		<%
			try 
			{
				//Step 1: 載入資料庫驅動程式 
				Class.forName("com.mysql.jdbc.Driver");
				try 
				{
					//Step 2: 建立連線 	
					String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
					String sql="";
					String product_url = "";
					ResultSet temp;
					boolean ck = false;  //用來存放是否有查到結果
					int adNumber = 0;
					int adNumber_previous = 0;
					int adNumber_previous2 = 0;
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
				
						//取得要查詢的關鍵字
						String temp_keyword = request.getParameter("keyword");
						
						//只有填東西才能進行查詢
						if ((temp_keyword=="") ||(temp_keyword==null))
						{
							//Step 6: 關閉連線
							con.close();
							response.sendRedirect("FirstPage.jsp");
						}
						else
						{
							//從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
							String new_keyword=new String(request.getParameter("keyword").getBytes("ISO-8859-1"),"UTF-8");
							
							//Step 4: 執行 SQL 指令	
							sql="select * from product where name like '%" + new_keyword + "%' or type like'%" + new_keyword + "%';";
							temp = con.createStatement().executeQuery(sql);
							
							
							//Step 5: 顯示結果 
							//直接顯示最新的資料	
							out.print("<font color='##FF0000' size='6' face='微軟正黑體'><b>搜尋結果如下：</b></font>" + "<br><br>");
							while(temp.next())
							{
								out.print("<table width='100%'>");
								out.print("<tr><td><font color='#8B2323' size='6' face='微軟正黑體'><b>" + temp.getString(2) + "</b></font></td></tr>");
								out.print("<tr><td><font color='#000000' size='5' face='微軟正黑體'><b>商品類型：" + temp.getString(3) + "</b></font></td></tr>");
								out.print("<tr><td><font color='#0000CD' size='5' face='微軟正黑體'><b>價格：" + temp.getString(6) + "</b></font></td></tr>");
								out.print("<tr><td><font color='#A0522D' size='5' face='微軟正黑體'><b>數量：" + temp.getString(7) + "</b></font></td></tr>");

								//透過商品類別來取得商品的超連結
								if (temp.getString(3).equals("飛機杯"))
								{
									product_url="Product1-2.jsp";
									
								}
								if (temp.getString(3).equals("陽具"))
								{
									product_url="Product3-4.jsp";
								}
								if (temp.getString(3).equals("套套"))
								{
									product_url="Product5-6.jsp";
								}
								if (temp.getString(3).equals("後庭"))
								{
									product_url="Product7-8.jsp";
								}
								if (temp.getString(3).equals("潤滑液"))
								{
									product_url="Product9-10.jsp";
								}
								out.print("<tr><td><a href='" + product_url + "'><input type='button' name='button01' value='點我查看' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;color:red;background-color:#FFFFE0;'></a></td></tr>");
								out.print("</table>");
								out.print("<br>");
								
								//有查到結果就將ck設定為true
								ck=true;
							}
							
							//如果ck==false，代表沒查到資料
							if (ck==false)
							{
								out.print("<tr><td><font color='#FF7F24' size='6' face='微軟正黑體'><b>查無此資料！！！</b></font></td></tr>");
							}
							
							//印出返回搜尋的按鈕
							out.print("<p align='center'><a href='FirstPage.jsp'><input type='button' name='button01' value='按我返回搜尋' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;color:green;background-color:#FFFFE0;'></p></a>");
							
							
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
				}
				catch (SQLException sExec) 
				{
					out.println("SQL錯誤"+sExec.toString());
				}
			}
			catch (ClassNotFoundException err) 
			{
				out.println("class錯誤"+err.toString());
			}
		%>
		
	</body>
</html>