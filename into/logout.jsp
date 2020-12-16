<%
session.removeAttribute("id");
//回到上一層(也就是還沒登入過index.html)
response.sendRedirect("../index.html") ;
%>