<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
			try
			{
				//載入Database Driver
				Class.forName("com.mysql.jdbc.Driver");
				try
				{
					//Bulid Connection
					String url = "jdbc:mysql://localhost/";
					String sql = "";
					boolean check = false;
					ResultSet temp;
					int count = 0;
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
					
						if(((request.getParameter("id")==null)||(request.getParameter("id")=="")) && ((request.getParameter("pwd")==null)||(request.getParameter("pwd")=="")))
						{
							con.close();
							response.sendRedirect("Menu.jsp");
						}
						else
						{

							//驗證帳號密碼
							sql = "select * from login where account = ? and password = ? ;";
							PreparedStatement pstmt = null;
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1,request.getParameter("id"));
							pstmt.setString(2,request.getParameter("pwd"));
							
							temp = pstmt.executeQuery();
							
    
							if(temp.next())
							{            
								session.setAttribute("id",request.getParameter("id"));
								response.getWriter().write("<script>window.parent.location.href='into/user.jsp';</script>");
							}
							else
							{
								response.getWriter().write("<script>window.parent.location.href='alert.html';</script>");
							}
						}
					}
					
					//關閉連線
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

%>