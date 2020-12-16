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
							String new_account=request.getParameter("account");
							String new_password=request.getParameter("password");
							String new_phone=request.getParameter("phone");
							String new_address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
							String new_mail=request.getParameter("email");

							
							//只有填東西才能放進資料庫
							if ((new_name=="") ||(new_account=="") || (new_password=="") || (new_phone=="") || (new_address=="") || (new_mail==""))
							{
								con.close();
								response.sendRedirect("memberAdd.jsp");
							}
							else
							{
								
								//Step 4: 執行 SQL 指令 新增	
								sql="insert member (name, account, password, phone, address, email) ";
								sql+="value ('" + new_name + "', ";
								sql+="'"+new_account+"', ";
								sql+="'"+new_password+"', ";
								sql+="'"+new_phone+"', ";   
								sql+="'"+new_address+"', ";
								sql+="'" +new_mail+"');";
								con.createStatement().execute(sql);
								
								sql="insert login (account, password) ";
								sql+="value ('" + new_account + "', ";
								sql+="'" +new_password+"');";
								con.createStatement().execute(sql);
							
								//Step 6: 關閉連線
								con.close();
							
								//Step 5: 顯示結果 
								//直接顯示最新的資料
								response.sendRedirect("viewM.jsp");
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
