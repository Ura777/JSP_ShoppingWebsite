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
						String new_mail=request.getParameter("mail");
						String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
						String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
						java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
						String new_IP = request.getRemoteAddr();
						
						//只有填東西才能放進資料庫
						if ((new_name=="") ||(new_mail=="") || (new_subject=="") || (new_content==""))
						{
							con.close();
							response.sendRedirect("board.jsp");
						}
						else
						{
							//讓留言內容會換行
							int index=0;
							String str = new_content;
							while((index=str.indexOf("\n"))!=-1)
							{
								str = str.substring(0,index) + "<br>" + str.substring(index+1);
							}
							new_content = str;
						
							//Step 4: 執行 SQL 指令	
							sql="insert guestbook (name, mail, subject, content, putdate, IP) ";
							sql+="value ('" + new_name + "', ";
							sql+="'"+new_mail+"\', ";
							sql+="'"+new_subject+"', ";
							sql+="'"+new_content+"', ";   
							sql+="'"+new_date+"', ";
							sql+="'" +new_IP+"');";
							con.createStatement().execute(sql);
							
							//Step 6: 關閉連線
							con.close();
							
							//Step 5: 顯示結果 
							//直接顯示最新的資料
							response.sendRedirect("view.jsp?page=1");
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
		%>
	</body>
</html>
