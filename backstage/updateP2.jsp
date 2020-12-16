<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
							String new_type=new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8");
							String new_introduce01=new String(request.getParameter("introduce01").getBytes("ISO-8859-1"),"UTF-8");
							String new_introduce02=new String(request.getParameter("introduce02").getBytes("ISO-8859-1"),"UTF-8");
							String new_price=request.getParameter("price");
							String new_quantity=request.getParameter("quantity");

							//只有填東西才能放進資料庫
							if ((new_name=="") ||(new_type=="") || (new_introduce01=="") || (new_introduce02=="") || (new_price=="") || (new_quantity==""))
							{
								con.close();
								out.print("<font color='red' size='7' face='微軟正黑體'><b>表格必須填滿！</b></font>");
								out.print("<br>");
								out.print("<font size='6' face='微軟正黑體'><b>5秒鐘後將自動轉回商品修改首頁</b></font>");
								out.print("</p>");
								out.print("<meta http-equiv='refresh' content='5;url=productUpdate.jsp'>");
							}
							else
							{
								//讓內容會換行
								int index=0;
								String str = new_introduce01;
								while((index=str.indexOf("\n"))!=-1)
								{
									str = str.substring(0,index) + "<br>" + str.substring(index+1);
								}
								new_introduce01 = str;
								
								//讓內容會換行
								index=0;
								str = new_introduce02;
								while((index=str.indexOf("\n"))!=-1)
								{
									str = str.substring(0,index) + "<br>" + str.substring(index+1);
								}
								new_introduce02 = str;
						
								//先找到目標商品的資料
								sql="select * from product where id='" + request.getParameter("id") + "'";
								temp = con.createStatement().executeQuery(sql);
								
								while(temp.next())
								{
									//Step 4: 執行 SQL 指令 更新
									sql="update product set name='" + new_name + "' ,type='" + new_type + "' ,introduce01='" + new_introduce01 + "' ,introduce02='" + new_introduce02 + "' ,price='" + new_price + "' ,quantity='" + new_quantity + "' where id='" + request.getParameter("id") + "'";
									con.createStatement().execute(sql);
								}
								
							
								//Step 6: 關閉連線
								con.close();
							
								//Step 5: 顯示結果 
								//直接顯示最新的資料
								response.sendRedirect("viewP2.jsp");
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
