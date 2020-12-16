<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>購物車</title>
	</head>
	<body background='image\view.jpg'>
		<%
			if(session.getAttribute("id") != null )
			{
				
				
				
				
				try
			{
				//載入Database Driver
				Class.forName("com.mysql.jdbc.Driver");
				try
				{
					//Bulid Connection
					String url = "jdbc:mysql://localhost/";
					String sql = "";
					ResultSet temp;
					Connection con = DriverManager.getConnection(url, "root", "696969888");
					
					//測試是否連線成功
					if (con.isClosed())
					{
						out.print("連線失敗");
					}
					else
					{
						//選擇Database
						sql = "use mydatabase";
						con.createStatement().execute(sql);
						
						//取得session設定的ID
						Object obj = session.getAttribute("id");
						String getID = String.valueOf(obj);
						String myName = "";
						
						//執行SQL指令：查詢資料
						sql = "select * from member where account='" + getID + "'";
						temp = con.createStatement().executeQuery(sql);
						
						//利用迴圈印出每筆資料
						while(temp.next())
						{
							myName = temp.getString(2);
						}
						out.print("<br></br><br></br><br></br><br></br>");
						out.print("<font Color='#8E388E' size='6' face='微軟正黑體'><b><center><u>" + myName + "</u>安安ﾟ▽ﾟノ<br>歡迎使用以下的功能OωO</center></b></font>");
						
						
					}
					con.close();
				}
				catch(SQLException sExec)
				{
					out.print("SQL錯誤" + "<br>" + sExec.toString());
				}
			}
			catch(ClassNotFoundException err)
			{
				out.print("Class錯誤" + "<br>" + err.toString());
			}
				
				
				out.print("<p align='center'>");
				out.print("<a href='Cartlook.jsp'><input type='button' name='button01' value='查看購物車' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:red;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("<a href='Carttransfer.jsp'><input type='button' name='button01' value='我要結帳了' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:blue;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("<br>");
				out.print("<br>");
				out.print("<a href='Member.jsp'><input type='button' name='button01' value='回到會員區' style='font-size:200%;font-family:Microsoft JhengHei;font-weight:bold;color:green;'></a>" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				out.print("</p>");
			}
			else
			{
				out.print("<meta http-equiv='refresh' content='0;url=outtime.jsp'>");
			}
		%>

	</body>
</html>