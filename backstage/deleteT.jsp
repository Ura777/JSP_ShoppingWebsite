<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
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
				out.print("<font color='#218868' size='5' face='微軟正黑體'><b>欲刪除的資料如下↓</b></font>");
				out.print("</p>");
				
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
				
							sql = "select * from trademember where memberAccount='" + request.getParameter("change") + "';";
							temp = con.createStatement().executeQuery(sql);
							
							
							String account="";
							String AccountPayable="";
							out.print("<center>");
							//訂購者資料
							
							while(temp.next())
							{
								out.print("<table border='1',width='100%'>");
								out.print("<tr>");
								out.print("<td>訂單編號</td>");
								out.print("<td>取貨姓名</td>");
								out.print("<td>取貨方式</td>");
								out.print("<td>手機號碼</td>");
								out.print("<td>送貨地址</td>");
								out.print("<td>會員階級</td>");
								out.print("</tr>");
								out.print("<tr>");
								out.print("<td>" + temp.getString(1) + "</td>");
								out.print("<td>" + temp.getString(2) + "</td>");
								out.print("<td>" + temp.getString(4) + "</td>");
								out.print("<td>" + temp.getString(5) + "</td>");
								out.print("<td>" + temp.getString(6) + "</td>");
								out.print("<td>" + temp.getString(7) + "</td>");
								out.print("</tr>");
								account=temp.getString(3);
								
								
								sql2 = "select * from tradeproduct where memberAccount='" + request.getParameter("change") + "';";
								temp2 = con.createStatement().executeQuery(sql2);
								//訂購商品資料
								out.print("<table border='1',width='100%'>");
								out.print("<tr>");
								out.print("<td>商品編號</td>");
								out.print("<td>商品名稱</td>");
								out.print("<td>商品類型</td>");
								out.print("<td>商品價格</td>");
								out.print("<td>訂購數量</td>");
								out.print("</tr>");
								while(temp2.next())
								{
									out.print("<tr>");
									out.print("<td>" + temp2.getString(3) + "</td>");
									out.print("<td>" + temp2.getString(2) + "</td>");
									out.print("<td>" + temp2.getString(4) + "</td>");
									out.print("<td>" + temp2.getString(5) + "</td>");
									out.print("<td>" + temp2.getString(6) + "</td>");
									out.print("</tr>");
									AccountPayable = temp2.getString(7);
								}
								out.print("</table>");
								out.print("<font size='5' face='微軟正黑體'><b>應付金額(已打折)為" + AccountPayable +"<br>");
								out.print("<font color='#FF0000' size='7' face='微軟正黑體'><b>是否要刪除？</b></font><br>");
								out.print("<form method='POST' action='deleteT2.jsp'>");
								out.print("<input type='hidden' name='change2' value='" + request.getParameter("change") + "'>");
								out.print("<input type='submit' value='確定' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;'>");
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
								out.print("<a href='tradeDelete.jsp'><input type='button' name='button01' value='取消' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>");
								out.print("</form>");
								
							}
							out.print("</table>");
							out.print("</center>");
				
						
							//Step 6: 關閉連線
							con.close();
						
					
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
				out.print("<a href='tradeM.jsp'><input type='button' name='button01' value='按我返回訂單管理系統首頁' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
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
