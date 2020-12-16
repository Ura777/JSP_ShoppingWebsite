<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>add</title>
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
								response.sendRedirect("productAdd.jsp");
							}
							else
							{
								//讓留言內容會換行
								int index=0;
								String str = new_introduce01;
								while((index=str.indexOf("\n"))!=-1)
								{
									str = str.substring(0,index) + "<br>" + str.substring(index+1);
								}
								new_introduce01 = str;
								
								//讓留言內容會換行
								index=0;
								str = new_introduce02;
								while((index=str.indexOf("\n"))!=-1)
								{
									str = str.substring(0,index) + "<br>" + str.substring(index+1);
								}
								new_introduce02 = str;
						
								//Step 4: 執行 SQL 指令 新增	
								sql="insert product (name, type, introduce01, introduce02, price, quantity) ";
								sql+="value ('" + new_name + "', ";
								sql+="'"+new_type+"', ";
								sql+="'"+new_introduce01+"', ";
								sql+="'"+new_introduce02+"', ";   
								sql+="'"+new_price+"', ";
								sql+="'" +new_quantity+"');";
								con.createStatement().execute(sql);
							
								//Step 6: 關閉連線
								con.close();
							
								//Step 5: 顯示結果 
								//直接顯示最新的資料
								response.sendRedirect("viewP.jsp");
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
				
				
				out.print("<br><br>");
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
