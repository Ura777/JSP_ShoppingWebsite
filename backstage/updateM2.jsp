<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
				
							//從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
							String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
							String new_password=request.getParameter("password");
							String new_phone=request.getParameter("phone");
							String new_address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
							String new_mail=request.getParameter("email");
							String new_discount=new String(request.getParameter("discount").getBytes("ISO-8859-1"),"UTF-8");

							//只有填東西才能放進資料庫
							if ((new_name=="") ||(new_password=="") || (new_phone=="") || (new_address=="") || (new_mail=="") || (new_discount==""))
							{
								con.close();
								out.print("<font color='red' size='7' face='微軟正黑體'><b>表格必須填滿！</b></font>");
								out.print("<br>");
								out.print("<font size='6' face='微軟正黑體'><b>5秒鐘後將自動轉回會員修改首頁</b></font>");
								out.print("</p>");
								out.print("<meta http-equiv='refresh' content='5;url=memberUpdate.jsp'>");
							}
							else
							{
								
								//先找到目標會員的資料
								sql="select * from member where id='" + request.getParameter("id") + "'";
								temp = con.createStatement().executeQuery(sql);
								
								while(temp.next())
								{
									//Step 4: 執行 SQL 指令 更新
									sql="update member set name='" + new_name + "' ,password='" + new_password + "' ,phone='" + new_phone + "' ,address='" + new_address + "' ,email='" + new_mail + "' where id='" + request.getParameter("id") + "'";
									con.createStatement().execute(sql);
								}
								
								//更新LogIn
								sql="select * from login where account='" + request.getParameter("account") + "'";
								temp = con.createStatement().executeQuery(sql);
								
								while(temp.next())
								{
									//Step 4: 執行 SQL 指令 更新
									sql="update login set password='" + new_password + "' where account='" + request.getParameter("account") + "'";
									con.createStatement().execute(sql);
								}
								
								//更新權限
								if (!request.getParameter("id").equals("1"))
								{
									String new_level=new String(request.getParameter("level").getBytes("ISO-8859-1"),"UTF-8");
									
									sql="select * from member where id='" + request.getParameter("id") + "'";
									temp = con.createStatement().executeQuery(sql);
									
									while(temp.next())
									{
										//Step 4: 執行 SQL 指令 更新
										sql="update member set level='" + new_level + "', discount='" + new_discount + "' where id='" + request.getParameter("id") + "'";
										con.createStatement().execute(sql);
									}
								}
								
							
								//Step 6: 關閉連線
								con.close();
							
								//Step 5: 顯示結果 
								//直接顯示最新的資料
								response.sendRedirect("viewM2.jsp");
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
