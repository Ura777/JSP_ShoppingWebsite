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
						ResultSet temp;
						if(con.isClosed())
						{
							out.println("連線建立失敗");
						}
						else 
						{
							//Step 3: 選擇資料庫   
							sql="use mydatabase";
							con.createStatement().execute(sql);
							
							//處理訂單會員的部分
							Object obj = session.getAttribute("id");
							String memberID = String.valueOf(obj);
							String addAccount = "";
							String addLevel = "";
							String addName = new String(request.getParameter("memberName").getBytes("ISO-8859-1"),"UTF-8");
							String addPhone = request.getParameter("memberPhone");
							String addTradeWay = new String(request.getParameter("memberTradeWay").getBytes("ISO-8859-1"),"UTF-8");
							String addAddress = new String(request.getParameter("myAddress").getBytes("ISO-8859-1"),"UTF-8");
							//執行SQL指令：查詢會員的ID
							sql = "select * from member where account='" + memberID + "'";
							temp = con.createStatement().executeQuery(sql);
							while(temp.next())
							{
							
								addAccount = temp.getString(3);
								addLevel = temp.getString(8);

							}
							//放入會員的資訊
								sql="insert trademember(memberName, memberAccount, tradeWay, memberPhone, memberAddress, memberLevel) ";
								sql+="value ('" + addName + "', ";
								sql+="'"+addAccount+"', "; 
								sql+="'"+addTradeWay+"', ";
								sql+="'"+addPhone+"', ";
								sql+="'"+addAddress+"', ";
								sql+="'" +addLevel+"');";
								con.createStatement().execute(sql);
							
							
							
							//處理訂單商品的部分
							sql = "select * from temptrade where memberAccount='" + addAccount + "'";
							temp = con.createStatement().executeQuery(sql);
							String addProductName = "";
							String addProductID = "";
							String addProductType = "";
							String addProductPrice = "";
							String addProductQuantity = "";
							String total="0";
							
							temp.last();
							int row = temp.getRow();
							sql = "select * from temptrade where memberAccount='" + addAccount + "'";
							temp = con.createStatement().executeQuery(sql);
							
							//放入產品的資訊
							for (int i=1; i<=row; i++)
							{
								while(temp.next())
								{
									addProductName = temp.getString(2);
									addProductID = temp.getString(3);
									addProductType = temp.getString(4);
									addProductPrice = temp.getString(5);
									addProductQuantity = temp.getString(6);
									addAccount = temp.getString(7);
									break;
									
								}
									if (i==row)
									{
										Object obj2 = session.getAttribute("total");
										total = String.valueOf(obj2);
										sql="insert tradeproduct (prdouctName, productID, productType, productPrice, productQuantity, total, memberAccount) ";
										sql+="value ('" + addProductName + "', ";
										sql+="'"+addProductID+"', ";
										sql+="'"+addProductType+"', ";
										sql+="'"+addProductPrice+"', ";   
										sql+="'"+addProductQuantity+"', ";
										sql+="'"+total+"', ";
										sql+="'" +addAccount+"');";
										con.createStatement().execute(sql);
									}
									else
									{
										sql="insert tradeproduct (prdouctName, productID, productType, productPrice, productQuantity, total, memberAccount) ";
										sql+="value ('" + addProductName + "', ";
										sql+="'"+addProductID+"', ";
										sql+="'"+addProductType+"', ";
										sql+="'"+addProductPrice+"', ";   
										sql+="'"+addProductQuantity+"', ";
										sql+="'"+total+"', ";
										sql+="'" +addAccount+"');";
										con.createStatement().execute(sql);
									}
									
							}	
							
							
							
							
							
							
							
							
							//清空購物車
							sql = "delete from temptrade where memberAccount='" + addAccount + "'";
							con.createStatement().execute(sql);
							
							//清掉session total
							session.removeAttribute("total");
							
							//存貨控制
							String soldOutID = "";
							String soldOutStr = "";
							String sql2 = "";
							String sql3 = "";
							ResultSet temp2;
							int total2 = 0;

							
							//同步
							sql="select productID, productQuantity from tradeproduct where memberAccount = '" + memberID + "';";
							temp = con.createStatement().executeQuery(sql);
							while(temp.next())
							{
							
								soldOutID = temp.getString(1);
								soldOutStr = temp.getString(2);
								
								//out.print("先取得tradeproduct內的商品id跟數量<br>");
								//out.print("soldOutID = " + soldOutID + "<br>");
								//out.print("soldOutStr = " + soldOutStr + "<br>");
								
								//先轉換成int
								int slodOut = Integer.parseInt(soldOutStr);
								
								//out.print("將soldOutStr轉換成slodOut<br>");
								//out.print("slodOut = " + slodOut + "<br>");
								
								//找product內相同ID的商品
								sql2="select quantity from product where id = '" + soldOutID + "';";
								temp2 = con.createStatement().executeQuery(sql2);
								while(temp2.next())
								{
									//取出存貨數量
									String getQuantity = temp2.getString(1);
									int Q_inDB = Integer.parseInt(getQuantity);
									
									//out.print("Q_inDB = " + Q_inDB + "<br>");
									
									//跟賣出去的相減
									
									total2 = (Q_inDB - slodOut);
									
									//out.print("total2 = " + total2 + "<br>");
									
									//更新
									sql3="update product set quantity='" + total2 + "' where id = '" + soldOutID + "';";
									  
									con.createStatement().execute(sql3);
								}

							}
							
							
							//Step 6: 關閉連線
							con.close();
							
							//Step 5: 顯示結果 
							//直接顯示最新的資料
							response.sendRedirect("Carttransfer5.jsp");
								
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
