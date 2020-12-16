<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>刪除訂單</title>
</head>
	<body>
		<%
		

			if(session.getAttribute("id") != null )
			{
				out.print("<p align='center'>");
				out.print("<font size='5' face='微軟正黑體'><b>");
				out.print("管理員" + session.getAttribute("id") + "你好<br>");
				out.print("<a href='logout.jsp'><input type='button' name='button01' value='登出' style='font-size:100%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
				out.print("</b></font>");
				out.print("<br>");
				
				//新增商品
				try 
				{
					//Step 1: 載入資料庫驅動程式 
					Class.forName("com.mysql.jdbc.Driver");
					try 
					{
						//Step 2: 建立連線 	
						String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
						String sql="";
						String sql2="";
						String sql3="";
						String sql4="";
						ResultSet temp;
						ResultSet temp2;
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
							//out.print(request.getParameter("change2") + "<br>");
							String account = request.getParameter("change2");
							
							//刪除訂購者
							sql="select * from trademember where memberAccount='" + account + "';";
							temp = con.createStatement().executeQuery(sql);
								
							while(temp.next())
							{
								//Step 4: 執行 SQL 指令 刪除trademember
								sql="delete from trademember where memberAccount='" + account + "';";
								con.createStatement().execute(sql);
							}
							
							//刪除訂單-先找到tradeproduct
							sql="select * from tradeproduct where memberAccount='" + account + "'";
							temp = con.createStatement().executeQuery(sql);	
							
							//temp是tradeproduct
							while(temp.next())
							{
								String productid = temp.getString(3);
								//先用訂單內的productID去product找到正確的商品
								sql2="select * from product where id='" + productid + "';";
								temp2 = con.createStatement().executeQuery(sql2);
								
								//temp2是product
								while(temp2.next())
								{
									//取出prdouct的數量
									String getQ = temp2.getString(7);
									int Q_inProductDB = Integer.parseInt(getQ);

									
									//取出tradeproduct的數量
									getQ = temp.getString(6);
									int Q_inTradeProductDB = Integer.parseInt(getQ);

									
									int newQuantity = Q_inProductDB+Q_inTradeProductDB;

									
									//更新product內的數量
									sql3 = "update product set quantity='" + newQuantity + "' where id='" + productid + "';";
									con.createStatement().execute(sql3);
								}
								
								//Step 4: 執行 SQL 指令 刪除tradeproduct
								sql4="delete from tradeproduct where memberAccount='" + account + "';";
								con.createStatement().execute(sql4);
							}
							
							//Step 6: 關閉連線
							con.close();
							
							//Step 5: 顯示結果 
							//直接顯示最新的資料
							response.sendRedirect("viewT3.jsp");
							
						
					
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
				
				out.print("<p align='center'>");
				out.print("<a href='user.jsp'><input type='button' name='button01' value='按我返回系統首頁' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
				out.print("</p>");
			}
			else
			{
				out.print("<p align='center'>");
				out.print("<font color='red' size='7' face='微軟正黑體'><b>您尚未登入，請登入！</b></font>");
				out.print("<br>");
				out.print("<font size='6' face='微軟正黑體'><b>3秒鐘後將自動轉回登錄頁面</b></font>");
				out.print("</p>");
				out.print("<meta http-equiv='refresh' content='3;url=login.html'>");
			}

			
			
		%>
	</body>
</html>
