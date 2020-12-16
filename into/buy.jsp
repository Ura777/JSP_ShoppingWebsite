<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>新增至購物車</title>
	</head>
	<body background='image\view.jpg'>
		<%
			if(session.getAttribute("id") != null )
			{
				out.print("<br></br><br></br><br></br><br></br>");
				out.print("<p align='center'>");
				out.print("<font color='##0000FF' size='6' face='微軟正黑體'><b>");
				out.print("以下是您要放入購物車中的商品↓<br>");
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
							sql = "select * from product where id ='" + request.getParameter("change") + "'";
							temp = con.createStatement().executeQuery(sql);
							
							
							while(temp.next())
							{
		%>						
								<form name="form1" method="post" action="buy2.jsp">
									<table width="100%">
										<tr>
											<td width="36%"></td>
											<td width="8%"><font size="5" face="微軟正黑體" color="#A52A2A"><b>商品名稱：</b></font></td>
											<td><input type="text" name="name" value="<%=temp.getString(2)%>" readonly style="font-size:100%;"></td>
										</tr>
										<tr>
											<td></td>
											<td><font size="5" face="微軟正黑體" color="#698B22"><b>商品類型：</b></font></td>
											<td><input type="text" name="type" value="<%=temp.getString(3)%>" readonly style="font-size:100%;"></td>	
										</tr>
										<tr>
											<td></td>
											<td><font size="5" face="微軟正黑體" color="#CD3333"><b>商品售價：</b></font></td>
											<td><input type="text" name="price" value="<%=temp.getString(6)%>" readonly style="font-size:100%;"></td>
										</tr>
										<tr>
											<td></td>
											<td><font size="5" face="微軟正黑體" color="#EE5C42"><b>購買數量：</b></font></td>
											<td><input type="text" name="quantity" value="1" style="font-size:100%;"></td>
										</tr>
										<%
											out.print("<input type='hidden' name='productid' value='" + temp.getString(1) + "'>");
										%>
									</table>
						
								<%
									//取得session設定的ID
									Object obj = session.getAttribute("id");
									String getID = String.valueOf(obj);
									String myAccount = "";
						
									//執行SQL指令：查詢資料
									sql = "select * from member where account='" + getID + "'";
									temp = con.createStatement().executeQuery(sql);
						
									//利用迴圈印出每筆資料
									while(temp.next())
									{
										myAccount = temp.getString(3);
									}
									out.print("<input type='hidden' name='account' value='" + myAccount + "'>");
								%>
									
									<p align="center">	
										<input type="submit" name="Submit" value="按我放入購物車" style="font-size:150%;color:blue;font-family:Microsoft JhengHei;font-weight:bold;">
										<input type="Reset" name="Reset" value="重新填寫" style="font-size:150%;color:FireBrick;font-family:Microsoft JhengHei;font-weight:bold;">
										<br>
										<br>
										<font color="##FF0000" size="6" face="微軟正黑體"><b>*所有欄位均要填寫喔*</b></font>
									</p>
								</form>
	
		<%						
							}
						
						
							
						
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
		

				out.print("<form name='fffff' method='POST' action='Product1-2.jsp'>");
				out.print("<table width='100%'>");
				out.print("<tr>");
				out.print("<td width='38.5%'></td>");
				out.print("<td width='7%'></td>");
				out.print("<td><input type='submit' name='button01' value='按我繼續逛' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;color:green'><br></td>");
				out.print("</tr>");
				out.print("</table>");
				out.print("</form>");

			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		%>	

	</body>
</html>
