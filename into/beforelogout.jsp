<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
	response.getWriter().write("<script>window.parent.location.href='logout.jsp';</script>");
%>