<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>修改會員資料</title>
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
				
							//查詢想要修改的會員資料
							sql = "select * from member where id ='" + request.getParameter("change") + "'";
							temp = con.createStatement().executeQuery(sql);
							
							
							while(temp.next())
							{
		%>						
								<form name="form1" method="post" action="updateM2.jsp">
									<table width="100%" border="0">
										<tr>
											<td width="42.5%"></td>
											<td width="5%">會員編號：</td>
											<td><input type="text" name="id" value="<%=temp.getString(1)%>" readonly></td>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="5%">會員姓名：</td>
											<td><input type="text" name="name" value="<%=temp.getString(2)%>"></td>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="4%">會員帳號：</td>
											<td><input type="text" name="account" value="<%=temp.getString(3)%>" readonly></td>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="4%">會員密碼：</td>
											<td><input type="text" name="password" value="<%=temp.getString(4)%>"></td>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="4%">手機號碼：</td>
											<td><input type="text" name="phone" value="<%=temp.getString(5)%>"></td>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="4%">通訊地址：</td>
											<td><input type="text" name="address" value="<%=temp.getString(6)%>"></td>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="4%">電子信箱：</td>
											<td><input type="text" name="email" value="<%=temp.getString(7)%>"></td>
										</tr>
										<tr>
											<%
												if (!temp.getString(1).equals("1"))
												{
											%>
													<td width="38.5%"></td>
													<td width="4%">會員權限：</td>
													<td>
														<select name="level">
											
														<%
															if (temp.getString(8).equals("GM"))
															{
																out.print("<option value='GM' selected>GM</option>");
																out.print("<option value='碧池'>碧池</option>");
																out.print("<option value='一般'>一般</option>");
															}
															if (temp.getString(8).equals("碧池"))
															{
																out.print("<option value='GM'>GM</option>");
																out.print("<option value='碧池' selected>碧池</option>");
																out.print("<option value='一般'>一般</option>");
															}
															if (temp.getString(8).equals("一般"))
															{
																out.print("<option value='GM'>GM</option>");
																out.print("<option value='碧池'>碧池</option>");
																out.print("<option value='一般' selected>一般</option>");
															}
														%>
														</select>
													</td>
											<%		
												}
											%>
										</tr>
										<tr>
											<td width="42.5%"></td>
											<td width="4%">會員優惠：</td>
											<td>
														<select name="discount">
											
														<%
															if (temp.getString(8).equals("GM"))
															{
																out.print("<option value='5折' selected>5折</option>");
															}
															if (temp.getString(8).equals("碧池"))
															{
																out.print("<option value='8折' selected>8折</option>");
																out.print("<option value='9折'>9折</option>");
															}
															if (temp.getString(8).equals("一般"))
															{
																out.print("<option value='8折'>8折</option>");
																out.print("<option value='9折' selected>9折</option>");
															}
														%>
														</select>
													</td>
										</tr>
									</table>
			
									<p align="center">	
										<input type="submit" name="Submit" value="按我修改">
										<input type="Reset" name="Reset" value="重新填寫">
										<a href="memberUpdate.jsp"><input type="button" name="Back" value="返回上一頁"></a>
										<br>
										<br>
									<%	
										if (temp.getString(1).equals("1"))
										{
											out.print("<font color='##FF0000' size='5' face='微軟正黑體'><b>*因為此人為初始GM，只有此人才能進入後台，因此不用調整權限*</b></font><br>");
										}
										
									%>	
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
				out.print("<a href='memberM.jsp'><input type='button' name='button01' value='按我返回會員管理系統首頁' style='font-size:150%;font-family:Microsoft JhengHei;font-weight:bold;'></a><br>");
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
