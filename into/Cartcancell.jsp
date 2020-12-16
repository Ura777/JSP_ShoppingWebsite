<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>修改至購物車</title>
	</head>
	<body background='image\view.jpg'>
		<%
			if(session.getAttribute("id") != null )
			{
				out.print("<br></br><br></br><br></br><br></br>");
				out.print("<p align='center'>");
				out.print("<font color='##0000FF' size='5' face='微軟正黑體'><b>");
				out.print("以下是您購物車中要刪除的清單內容↓<br>");
				out.print("</b></font>");
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
				
							//查詢想要新增的商品資料
							sql = "select * from tempTrade where id ='" + request.getParameter("change2") + "'";
							temp = con.createStatement().executeQuery(sql);
							
							
							out.print("<center>");
							out.print("<table border='1',width='100%'>");
							out.print("<tr>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;清 單&nbsp;<br>編 號</b></font></td>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>名 稱</b></font></td>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>編 號</b></font></td>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>類 型</b></font></td>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;商 品&nbsp;<br>價 格</b></font></td>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;購 買&nbsp;<br>數 量</b></font></td>");
							out.print("<td align='center'><font Color='#000000' size='5' face='微軟正黑體'><b>&nbsp;結帳金額&nbsp;<br>(尚未打折)</b></font></td>");
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
							out.print("<br>");
							out.print("<form name='f2' method='POST' action='Cartcancell2.jsp'>");
						out.print("<input type='hidden' name='change3' value='" + request.getParameter("change2") + "'>");
						out.print("<input type='submit' value='確定要刪除?' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;background-color:#FFFFE0;'>");
						out.print("</form>");
							
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
				out.print("<a href='Cartlook.jsp'><input type='button' name='button01' value='回到上一頁' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
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
