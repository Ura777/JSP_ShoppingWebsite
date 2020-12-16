<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>修改商品</title>
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
				
							//查詢想要修改的商品資料
							sql = "select * from product where id ='" + request.getParameter("change") + "'";
							temp = con.createStatement().executeQuery(sql);
							
							
							while(temp.next())
							{
		%>						
								<form name="form1" method="post" action="updateP2.jsp">
									<table width="100%">
										<tr>
											<td width="38.5%"></td>
											<td width="5%">商品編號：</td>
											<td><input type="text" name="id" value="<%=temp.getString(1)%>" readonly></td>
										</tr>
										<tr>
											<td width="38.5%"></td>
											<td width="5%">商品名稱：</td>
											<td><input type="text" name="name" value="<%=temp.getString(2)%>"></td>
										</tr>
										<tr>
											<td width="38.5%"></td>
											<td width="4%">商品類型：</td>
											<td>
												<select name="type">
												<%
													if (temp.getString(3).equals("飛機杯"))
													{
														out.print("<option value='飛機杯' selected>飛機杯</option>");
														out.print("<option value='陽具'>陽具</option>");
														out.print("<option value='套套'>套套</option>");
														out.print("<option value='後庭'>後庭</option>");
														out.print("<option value='潤滑液'>潤滑液</option>");
													}
													if (temp.getString(3).equals("陽具"))
													{
														out.print("<option value='飛機杯'>飛機杯</option>");
														out.print("<option value='陽具' selected>陽具</option>");
														out.print("<option value='套套'>套套</option>");
														out.print("<option value='後庭'>後庭</option>");
														out.print("<option value='潤滑液'>潤滑液</option>");
													}
													if (temp.getString(3).equals("套套"))
													{
														out.print("<option value='飛機杯'>飛機杯</option>");
														out.print("<option value='陽具'>陽具</option>");
														out.print("<option value='套套' selected>套套</option>");
														out.print("<option value='後庭'>後庭</option>");
														out.print("<option value='潤滑液'>潤滑液</option>");
													}
													if (temp.getString(3).equals("後庭"))
													{
														out.print("<option value='飛機杯'>飛機杯</option>");
														out.print("<option value='陽具'>陽具</option>");
														out.print("<option value='套套'>套套</option>");
														out.print("<option value='後庭' selected>後庭</option>");
														out.print("<option value='潤滑液'>潤滑液</option>");
													}
													if (temp.getString(3).equals("潤滑液"))
													{
														out.print("<option value='飛機杯'>飛機杯</option>");
														out.print("<option value='陽具'>陽具</option>");
														out.print("<option value='套套'>套套</option>");
														out.print("<option value='後庭'>後庭</option>");
														out.print("<option value='潤滑液' selected>潤滑液</option>");
													}
												%>
												</select>
											</td>
										</tr>
										<tr>
											<td width="38.5%"></td>
											<td width="4%">商品說明：</td>
											<%
												//讓內容會換行
												int index=0;
												String str = temp.getString(4);
												while((index=str.indexOf("<br>"))!=-1)
												{
													str = str.substring(0,index) + "\n" + str.substring(index+4);
												}
											%>
											<td><textarea rows=5 cols=30 name="introduce01"><%=str%></textarea></td>
										</tr>
										<tr>
											<td width="38.5%"></td>
											<td width="4%">商品介紹：</td>
											<%
												//讓內容會換行
												int index2=0;
												String str2 = temp.getString(5);
												while((index2=str2.indexOf("<br>"))!=-1)
												{
													str2 = str2.substring(0,index2) + "\n" + str2.substring(index2+4);
												}
											%>
											<td><textarea rows=5 cols=30 name="introduce02"><%=str2%></textarea></td>
										</tr>
										<tr>
											<td width="38.5%"></td>
											<td width="4%">商品售價：</td>
											<td><input type="text" name="price" value="<%=temp.getString(6)%>"></td>
										</tr>
										<tr>
											<td width="38.5%"></td>
											<td width="4%">商品數量：</td>
											<td><input type="text" name="quantity" value="<%=temp.getString(7)%>"></td>
										</tr>
									</table>
			
									<p align="center">	
										<input type="submit" name="Submit" value="按我修改">
										<input type="Reset" name="Reset" value="重新填寫">
										<a href="productUpdate.jsp"><input type="button" name="Back" value="返回上一頁"></a>
										<br>
										<br>
										<font color="##FF0000" size="5" face="微軟正黑體"><b>*所有欄位均要填寫喔*</b></font>
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
		
				out.print("<p align='center'>");
				out.print("<a href='productM.jsp'><input type='button' name='button01' value='按我返回商品管理系統首頁' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
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
