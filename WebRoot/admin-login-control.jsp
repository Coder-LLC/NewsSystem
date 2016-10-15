<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="newsSystem.Bean.*" %>
<%@ page import="newsSystem.Biz.*" %>
<html>
  <head><title>管理员控制</title></head>
  <body>
  <%
  	request.setCharacterEncoding("utf-8");
    String name=request.getParameter("adminname").trim();
    String password=request.getParameter("pwd").trim();
    Admin admin=new Admin();
    admin.setName(name);
    admin.setPassword(password);
    boolean bol=false;
    bol=AdminBiz.adminLongin(admin);
    if(bol){
    	    session.setAttribute("ADMINLOGIN", name);
    	    session.setMaxInactiveInterval(5*60);
            //设置cookie
    		Cookie admname=new Cookie("admname",name);
            response.addCookie(admname);
    		request.getRequestDispatcher("admin-index.jsp").forward(request, response);
    		}
       else{
    	    request.setAttribute("info","管理员名或密码错误，请重新登陆");
            request.getRequestDispatcher("admin-login.jsp").forward(request,response);
    		}
  %>
  </body>
</html>
