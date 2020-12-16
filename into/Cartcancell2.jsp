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

							String new_temptradeid=request.getParameter("change3");

							//只有填東西才能放進資料庫
							if ((new_temptradeid==""))
							{
								con.close();
								response.sendRedirect("fail.jsp");
							}
							else
							{
								
								//Step 4: 執行 SQL 指令 新增	
								sql = "delete from temptrade where id='" + new_temptradeid + "';";
								con.createStatement().execute(sql);
							
								//Step 6: 關閉連線
								con.close();
							
								//Step 5: 顯示結果 
								//直接顯示最新的資料
								response.sendRedirect("Cartcancell3.jsp");
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
				
				
				
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}

			
			
		%>
	</body>
</html>
