<%@ page import = "java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
	<head>
		<title>刪除會員</title>
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
				out.print("<font color='#218868' size='5' face='微軟正黑體'><b>欲刪除的資料如下↓</b></font>");
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
							sql = "select * from member where id ='" + request.getParameter("change") + "'";
							temp = con.createStatement().executeQuery(sql);
							
							
							out.print("<table border='1',width='100%'>");
							out.print("<tr>");
							out.print("<td width='4%'>會員編號</td>");
							out.print("<td>會員姓名</td>");
							out.print("<td>會員帳號</td>");
							out.print("<td>會員密碼</td>");
							out.print("<td>手機號碼</td>");
							out.print("<td>通訊地址</td>");
							out.print("<td>電子信箱</td>");
							out.print("<td>會員權限</td>");
							out.print("</tr>");
							while(temp.next())
							{
								out.print("<tr>");
								out.print("<td>" + temp.getString(1) + "</td>");
								out.print("<td>" + temp.getString(2) + "</td>");
								out.print("<td>" + temp.getString(3) + "</td>");
								out.print("<td>" + temp.getString(4) + "</td>");
								out.print("<td>" + temp.getString(5) + "</td>");
								out.print("<td>" + temp.getString(6) + "</td>");
								out.print("<td>" + temp.getString(7) + "</td>");
								out.print("<td>" + temp.getString(8) + "</td>");
							}
							out.print("</table>");
							
							out.print("<br>");
							out.print("<p align='center'>");
							out.print("<font color='#FF0000' size='7' face='微軟正黑體'><b>是否要刪除？</b></font><br>");
							out.print("</p>");
							out.print("<table width='100%'>");
							out.print("<tr>");
							out.print("<td width='44.5%'></td>");
							out.print("<td>");
							out.print("<form method='POST' action='deleteM2.jsp'>");
							out.print("<input type='hidden' name='change2' value='" + request.getParameter("change") + "'>");
							out.print("<input type='submit' value='確定' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;'>");
							out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							out.print("<a href='memberDelete.jsp'><input type='button' name='button01' value='取消' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>");
							out.print("</form>");
							out.print("</td>");
							out.print("</tr>");
							out.print("</table>");
							
						
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
