<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
	if(((request.getParameter("id")==null)||(request.getParameter("id")=="")) && ((request.getParameter("pwd")==null)||(request.getParameter("pwd")=="")))
	{
		response.sendRedirect("login.html");
	}
	else
	{
		Object obj = request.getParameter("id");
		String id = String.valueOf(obj);
		obj = request.getParameter("pwd");
		String pwd = String.valueOf(obj);
		
		if(id.equals("dllm1020GM") && pwd.equals("dick30"))
		{            
			session.setAttribute("id",request.getParameter("id"));
			response.sendRedirect("user.jsp") ;
		}
		else
		{
			out.print("<p align='center'>");
			out.print("<font color='red' size='7' face='微軟正黑體'><b>帳號密碼不符合！</b></font>");
			out.print("</p>");
			out.print("<meta http-equiv='refresh' content='3;url=login.html'>");
		}
	}
%>